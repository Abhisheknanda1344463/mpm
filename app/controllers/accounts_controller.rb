
class AccountsController < ApplicationController
 before_action :authenticate_user!

def index
        user_id = current_user.id
        check_for_account = Account.find_by(user_id: user_id)
        if check_for_account == nil
            #normal user
            @accounts = Array.new
            @invitations = Invitation.where(user_id: user_id)
            @invitations.each do |invite|
                acc_id = invite.account_id
                account = Account.find_by(id: acc_id)
                @accounts.push(account)
                end
            @accounts
        else
            @accounts = Account.where(user_id: current_user.id)
        end
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
