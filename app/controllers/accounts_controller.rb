
class AccountsController < ApplicationController
 before_action :authenticate_user!

def index
  @accounts = Account.all_accs(current_user)
 end

def show

  @account = Account.find(params[:id])
  @users_in_account = Invitation.where(account_id: @account.id)
  @users = Array.new
  @users_in_account.each do |u|
      user_id = u.user_id
        u = User.find_by(id: user_id)
        debugger
        @users.push(u)
        end
      @users

      @teams = Team.where(account_id: @account.id) 

end
 

private
   def valid_params
     params.require(:account).permit(:account_name)
   end

end
     def users_in_accounts(account) #show page of particular account..
      owner = owner_of_account(account)
      users_in_account = all_invitations_through_account_id(account)
      @users = []
      @users.push(owner)
      users_in_account.each do |user|
        if user.user_id.present?
          user = User.find_by(id: user.user_id)
          @users.push(user)
        end
      end
       @users
    end

    def all_invitations_through_account_id(account)
       Invitation.where(account_id: account.id)
    en
    d
    def owner_of_account(account)
       User.find_by(id: account.user_id)
    end
  end
end
 
