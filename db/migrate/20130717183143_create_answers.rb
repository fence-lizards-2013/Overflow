class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.string :content
  		t.references :question
  	end
  end
end
