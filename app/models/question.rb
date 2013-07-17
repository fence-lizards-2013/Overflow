class Question < ActiveRecord::Base
  attr_accessible :title, :content
  has_many :answers
  validates :title, :content, presence: true
end
