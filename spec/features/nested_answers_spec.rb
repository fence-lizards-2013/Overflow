require 'spec_helper'

describe "Nested answers" do
	let(:name) { "mca" }
	let(:email) {"test@test.com"}
	let(:password) {"12345678"}
	let(:title) { "this is the title" }
	let(:content) { "this is the content" }
	let(:tag) { "tag1 tag2" }
	let(:first_answer) { "this is my first answer" }
	let(:comment) { "this is the first comment" }
	
	before(:each) do
		@user = User.create(name: name, email: email, password: password)
		visit new_user_session_path
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		click_button "Sign in"

		click_link 'New Question'
		fill_in 'title', :with => title
		fill_in 'content', :with => content
		fill_in 'question_tags', :with => tag
		attach_file 'image', Rails.root.join('app', 'assets', 'images', 'rails.png')
		click_on 'Submit Question'
	end

	context "Answer the Question" do 
		it "should allow the user to answer the question" do 
			fill_in "Answer the Question", :with => first_answer
			click_button 'Create Answer'
			expect(page).to have_link "Reply"
		end

		it "should allow the user to comment on a reply", :js => true do 
			fill_in "Answer the Question", :with => first_answer
			click_button 'Create Answer'
			click_link "Reply"
			fill_in "Comment on Answer", :with => comment
			click_button "Comment on answer"
			expect(page).to have_content(comment)
		end

		it "should have the tag on the page" do 
			expect(page).to have_content(tag)
		end
	end
end
