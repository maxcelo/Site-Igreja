class User < ApplicationRecord

  enum role: {normal_user: 0, admin: 1, moderator: 2, umademmfs: 3, cibefs: 4}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
