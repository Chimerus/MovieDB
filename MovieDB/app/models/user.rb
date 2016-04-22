class User < ApplicationRecord
  has secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, :presence => true, :confirmation =>true
  before_create {generate_token(:auth_token)}

  # auth token
  def generate_token(column)
    begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
  end
end
