class Selection < ApplicationRecord
  validates :title, presence: true
  validates :reason, presence: true, length: {minimum: 15, maximum: 250}
end
