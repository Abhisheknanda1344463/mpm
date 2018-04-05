module ApplicationHelper

  def member_or_owner(user_id,account)
    if user_id == account.user_id
      return "Owner"
    else
      return "Member"
    end
  end

  def owner(account)
    @owner = User.find_by(id: account.user_id)
     return @owner.name
  end
   
  end



