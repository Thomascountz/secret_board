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
      
      it "creates a new user" do
        expect {
          post :create, params: { user: valid_user }, session: nil
        }.to change(User, :count).by(1)
      end
      
      it "assigns a newly created User as @user" do
        post :create, params: { user: valid_user }, session: nil
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
      
      it "logs in the new user" do
        post :create, params: { user: valid_user }, session: nil
        expect(is_logged_in?).to be true
      end
      
      it "redirects to root url" do
        post :create, params: { user: valid_user }, session: nil
        expect(response).to redirect_to(root_url)
      end
    end
    
    context "with invalid params" do
      it "assigns a new created but unsaved user as @user" do
        post :create, params: { user: invalid_user }, session: nil
        expect(assigns(:user)).to be_a_new(User)
      end
      
      it "rerenders the new template" do
        post :create, params: { user: invalid_user }, session: nil
        expect(response).to render_template("new")
      end
    end
    
  end
  
  # Returns true if a user is logged in
  def is_logged_in? 
    !session[:user_id].nil?
  end
end
