require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "index" do

		let(:user) { FactoryGirl.create(:user) }

		before(:each) do
			sign_in user
			visit users_path
		end

		it { should have_selector('title',	text: 'All users') }
		it { should have_selector('h1',		text: 'All users') }

		describe "pagination" do

			before(:all) { 30.times { FactoryGirl.create(:user) } }
			after(:all) { User.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each user" do
				User.paginate(page: 1).each do |user|
					page.should have_selector('li', text: user.name_last)
				end
			end
		end

		describe "delete links" do

			it { should_not have_link('delete') }

			describe "as an admin user" do
				let(:admin) { FactoryGirl.create(:admin) }
				before do
					sign_in admin
					visit users_path
				end

				it { should have_link('delete', href: user_path(User.first)) }
				it "should be able to delete another user" do
					expect { click_link('delete') }.to change(User, :count).by(-1)
				end
				it { should_not have_link('delete', href: user_path(admin)) }
			end
		end
	end

	describe "User pages" do
		subject { page }

		describe "profile page" do
			let(:user) { FactoryGirl.create(:user) }
			before { visit user_path(user) }

			it { should have_selector('h1',		text: user.name_first) }
			it { should have_selector('title',	text: user.name_last) }
		end

		describe "signup page" do
			before { visit signup_path }

			it { should have_selector('h1',    text: 'Create a new user') }
			it { should have_selector('title', text: full_title('Create a new user')) }
		end
	end

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Create account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: 'Create a new user') }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name first",		with: "Example"
				fill_in "Name last",		with: "User"
				fill_in "Email",			with: "user@example.com"
				fill_in "Password",			with: "foobarbaz"
				fill_in "Confirmation",		with: "foobarbaz"
			end
			
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by_email('user@example.com') }
				it { should have_selector('title', text: user.name_last) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
				it { should have_link('Sign out') }
			end
		end
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_selector('h1',		text: "Update your profile") }
			it { should have_selector('title',	text: "Edit user") }
			it { should have_link('change',		href: 'http://gravatar.com/emails') }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_name_first) { "New" }
			let(:new_name_last) { "name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name first",		with: new_name_first
				fill_in "Name last",		with: new_name_last
				fill_in "Email",			with: new_email
				fill_in "Password",			with: user.password
				fill_in "Password confirmation",	with: user.password
				click_button "Save changes"
			end

			it { should have_selector('title', text: new_name_last) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { user.reload.name_first.should == new_name_first }
			specify { user.reload.name_last.should == new_name_last }
			specify { user.reload.email.should == new_email }
		end
	end
end
