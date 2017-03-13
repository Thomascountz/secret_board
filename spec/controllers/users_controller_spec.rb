require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  
  let(:valid_user) { { name:                  'Thomas Countz', 
                       email:                 'thomascountz@example.com',
                       password:              'password',
                       password_confirmation: 'password' } }

  let(:invalid_user) { { name:                  'a', 
                         email:                 'thomascountz@invalid',
                         password:              'password',
                         password_confirmation: 'different_password' } }

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, params: {}, session: nil
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      
      xit "creates a new user" do
        expect {
          post :create, params: { user: valid_user }, session: nil
        }.to change(User, :count).by(1)
      end
      
      xit "assigns a newly created User as @user" do
        
      end
      xit "redirects to root url" do
        
      end
    end
    
    context "with invalid params" do
      xit "assigns a new created but unsaved user as @user" do
        
      end
      xit "rerenders the new template" do
        
      end
    end
  end
end
