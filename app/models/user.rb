class User < ActiveRecord::Base
	has_many :questions

	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	attr_accessible :name, :email, :password, :password_confirmation, :remember_me

	include Gravtastic
	gravtastic
end
