require 'spec_helper'

describe "User Show Page" do
	let(:name) { "mca" }
	let(:email) {"test@test.com"}
	let(:password) {"12345678"}
	let(:updated_email) { "updated_test@test.com" }
	let(:updated_password) { "password" }

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

		it "should allow you to update the email for the user" do 
			visit user_path(@user)
			click_link('Edit Account')
			fill_in 'Email', with: updated_email
			fill_in 'user_current_password', with: password
			click_button('Update')
			expect(User.find_by_email(updated_email)).to_not be_nil
		end

		it "should allow you to update the password for the user" do 
			visit user_path(@user)
			click_link('Edit Account')
			fill_in 'Email', with: email
			fill_in 'user_password', with: updated_password
			fill_in 'user_password_confirmation', with: updated_password
			fill_in 'user_current_password', with: password
			click_button('Update')
			
			click_link('Logout')
			click_link('Sign In')
			fill_in 'Email', with: email
			fill_in 'Password', with: updated_password
			click_button "Sign in"
			expect(page).to have_content('New Question')
		end
	end
end
