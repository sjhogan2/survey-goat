class User < ApplicationRecord
  has_many :surveys

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    user = User.where("LOWER(email)=?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      false
    end
  end

end
