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
    @post.body = params[:post][:body]
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'new'
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
