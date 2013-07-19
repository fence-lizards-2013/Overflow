FactoryGirl.define do
	factory :user do
    # REVIEW: email needs to be unique, so use either faker gem or sequence(:email)
		email "mca@gmail.com"
		password "password"
		password_confirmation "password"
	end
end
