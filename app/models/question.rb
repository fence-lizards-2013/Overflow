class Question < ActiveRecord::Base
  attr_accessible :title, :content

  has_many :answers, as: :answerable

  validates_presence_of :title, :content 
end
