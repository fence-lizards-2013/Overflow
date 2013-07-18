require 'spec_helper'

describe Answer do

	let(:content) { "This is the content" }
	let(:question) {Question.new(title: "Why you so fat?", content: "Why so godam fat!") }
	let(:answer)  { question.answers.new(content: content) }
	let(:no_content_answer)  { question.answers.new(content: "") }
	subject { answer }
	it {should validate_presence_of :answerable}
	it {should validate_presence_of :content}
	context "#create" do 
		it "should have a content field" do 
			expect(answer.content).to eq(content)
		end

		it "should NOT save if content field is missing" do 
			answer.content = nil
			expect(answer).to be_invalid
		end

		it "should NOT save if answerable is missing" do 
			answer.answerable = nil
			expect(answer).to be_invalid
		end
	end

end
