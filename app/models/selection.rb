class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :title, presence: true
  validates :reason, presence: true, length: {minimum: 15, maximum: 250}

  def self.in_db(selection_title, user_id)
    where(title: selection_title, user_id: user_id).first
  end

end
