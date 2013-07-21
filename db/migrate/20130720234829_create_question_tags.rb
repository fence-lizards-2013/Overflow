class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.belongs_to :question
      t.belongs_to :tag
    end
  end
end
