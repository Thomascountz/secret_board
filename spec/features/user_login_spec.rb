require 'rails_helper'

describe 'login', type: :feature do
  
  let(:user) { User.create(name: 'Thomas Countz',
                           email: 'thomascountz@gmail.com',
                           password: 'password',
                           password_confirmation: 'password') }
                           
  describe "with a user email that doesn't exist" do
  
    it 'rerender the form with an alert message' do
    visit login_path
    page.fill_in('session_email', with: 'nonexistent@example.com')
    page.fill_in('session_password', with: 'password')
    page.click_button('Login')
    expect(current_path).to eq(login_path)
    expect('.alert').to be_present
    end
    
    
  end
  
end