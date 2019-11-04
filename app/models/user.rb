class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ["user", "hotelier", "vendor"].each do |type|
  	define_method :"#{type}?" do
  		self.type.downcase == type
  	end
  end
end
