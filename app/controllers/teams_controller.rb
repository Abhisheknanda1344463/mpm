class TeamsController < ApplicationController

def index
end

def create
  debugger
  @team = Team.new()
  @team.Team_name = params[:team][:Team_name]
  @team.account_id = params[:account_id]
 
  if @team.save
    redirect_to  account_path(params[:account_id])
  else  
     flash[:alert] = "Teams Not Saved"
  end
end


 def show
   @team = Team.find(params[:id])
   @account = Account.find(params[:account_id])
   @member_selection = Member.where(team_id: @team.id)
   debugger
   @members = Array.new
   @member_selection.each do |ul|
     user = User.find_by(id: ul.user_id)
     @members.push(user)
     debugger
   end
       @members

   @account = Account.find(params[:account_id])
   @teams = Team.find(params[:id])
   @users_in_teams = Invitation.where(account_id: @account.id)
   @users = Array.new
   @users_in_teams.each do |u|
      user_id = u.user_id
      u = User.find_by(id: user_id)
      debugger
      @users.push(u)
    end
    @users
    end
    
   def get_user
    @m = params[:ids]
    @team = Team.find(params[:team][:team_id])
    @account = Account.find(params[:team][:account_id])
    @m.each do |u| 

    Member.create(team_id: params[:team][:team_id],user_id: u)

    redirect_to account_team_path(params[:team][:account_id],params[:team][:team_id])

    end


   end


private
def create_teams
  params.require(:team).permit(:Team_name,:account_id,:user_id)
end
end
