require 'Capybara'


#require 'capybara-webkit'


#create
#session = Capybara::Session.new(:selenium)

visit "https://login.yahoo.com/account/create?specId=yidReg&lang=en-IN&src=ym&done=https%3A%2F%2Fmail.yahoo.com&display=login&intl=in"
sleep 10
#Capybara.app_host = 'http://google.com'
#session = Selenium::WebDriver.for :chrome
#driver.navigate.to "http://google.com

#Capybara.register_driver(:chrome)   { |app| Capybara::Selenium::Driver.new(app, :browser => :chrome) }



#Capybara.current_driver = :selenium_chrome

#puts "open the driver"
 #sleep(5.to_i)
 #puts "wait statement"

  #visit path_to('google')
