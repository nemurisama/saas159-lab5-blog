Given /^there is a post titled with "(.*?)" and content with "(.*?)"$/ do |title, content|
	@post_sl = Post.create!({ :title => title, :content => content, :post_time => Time.now})
	visit("/posts")
end

When /^I select the post$/ do
	click_link "Show", :href => "/posts/#{@post_sl.id}"
end

When /^I click "(.*?)"$/ do |delete|
	click_link delete
end

Then /^the post should be deleted$/ do
	page.should_not have_content(@post_sl.title)
end
