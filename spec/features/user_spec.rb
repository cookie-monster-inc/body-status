require 'spec_helper'

describe "Users", :js => true do 
  describe "User creation" do
    context "With valid data" do 
      it "should create a user" do
        visit new_user_path
        expect{
          fill_in "First name", with: attributes_for(:user)[:first_name]
          fill_in "Last name", with: attributes_for(:user)[:last_name]
          fill_in "Email", with: attributes_for(:user)[:email]
          fill_in "Password", with: attributes_for(:user)[:password]
          fill_in "Password confirmation", with: attributes_for(:user)[:password_confirmation]
          click_on "Create User"
          }.to change{ User.count }.by 1
      end
    end
    context "With invalid data" do
      it "should not create a user and print errors" do
        # This is the only way to pass the html5 validation
        visit new_user_path
        expect{
          fill_in "First name", with: attributes_for(:user)[:first_name]
          fill_in "Last name", with: attributes_for(:user)[:last_name]
          fill_in "Email", with: attributes_for(:user)[:email]
          fill_in "Password", with: 'password'
          fill_in "Password confirmation", with: 'password2'
          click_on "Create User"
          }.not_to change{ User.count }
        expect(page).to have_content "Password doesn't match confirmation"
      end
    end
  end
end