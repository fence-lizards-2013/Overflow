class Answer < ActiveRecord::Base
	attr_accessible :content, :answerable_id, :answerable_type
	
  belongs_to :answerable, polymorphic: true

  has_many :answers, as: :answerable

	validates :content, :answerable, :presence => true
end
