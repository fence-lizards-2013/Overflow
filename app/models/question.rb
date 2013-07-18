class Question < ActiveRecord::Base
  attr_accessible :title, :content
  has_many :answers
  validates_presence_of :title, :content 

  def viewed!
  	self.update_attribute :view_count, self.view_count+1
  end
end
