class Answer < ActiveRecord::Base
	attr_accessible :content, :answerable_id, :answerable_type, :user_id
	
  belongs_to :answerable, polymorphic: true

  has_many :answers, as: :answerable
  belongs_to :user

	validates :content, :answerable, :presence => true
end
