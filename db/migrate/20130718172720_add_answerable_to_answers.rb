class AddAnswerableToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answerable_id, :integer
    add_column :answers, :answerable_type, :string
    Answer.all.each do |answer|
      answer.answerable_type = Question.name # is this right?
      answer.answerable_id = answer.question_id
    end
    remove_column :answers, :question_id
  end
end
