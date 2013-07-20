class Question < ActiveRecord::Base
  attr_accessible :title, :content, :image, :retained_image
  image_accessor :image

  has_many :answers, as: :answerable
  belongs_to :user

  validates_presence_of :title, :content 
  #we will come back to this later  
  #validates_property :width, :of => :image, :in => (0..400)
   #validates_property :height, :of => :image, :in => (0..400)

  def viewed!
  	self.update_attribute :view_count, self.view_count+1
  end

  def self.answer_count_sort
    sorted = self.all.sort! {|a,b| a.answers.count <=> b.answers.count }
    sorted.reverse!
  end

   def self.view_count_sort
    sorted = self.all.sort! {|a,b| a.view_count <=> b.view_count }
    sorted.reverse!
  end

  def self.newest_sort
    sorted = self.all.sort! {|a,b| a.created_at <=> b.created_at }
    sorted.reverse!
  end
end
