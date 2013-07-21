class Tag < ActiveRecord::Base
  attr_accessible :tag_name
  has_many :questions, through: :question_tags
  has_many :question_tags
  validates_presence_of :tag_name

  def format_tag
    self.tag_name.singularize
  end
end
