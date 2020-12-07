class Selection < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :reason, presence: true, length: {minimum: 15, maximum: 250}


end
