class HomeController < ApplicationController
  def home
  end

  def contact
  end

  #Creates a request_contact action so users can deliver their message using the contact form. Only accepts valid and non blank emails.
  def request_contact

    email = params[:email]
    firstname = params[:firstname]
    surname = params[:surname]
    message = params[:message]

    if email.blank? or !validEmail(email)
      flash[:alert] = "Sorry, your email has not been sent. Please try again with a valid email address. "
      else
      ContactMailer.contact_email(email, firstname, surname, message).deliver_now
      flash[:notice] = "Your email has been successfully sent! A response will soon be on it's way :)"
    end
    redirect_to root_path
  end
    private

    def validEmail(input)
      return  input.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end

end
