class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  attr_accessible :question_id, :tag_id
end
