require 'spec_helper'

describe "User Show Page" do
	let(:name) { "mca" }
	let(:email) {"test@test.com"}
	let(:password) {"12345678"}

	before(:each) do
		@user = User.create(name: name, email: email, password: password)
		visit new_user_session_path
		fill_in 'Email', with: email
		fill_in 'Password', with: password
		click_button "Sign in"
	end

	context "link to view profile" do 
		it "should take you to the profile page" do 
			visit root_path
			click_link('View Profile')
			expect(page).to have_content(email)
			expect(page).to have_selector("img")
		end
	end

	context "link to edit account" do 
		it "should take you to the edit account page" do 
			visit user_path(@user)
			click_link('Edit Account')
			expect(page).to have_content("Edit User")
		end
	end
end
