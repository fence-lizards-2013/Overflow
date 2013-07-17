require 'spec_helper'

describe "Answers" do
	let(:content) { "This is the content" }
	let(:question_id) { 1 }
	let(:answer)  { Answer.new(content: content, question_id: question_id) } 

	context "#create" do 
		it "should have a content field" do 
			expect(answer.content).to eq(content)
		end

		it "should have a question_id" do 
			expect(answer.question_id).to eq(question_id)
		end

		it "should NOT save if content field is missing" do 
			expect{ Answer.create!(content: "", question_id: question_id) }.to raise_error
		end

		it "should NOT save if question_id is missing" do 
			expect{ Answer.create!(content: content, question_id: "") }.to raise_error
		end
	end

end
