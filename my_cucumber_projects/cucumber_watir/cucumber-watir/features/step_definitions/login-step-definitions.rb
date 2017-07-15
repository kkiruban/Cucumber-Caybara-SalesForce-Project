# To change this template, choose Tools | Templates
# and open the template in the editor.


When(/^I fill email id as "(.*?)"$/) do |emailid|
  @mybrowser.text_field(:xpath, "//input[@id='edit-name']").wait_until_present
  @mybrowser.text_field(:xpath, "//input[@id='edit-name']").set(emailid)
end

When(/^I fill password id as "(.*?)"$/) do |password|
 @mybrowser.text_field(:xpath, "//input[@id='edit-pass']").set(password)
end

When(/^I should click on Login button$/) do
  @mybrowser.button(:css,"#edit-submit").click()
end

Then(/^I should see the following error "(.*?)"$/) do |error|
  puts @mybrowser.h2(:text,"#{error}").exist?
end

Then(/^I should see the link "(.*?)"$/) do |link|
  puts @mybrowser.a(:text,"#{link}").exist?
end