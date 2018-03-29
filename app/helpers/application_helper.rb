module ApplicationHelper

def member_or_owner(user_id)
        check = Account.find_by(user_id: user_id)
         if check == nil
             return "Member"
         else
             return "Owner"
        end
    end
    def show_add_user_or_not(user_id)
        check = Account.find_by(user_id: user_id)
         if check == nil
             return "Member"
         else
             return "Owner"
        end
        
    end 

end
