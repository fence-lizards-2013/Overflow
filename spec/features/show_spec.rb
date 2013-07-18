require 'spec_helper'

describe "Show Page" do
	let(:content)  { "this is the content" }
	let(:title)    { "this is the title" }
	let(:question) { Question.create(content: content, title: title) }

	it "should have a link to go back to the index page" do 
		visit question_path(question)
		page.should have_selector(:link, "Back to all questions")
	end

end
