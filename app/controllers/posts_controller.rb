class PostsController < ApplicationController
  before_action :get_user, only: [:new, :create]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.body = params[:post][:body] # Why don't I need strong params here?
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to(root_path)
    else
      flash[:danger] = "You may only delete your own posts!"
      redirect_to(root_path)
    end
    
  end
  
  private
  
    def get_user
      if logged_in?
        @user = current_user
      else
        flash[:danger] = "You must be logged in."
        redirect_to login_path
      end
    end
    
    # def post_params
    #   params.require(:post).permit(:body)
    # end

end
