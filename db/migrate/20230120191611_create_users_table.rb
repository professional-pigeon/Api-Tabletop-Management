class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, index: { unique: true, name: 'unique_user_name' }
      t.string :email, null: false, index: { unique: true, name: 'unique_emails' }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
