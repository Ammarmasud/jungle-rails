class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :email, presence: true, uniqueness: { case_sensitive: false } #true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      true
    else
      false
    end
  end
end
