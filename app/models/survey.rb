class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :user, presence: true
end
