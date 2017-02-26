require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) do
    User.create(name:                  'Thomas Countz', 
                email:                 'thomascountz@example.com',
                password:              'password',
                password_confirmation: 'password')
  end
  
  it 'is valid' do
    expect(user).to be_valid
  end
  
  it 'is invalid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  
  it 'is invalid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end
  
  it 'is invalid without a password' do
    user.password = user.password_confirmation = nil
    expect(user).to_not be_valid
  end
  
  it 'is invalid with a blank password' do
    user.password = user.password_confirmation = " " * 8
    expect(user).to_not be_valid
  end
  
  it 'is authenticated with valid password' do
    expect(user.authenticate('password')).to eq(user)
  end
  
end
