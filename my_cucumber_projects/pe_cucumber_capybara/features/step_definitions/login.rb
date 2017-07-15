# To change this template, choose Tools | Templates
# and open the template in the editor.

Given(/^I should visit saleforce website$/) do
  @browser.visit "#{BASE_URL}"
end

Then(/^I should see "([^"]*)"$/) do |content|
  @browser.has_content?(content)
end

Then(/^I should see "([^"]*)" link$/) do |link|
  @browser.find_link(link).visible?
end

When(/^I follow "([^"]*)" link$/) do |link|
  @browser.click_link(link)
end

When(/^I fill "([^"]*)" as "([^"]*)"$/) do |label, value|
  @browser.fill_in(label, :with => value)
end

When(/^I should click on "([^"]*)" button$/) do |button|
  @browser.click_button(button)
end

Then(/^I should see:$/) do |string|
  @browser.has_content?(string)
end
