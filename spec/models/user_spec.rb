require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) do
    User.create(name: 'Thomas Countz', email: 'thomascountz@example.com')
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
  
end
