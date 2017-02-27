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
end
