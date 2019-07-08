class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :lists
    has_many :items, through: :lists


end

