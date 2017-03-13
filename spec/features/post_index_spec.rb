require 'rails_helper'

describe 'List of posts', type: :feature do
  
  let(:user) { User.create(name: 'Thomas Countz',
                           email: 'thomascountz@gmail.com',
                           password: 'password',
                           password_confirmation: 'password') }
                           
  let(:new_user) { User.create(name: 'Chris Smith',
                           email: 'chrissmith@gmail.com',
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
    
    it 'has a link to login' do
      expect(page).to have_link('Login', href: login_path)
    end
    
    it 'has a link to signup' do
      expect(page).to have_link('Sign up', href: signup_path)
    end
    
    it 'does not render the name of the post author or delete option' do
      expect(page).to_not have_content(user.name)
      expect(page).to have_content('Anonymous')
      expect(page).to_not have_content('delete')
    end
  end
  
  context 'when user is signed in' do
    before(:each) do
      log_in_as(user)
      visit posts_path
    end
    
    it 'renders the name of the post author' do
      user.posts.each do |post|
        expect(page).to have_content(post.user.name)
      end
    end
    
    it 'has a link to create a new post' do
      expect(page).to have_link("New Post", href: new_post_path)
    end
    
    it 'adds a new post' do
      new_post = "This is post number four!"
      page.click_link("New Post")
      expect(current_path).to eq(new_post_path)
      page.fill_in("Body", with: new_post)
      page.click_button("Submit Post")
      expect(current_path).to eq(root_path)
      expect('.alert').to be_present 
      expect(page).to have_content(new_post)
      expect(page).to have_content(user.name)
    end
    
    it 'has a link to logout' do
      expect(page).to have_link("Logout", href: logout_path)
    end
    
    it 'has a link to delete each post' do
      user.posts.each do |post|
        expect(page).to have_link('delete', href: post_path(post))
      end
    end
    
    it 'deletes a post' do
      post = "This is a brand new post!"
      
      page.click_link("New Post")
      page.fill_in("Body", with: post)
      page.click_button("Submit Post")
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content(post)
      
      delete_links = page.all("a", :text => "delete")
      delete_links.first.click
      
      expect(page).not_to have_content(post)
      expect(current_path).to eq(root_path)
      expect('.alert').to be_present
    end
    
  end
  
  context "when signed in as a different user" do
    before(:each) do
      log_in_as(new_user)
      visit posts_path
    end
    
    it 'it renders the name of the post authors' do
      user.posts.each do |post|
        expect(page).to have_content(post.user.name)
      end
    end
    
    it 'does not have a link to delete each post of the other user' do
      user.posts.each do |post|
        expect(page).not_to have_link('delete', href: post_path(post))
      end
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