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
        expect(response).to redirect_to(login_path)
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
  
  describe 'POST #create' do
    
    context 'when user is anonymous' do
      it 'redirects' do
        post :create, params: { post: valid_post }, session: nil
        expect(response).to redirect_to(login_path)
      end
    end

    
    context "when user is logged in" do
      
      context "with valid params" do
        
        it "creates a new Post" do
          expect {
            post :create, params: { post: valid_post }, session: valid_session
          }.to change(Post, :count).by(1)
        end
        
        it "assigns a newly created Post as @post" do
          post :create, params: { post: valid_post }, session: valid_session
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end
        
        it "redirects back to root url" do
          post :create, params: { post: valid_post }, session: valid_session
          expect(response).to redirect_to(root_path)
        end
      end
      
      context "with invalid params" do
        
        it "assigns a new created unsaved post as @post" do
          post :create, params: { post: invalid_post }, session: valid_session
          expect(assigns(:post)).to be_a_new(Post)
        end
        
        it "rerenders the new template" do
          post :create, params: { post: invalid_post }, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end
  
  describe 'DELETE #destroy' do
    
    context 'when user is anonymous' do
      it 'redirects' do
        post = Post.create! valid_post
        delete :destroy, params: {id: post.to_param}, session: valid_session
        expect(response).to redirect_to(login_path)
      end
    end
    
    context 'when user is logged in' do
      it "destorys the requested post" do
        post = Post.create! valid_post
        expect {
          delete :destroy, params: {id: post.to_param }, session: valid_session
        }.to change(Post, :count).by(-1)
      end
      
      it "redirects to root" do
        post = Post.create! valid_post
        delete :destroy, params: {id: post.to_param }, session: valid_session
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
