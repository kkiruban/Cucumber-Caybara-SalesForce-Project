

require 'capybara'
require 'selenium-webdriver'

#create
session = Capybara::Session.new(:selenium)

#to navigate to url
session.visit "http://www.royalmail.com/"

sleep 10
#to click on log in register link
session.click_link('Log in or register')

sleep 10
#clicking on register link
session.click_link('Register')

sleep 10

#clicking on personal radion button
session.choose('Personal use')
sleep 15

#clicking on continue button
session.click_on('Continue')
sleep 10
#select value from title select box
session.select('Mr', :from => 'Title')
sleep 10
#pass a parameter to edit box 
session.fill_in('First name', :with => 'test')
sleep 10
#pass a parameter to edit box
session.fill_in('Last name', :with => 'user')
sleep 10
#clicking on button
session.click_button('Register')
