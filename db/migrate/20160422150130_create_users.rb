class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.string :picture
      t.boolean :is_admin
      t.timestamps
    end
  end
end
