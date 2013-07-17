class Question < ActiveRecord::Base
  attr_accessible :title, :content
  has_many :answers
  validates_presence_of :title, :content 
end
