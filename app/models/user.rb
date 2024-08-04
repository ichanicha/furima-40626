class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :family_name, :name, :family_name_kana, :name_kana, :birthday, presence: true
  validates  :family_name, :name,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates  :family_name_kana, :name_kana,  format:{ with: /\A[ァ-ヶー－]+\z/ }
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  validates :password, presence: true, length: { minimum: 6 }
end


