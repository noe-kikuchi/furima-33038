class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,presence: true
  validates :email, uniqueness: true
  validates :password,length: { minimum: 6 }
  validates :password, format: { with: /\A[a-z0-9]+\z/i }
  validates :lastname,presence: true
  validates :firstname,presence: true
  validates :lastname_kana,presence: true
  validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :firstname_kana,presence: true
  validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date_id,presence: true
end


  # validates :email,presence: true
  # validates :password,presence: true
  # validates :email, inclusion: { in: ["@"] }
  # # validates :password, password_confirmation: true
  # /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i