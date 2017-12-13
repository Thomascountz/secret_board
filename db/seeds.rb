def create_users(n = 5)
	n.times do |i|
		user = User.find_or_initialize_by(email: "user_#{i}@example.com")
		user.name = "User_#{i}"
		user.password = 'password'
		user.password_confirmation = 'password'
		user.save
	end
end

def create_posts(n = 15)
	n.times do |i|
		post = Post.new
		post.user = User.find(rand(User.count) + 1)
		post.body = FFaker::Lorem.paragraph
		post.save
	end
end

create_users
create_posts