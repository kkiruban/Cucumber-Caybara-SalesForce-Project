require "rubygems"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require "watir-webdriver/wait"
require 'Capybara'
require "capybara/cucumber"
require 'win32ole'
require 'yaml'


Given(/^that I am on (.*)$/) do |page|
  BROWSER.goto(PAGES[page])
end


Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome,:switches => %w[ --disable-extensions ])
end

Capybara.default_driver = :chrome
Capybara.app_host = "https://test.salesforce.com/"
Capybara.default_wait_time =30

ENV['TEST_ENV'] = 'Test'

def env
  case ENV['TEST_ENV']
    
  when /Test/ then "https://test.salesforce.com/"
  else
    "https://test.salesforce.com/"
  end
end

#before hook to maximize a window
Before do
  page.driver.browser.manage.window.maximize
end

