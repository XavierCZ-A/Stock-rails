class User < ApplicationRecord
  has_secure_password
  before_save :downcase_user

  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
    message: :invalid
  }
  validates :name, presence: true, length: { minimum: 3 }, format: {
    with: /\A[a-zA-Z]+\z/,
    message: :invalid
  }
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }



  def downcase_user
    self.email = email.downcase
    self.name = name.downcase
    self.last_name = last_name.downcase
  end
end
