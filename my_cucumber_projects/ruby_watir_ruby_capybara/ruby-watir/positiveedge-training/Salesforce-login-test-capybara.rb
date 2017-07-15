require 'capybara'
require 'selenium-webdriver'

#create
session = Capybara::Session.new(:selenium)

#to navigate to url
session.visit "https://test.salesforce.com/"

sleep 10
#to click on log in register link
#session.click_link('Log in or register')

#pass a parameter to edit box 
session.fill_in('username', :with => 'dsintegration-admin@servicesource.com.sitgoog1p')

#pass a parameter to edit box
session.fill_in('pw', :with => 'srevds123!')


#clicking on button
session.click_button('Login')

sleep 30
#assertion
#session.has_content?('DSIntegration Admin')

#click on link with xpath expression
session.find(:xpath,"//*[@id='Account_Tab']/a").click

sleep 10
#clicking on button
session.click_button('New')

sleep 10
#pass a parameter to edit box 
session.fill_in('acc2', :with => 'smoke-test-account-123')


#clicking on button
session.click_button('save')
