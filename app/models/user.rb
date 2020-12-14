class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :selections
  has_many :courses, through: :selections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
#Assigns username of user as the front half of their email address.
  def username
    return self.email.split('@')[0].capitalize
  end

  #A user is able to add a new module selection as long as they have not reached the limit of 60 credits and haven't chosen a selection
  # of the same title.
  def can_add_selection?(selection_title, user_id)
    under_credits_limit? && !selection_already_chosen?(selection_title, user_id)
  end

  #Credit limit is set at 60.
  def under_credits_limit?
    selections.sum(:credits) < 60
  end

  #User has already chosen the selection if the selection with their user_id is present in the database.
  def selection_already_chosen?(selection_title, user_id)
    selection = Selection.in_db(selection_title, user_id)
    return false unless selection
    selections.where(id: selection.id).exists?
  end

end
