
class AccountsController < ApplicationController

  def create
    Account.create(account_params)
  end

  private
  def account_params
    params.require(:account).permit(:Account_name)
  end
end
