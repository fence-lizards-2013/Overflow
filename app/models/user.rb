class User < ActiveRecord::Base
	has_many :questions
  # has_many :answers
  has_many :answers, as: :answerable

	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin

end
