# To change this template, choose Tools | Templates
# and open the template in the editor.

require "watir"
#require "watir-webdriver"
#require "rspec"


Given(/^I am on "(.*?)"$/) do |website|
 @mybrowser.goto "#{website}"
end

Given(/^I click on "(.*?)" link$/) do |link|
 #wait method used
 @mybrowser.a(:xpath,"//a[contains(text(),'#{link}')]").wait_until_present
 @mybrowser.a(:xpath,"//a[contains(text(),'#{link}')]").click()
end

Given(/^I should link on register link$/) do
 @mybrowser.a(:css => ".btn_secondary_register.secondary.right").click()
end

Then(/^I should see page title as "(.*?)"$/) do |title|
  puts @mybrowser.h1(:text,"#{title}").exists?
end

When(/^I click personal radio button$/) do
 @mybrowser.input(:css,"#edit-account-type-personal").click()
end

When(/^I click on continue button$/) do
 @mybrowser.button(:css,"#edit-continue").click()
end

Then(/^I should see create account title$/) do
 puts @mybrowser.h1(:text,"Create an Account").exists?
end

When(/^I select mr from title select box$/) do
 @mybrowser.select_list(:id, "edit-title-of-person").select("Mr")
end

When(/^I fill firstname as "(.*?)"$/) do |firstname|
 @mybrowser.text_field(:xpath, "//*[@id='edit-first-name']").set(firstname)
end

When(/^I fill lastname as "(.*?)"$/) do |lastname|
@mybrowser.text_field(:css, "#edit-last-name").set(lastname)
end

When(/^I should click on terms and conditions check box$/) do
 @mybrowser.checkbox(:xpath, "//input[@id='edit-terms-conditions']").set
end

When(/^I should click on register button$/) do
 @mybrowser.input(:css => "#edit-register").click()
 @mybrowser.screenshot.save 'myprofile.png'
end