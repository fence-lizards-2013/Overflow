require 'spec_helper'

describe "Answers" do
	let(:content) { "This is the content" }
	let(:answer)  { Answer.new(content: content) } 

	context "#create" do 
		it "should have a content field" do 
			expect(answer.content).to eq(content)
		end
	end

end
