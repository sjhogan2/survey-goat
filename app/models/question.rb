class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers

  validates :question, presence: true
  validates :kind, presence: true

end
