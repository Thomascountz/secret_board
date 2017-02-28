require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) do
    User.create(name:                  'Thomas Countz', 
                email:                 'thomascountz@example.com',
                password:              'password',
                password_confirmation: 'password')
  end
  
  let(:valid_post) { { body: "This is a new post!", user_id: user.id } }
  let(:invalid_post) { { body: nil, user_id: nil } }
  
  let(:valid_session) { { user_id: user.id } }
  
  describe "GET #index" do
    it 'assigns all posts as @posts' do
      post = Post.create! valid_post
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end
  
  describe "GET #new" do
    
    context 'when user is anonymous' do
      it 'redirects' do
        get :new, params: {}, session: nil
        expect(response).to have_http_status(:redirect)
      end
    end
    
    context 'when user is signed in' do
      it 'assigns a new post as @post' do
        get :new, params: {}, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end
      
      it 'assigns current user as @user' do
        get :new, params: {}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end
    end
  end
  
  
end
