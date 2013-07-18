require 'spec_helper'

describe "Show Page" do
	let(:content)  { "this is the content" }
	let(:title)    { "this is the title" }
	let(:question) { Question.create(content: content, title: title) }

	context "link to go back" do 
		it "should have the link to go back to the index page" do 
			visit question_path(question)
			page.should have_selector(:link, "Back to all questions")
		end

		it "should take you back to the index page" do
			visit question_path(question)
			click_link('Back to all questions')
			expect(page).to have_content "DO I LOOK FAT IN DIS??"
		end
	end

	context "form to create new answer" do 
		it "should be present on the show question page" do 
			visit question_path(question)
			expect(page).to have_selector('form')
		end

		it "should add answer to the page after form submit" do 
			visit question_path(question)
			fill_in 'content', :with => "this is the answer"
			click_on('Create Answer')
			expect(page).to have_content "this is the answer"
		end
	end
end
