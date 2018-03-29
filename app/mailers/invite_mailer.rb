class InviteMailer < ApplicationMailer

  def  invitation(email,id)
    @email = email
    @ac_id = id
    mail(to: @email,subject: "Invitation to User")
  end

end
