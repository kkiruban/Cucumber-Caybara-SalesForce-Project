require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require "watir-webdriver/wait"
require 'Capybara'
require "capybara/cucumber"
require 'yaml'
require 'site_prism'

#Step definition to enter the credentials in Emea login page
When(/^I enter the credentials to the Zenith application$/) do
  #    visit env
  #    arg=getCredentialInfo
  #    fill_in "Username",:with => arg["Username"]
  #    fill_in "Password",:with => arg["Password"]
  #    find(:id,"Login").click
  #    puts "Logged in successfully"
  #    sleep 3
  #  @login = Home.new
  #  @login.load
  @page = LoginPage.new
  @page.load
  @page.login_with('testuser1@example.com', 'incorrect')
  # capybara automatically waits for us
  expect(@page).to have_content 'invalid user or password'
end
