class HomeController < ApplicationController
  def home
  end

  def contact
  end
  def request_contact

    email = params[:email]
    firstname = params[:firstname]
    surname = params[:surname]
    message = params[:message]

    if email.blank? or !validEmail?(email)
      flash[:alert] = "Sorry, your email has not been sent. Please try again with a valid email address. "
      else
      ContactMailer.contact_email(email, firstname, surname, message).deliver_now
      flash[:notice] = "Your email has been successfully sent! A response will soon be on it's way :)"
      redirect_to contact_path
  end


  private

  def validEmail?(email)
    return false unless email.eql?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
  end
end
