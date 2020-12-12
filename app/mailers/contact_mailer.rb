class ContactMailer < ApplicationMailer

  def contact_email(email, firstname, surname, message)
    @email = email
    @firstname = firstname
    @surname = surname
    @message = message

    mail cc: @email
  end
end


