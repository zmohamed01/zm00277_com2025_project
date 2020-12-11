class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :selections
  has_many :courses, through: :selections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  def username
    return self.email.split('@')[0].capitalize
  end

  def can_add_selection?(selection_title, user_id)
    under_credits_limit? && !selection_already_chosen?(selection_title, user_id)
  end

  def under_credits_limit?
    selections.sum(:credits) < 60
  end

  def selection_already_chosen?(selection_title, user_id)
    selection = Selection.in_db(selection_title, user_id)
    return false unless selection
    selections.where(id: selection.id).exists?
  end

end
