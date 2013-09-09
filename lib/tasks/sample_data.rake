namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(	name_first: "Example",
						name_last: 	"User",
						email: "example@madisonandmainst.com",
						password: "foobaroo",
						password_confirmation: "foobaroo")
		99.times do |n|
			name_first = Faker::Name.first_name
			name_last = Faker::Name.last_name
			email = "example-#{n+1}@madisonandmainst.com"
			password = "password"
			User.create!(	name_first: name_first,
							name_last: name_last,
							email: email,
							password: password,
							password_confirmation: password)
		end
	end	
end