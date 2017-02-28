class PostsController < ApplicationController
  before_action :get_user, only: [:new]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
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

end
