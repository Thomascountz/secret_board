require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  
 let(:user) { User.create(name: 'Thomas Countz',
                           email: 'thomascountz@gmail.com',
                           password: 'password',
                           password_confirmation: 'password') }
                           
                           
  describe "login" do
    it 'assigns a user.id to a browser session' do
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end
  
  describe "logged_in?" do
    it 'returns false if there is no user logged in' do
      expect(logged_in?).to be false
    end
    
    it 'returns true if there is a user logged in' do
      log_in(user)
      expect(logged_in?).to be true
    end
  end
  
  describe "current_user" do
    it 'returns the signed in user' do
      log_in(user)
      expect(current_user).to eq(user)
    end
    
    it 'returns nil if no user is signed in' do
      expect(current_user).to be nil
    end
  end
  
end
