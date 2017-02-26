class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def root
    render html: '<h1>This is where the secret posts will be listed!</h1>'.html_safe
  end
end
