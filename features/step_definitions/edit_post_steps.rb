Given /^there is a post with title "(.*?)" and content "(.*?)"$/ do |title, content|
	@post_select = Post.create!({ :title => title, :content => content, :post_time => Time.now})
end

When /^I edit this post$/ do
	click_link "Edit", :href => "/posts/#{@post_select.id}/edit"
end

When /^I update title to "(.*?)" and content to "(.*?)"$/ do |title, content|
	@title = title
	@content = content
	fill_in "Title", :with => title
	fill_in "Content", :with => content
	click_button "Update Post"
end

Then /^I can see it has been updated$/ do
	page.should have_content(@title)
	page.should have_content(@content)
end
