require 'spec_helper'

describe "Users", :js => true do 
  let(:user_attr) {
    attributes_for :user
  }
  let!(:user) {
    create :user
  }
  describe "User creation" do
    it "should create a user" do
      visit root_path
      click_on "Register"
      expect{
        fill_in "First name", with: user_attr[:first_name]
        fill_in "Last name", with: user_attr[:last_name]
        fill_in "Email", with: user_attr[:email]
        fill_in "Password", with: user_attr[:password]
        fill_in "Password confirmation", with: user_attr[:password_confirmation]
        click_on "Create User"
        }.to change{ User.count }.by 1
    end
  end

  context "User login" do 
    context "with valid data" do
      it "should log you in" do
        visit root_path
        click_on "Log in"
        
        fill_in "Email", with: user.email
        fill_in "Password", with: user_attr[:password]
        click_on "Log in"

        expect(page).not_to have_content "This Email/Password did not match"
      end
    end
    context "with invalid data" do 
      it "should log you in" do
        visit root_path
        click_on "Log in"
        
        fill_in "Email", with: "hgfhgf@hgfjh.com"
        fill_in "Password", with: "jhj"
        click_on "Log in"

        expect(page).to have_content "This Email/Password did not match"
      end
    end
  end
end