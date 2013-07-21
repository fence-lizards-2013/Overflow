class Question < ActiveRecord::Base
  attr_accessible :title, :content, :image, :retained_image, :user_id, :tags, :image_uid, :image_name
  image_accessor :image

  has_many :answers, as: :answerable
  has_many :question_tags
  has_many :tags, through: :question_tags

  # has_many :answers
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
end
