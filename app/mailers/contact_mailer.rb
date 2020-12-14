class ContactMailer < ApplicationMailer

  #Defines parameters required for contact email
  def contact_email(email, firstname, surname, message)
    @email = email
    @firstname = firstname
    @surname = surname
    @message = message

    mail cc: @email, subject: "Inquery"
  end
end


