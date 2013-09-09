FactoryGirl.define do
	factory :user do
		sequence(:name_first)	{ |n| "Person#{n}" }
		sequence(:name_last)	{ |n| "Dude#{n}" }
		sequence(:email)		{ |n| "person_#{n}@example.com" }
		password "foobarbaz"
		password_confirmation "foobarbaz"

		factory :admin do
			admin true
		end
	end
end