class TeamsController < ApplicationController
def index
end

def create
  debugger
  @team = Team.new()
  @team.Team_name = params[:team][:Team_name]
  @team.account_id = params[:account_id]
  debugger
  if @team.save
    redirect_to  account_path(params[:account_id])
  else
  
    @team
  end

end


def create_teams
params.require(:team).permit(:Team_name,:account_id)
end
end
