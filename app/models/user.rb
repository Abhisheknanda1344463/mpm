class User < ApplicationRecord
attr_accessor :account_name,:acc_id1,:email1

  
after_create :create_accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_accounts
     if acc_id1.present? && email1.present?
            debugger
            Invitation.where("account_id = ? AND email = ?" , acc_id1 , email1).update(user_id: self.id)
        else
            Account.create(user_id: self.id , account_name: account_name)
        end
  end
end
