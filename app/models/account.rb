class Account < ApplicationRecord
  class << self
    def account_user(current_user)
      Account.where(user_id: current_user.id).to_a
    end

    def invitation_user(current_user)
      Invitation.where(user_id: current_user.id)
    end

    def all_accs(current_user)
      @accounts = account_user(current_user)
      @invitations = invitation_user(current_user)
      @invitations.each do |u|
        account = Account.find_by(id:u.account_id)
        debugger
        @accounts.push(account)
     end
      @accounts 
    end


    def invitation_account(account)
       Invitation.where(account_id: account.id) 
    end
     
     def account_owner(account)
       User.find_by(id:account.user_id)
     end

     def show_user_account(account)
         account_owner =  account_owner(account)
         invitation_account(account)
         @users = Array.new
         @users.push(account_owner)
         invitation_account(account).each do |u|
           if u.user_id.present?
             u = User.find_by(id: u.user_id)
             @users.push(u)
           end
         end
         @users
     end

  end
end
