require 'rails_helper'

describe 'List of posts', type: :feature do
  
  let(:user) { User.create(name: 'Thomas Countz',
                           email: 'thomascountz@gmail.com',
                           password: 'password',
                           password_confirmation: 'password') }
                           
  before(:each) do
    user.posts.create(body: "This is post number one!")
    user.posts.create(body: "This is post number two!")
    user.posts.create(body: "This is post number three!")
    visit posts_path
  end
  
  context 'when user is anonymous' do
    it 'renders a list of posts' do
      user.posts.each do |post|
        expect(page).to have_content(post.body)
      end
    end
    
    xit 'has a link to login' do
      expect(page).to have_link('Login', href: login_path)
    end
    
    it 'does not render the name of the post author' do
      expect(page).to_not have_content(user.name)
      expect(page).to have_content('Anonymous')
    end
  end
  
  context 'when user is signed in' do
    before(:each) do
      log_in_as(user)
      visit posts_path
    end
    
    it 'renders the name of the post author' do
      expect(page).to have_content(user.name)
    end
    
    xit 'has a link to create a new post' do
      expect(page).to have_link("New Post", href: new_post_path)
    end
    
    xit 'adds a new post' do
      page.click_link("New Post")
      page.fill_in("Body", with: "This is post number four!")
      page.click_button("Submit Post")
      expect(current_path).to eq(posts_path)
      expect(page).to_have content("This is post number four!")
      expect(page).to_have content(user.name)
      
    end
    
    xit 'has a link to logout' do
      expect(page).to have_link("Logout", href: logout_path)
    end
  end
  
  private
  
    def log_in_as(user)
      visit login_path
      page.fill_in('session_email', with: user.email)
      page.fill_in('session_password', with: user.password)
      page.click_button('Login')
    end
  
end