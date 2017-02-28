require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(name:                  'Thomas Countz', 
                email:                 'thomascountz@example.com',
                password:              'password',
                password_confirmation: 'password')
  end
  let(:post) { Post.create(body: "This is a new post!", user_id: user.id) }
  
  it 'is valid' do
    expect(post).to be_valid
  end
  
  it 'is invalid with a blank body' do
    post.body = "       "
    expect(post).to_not be_valid
  end

  it 'is invalid with a body character length less than 15' do
    post.body = "a" * 14
    expect(post).to_not be_valid
  end
  
  
  it 'is invalid without a user_id' do
    post.user_id = nil
    expect(post).to_not be_valid
  end
end
