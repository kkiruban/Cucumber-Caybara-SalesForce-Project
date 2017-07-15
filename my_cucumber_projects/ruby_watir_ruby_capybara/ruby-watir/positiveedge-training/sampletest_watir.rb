#require "rubygems"
require "watir"
require "watir-webdriver"
#require "rspec"
require 'win32ole'



#from the watir library go to the browser class and instatiee a browser class and give the firefox

mybrowser = Watir::Browser.new:firefox
#mybrowser = Watir::Browser.new:chrome
#mybrowser = Watir::Browser.new:phantomjs
#mybrowser = Watir::Browser.new:ie
#mybrowser.maximize

 #visit royalmail.com
 mybrowser.goto "https://test.salesforce.com/"

 sleep 5
 
 #mybrowser.driver.manage.timeouts.implicit_wait = 5

#Close the browser

   #mybrowser.close
 
#Accessing an Element

#Text box or text area

#enter username
   mybrowser.text_field(:name, "username").set("positiveedge.net")
   
#enter password
   mybrowser.text_field(:name, "pw").set("1234")
  
#assertion
 # mybrowser.button(:name => "Login").when_present.click

#Button
   mybrowser.button(:name, "Login").click