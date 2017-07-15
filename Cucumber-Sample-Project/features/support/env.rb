require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium/webdriver'
 


caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.version = "8"
caps.platform = :WINDOWS
 
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://3af87ce843a381fdee29a081b5c1c0cb:35897cbd821b8cd43dad022b7116b0a7@hub.testingbot.com/wd/hub",
    :desired_capabilities => caps)
end
