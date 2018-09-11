class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_opps
  has_many :opps, through: :user_opps #volunteers

  # acts as voter gem -Shahid
  acts_as_voter
end
