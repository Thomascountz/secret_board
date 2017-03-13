require 'rails_helper'

describe 'User sign up', type: :feature do
  
  let(:user) { User.create(name: 'Thomas Countz',
                         email: 'thomascountz@gmail.com',
                         password: 'password',
                         password_confirmation: 'password') }
                         
  before(:each) do
      visit new_user_path
  end
  
  context "with invalid signup input" do
    it "notifies the user of errors" do
      page.fill_in('Name', with: "u")
      page.fill_in('Email', with: "user@invalid")
      page.fill_in('Password', with: "password1")
      page.fill_in('Password Confirmation', with: "different_password")
      page.click_button('Sign up')
      expect(current_path).to eq(new_user_path)
      exect('.alert').to be_present
      expect{
        click_button 'Sign up'
      }.to_not change(User, :count).by(1)
    end
  end
  
  context "with valid signup input" do
    it "creates a new user in the database" do
      page.fill_in('Name', with: user.name)
      page.fill_in('Email', with: user.email)
      page.fill_in('Password', with: user.password)
      page.fill_in('Password Confirmation', with: user.password_confirmation)
      page.click_button('Sign up')
      expect(current_path).to eq(root_path)
      exect('.alert').to be_present
      expect{
        click_button 'Sign up'
      }.to change(User, :count).by(1)
    end
  end
  
end