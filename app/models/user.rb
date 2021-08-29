class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: true
  validates :password,           presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :encrypted_password, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_kana,         presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_kana,          presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,          presence: true
end