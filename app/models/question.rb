class Question < ActiveRecord::Base
  attr_accessible :title, :content, :image, :retained_image
  image_accessor :image

  has_many :answers, as: :answerable

  validates_presence_of :title, :content 
  #we will come back to this later  
  #validates_property :width, :of => :image, :in => (0..400)
   #validates_property :height, :of => :image, :in => (0..400)

  def viewed!
  	self.update_attribute :view_count, self.view_count+1
  end
end
