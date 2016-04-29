require 'gravtastic'
class User < ApplicationRecord
  include Gravtastic

  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, :presence => true, :confirmation =>true
  before_create {generate_token(:auth_token)}
  after_initialize :def
  has_many :reviews

  is_gravtastic :default => "mm"

  # auth token
  def generate_token(column)
    begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
  end

  # set default NOT admin!
  def def
    # will set the default value
    self.is_admin ||= false
  end

end
