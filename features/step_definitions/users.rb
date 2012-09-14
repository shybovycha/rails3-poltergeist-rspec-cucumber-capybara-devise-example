Given /^homepage$/ do
  visit '/'
end

When /^fill the sign up form$/ do
  fill_in 'Email', :with => 'moo@foo.bar'
  fill_in 'Password', :with => 'moofoo'
  fill_in 'Password confirmation', :with => 'moofoo'
end

When /^click '(.+)' button$/ do |button|
  click_button button
end

When /^I click '(.+)' button$/ do |button|
  click_button button
end

When /^click the '(.+)' button$/ do |button|
  click_button button
end

When /^I click the '(.+)' button$/ do |button|
  click_button button
end

Then /^I should be redirected to the homepage$/ do
  current_path.should =~ /^\/$/
end

Then /^I should be logged in$/ do
  prev_path = current_path

  visit '/'

  (has_link? 'Sign out').should == true

  visit prev_path
end

When /^click '(.+)' link$/ do |link|
  click_link link
end

When /^I click '(.+)' link$/ do |link|
  click_link link
end

When /^click the '(.+)' link$/ do |link|
  click_link link
end

When /^I click the '(.+)' link$/ do |link|
  click_link link
end

When /^fill the sign in form$/ do
  fill_in 'Email', :with => 'foo@bar.baz'
  fill_in 'Password', :with => 'abc123'
end

Given /^a logged in user$/ do
  prev_path = current_path.nil? ? '/' : current_path

  visit '/'
  
  click_link 'Sign in'
  
  fill_in 'Email', :with => 'foo@bar.baz'
  fill_in 'Password', :with => 'abc123'
  
  click_button 'Sign in'

  visit prev_path
end

Given /^an anonymous user$/ do
  prev_path = current_path.nil? ? '/' : current_path

  visit '/'

  if has_link? 'Sign out' then
    click_link 'Sign out'
  end

  visit prev_path
end

Then /^I should be logged out$/ do
  prev_path = current_path

  visit '/'

  (has_link? 'Sign out').should == false

  visit prev_path
end
