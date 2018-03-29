class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
     t.integer :user_id
     t.integer :account_id
     t.string :email

      t.timestamps
    end
  end
end
