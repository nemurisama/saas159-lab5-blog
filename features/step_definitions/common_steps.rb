Given /^I am on the blog homepage$/ do
	visit("/posts")
end

And /^there are already (\d) posts$/ do |count|
	count.to_i.times do |n|
		Post.create!({ :title => "Title #{n}", :content => "Content #{n}", :post_time => Time.now})
	end
end

And /^there is a post with title "(.*?)" and content "(.*?)"$/ do |title, content|
	Post.create!({ :title => title, :content => content, :post_time => Time.now})
end