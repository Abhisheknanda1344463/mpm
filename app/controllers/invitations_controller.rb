class InvitationsController < ApplicationController

    def get_email

        @email = valid_params[:email]
        @account_id = valid_params[:account_id]    
        check = User.find_by(email: @email)
            debugger
        if check == nil
            Invitation.create(email: @email , account_id: @account_id)
            debugger
        else
            Invitation.create(email: @email , account_id: @account_id, user_id: check.id)
            debugger
        end
        InviteMailer.invitation(@email, @account_id).deliver_now
    end
    
    def check_user
        check = User.find_by(email: params[:email])
        debugger
        email = params[:email]
        account_id = params[:account_id]
         debugger

        if check == nil
           debugger 
            redirect_to new_user_registration_path(email1: email , acc_id1: account_id )
        else
            redirect_to new_user_session_path
        end
    end

   def create 
     @invite = Invitation.new(valid_params)
   end


     private

    def valid_params
	    params.require(:invitation).permit(:email,:account_id)
    end

 

end
