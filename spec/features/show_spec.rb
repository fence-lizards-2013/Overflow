require 'spec_helper'

describe "Show Page" do
	let(:content)  { "this is the content" }
	let(:title)    { "this is the title" }
	let(:question) { Question.create(content: content, title: title) }
	let(:email) {"test@test.com"}
	let(:password) {"12345678"}

	context "link to go back" do 
		it "should have the link to go back to the index page" do 
			visit question_path(question)
			page.should have_selector(:link, "Back to all questions")
		end

		it "should take you back to the index page" do
			visit question_path(question)
			click_link('Back to all questions')
			expect(page).to have_content "Do I Look FAT in Dis??"
		end
	end

	context "form to create new answer" do 
		before(:each) do
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Confirm Password', with: password
			click_button "Sign up"
		end

		it "should add answer to the page after form submit" do 
			visit question_path(question)
			fill_in 'content', :with => "this is the answer"
			click_on('Create Answer')
			expect(page).to have_content "this is the answer"
		end
	end
end
