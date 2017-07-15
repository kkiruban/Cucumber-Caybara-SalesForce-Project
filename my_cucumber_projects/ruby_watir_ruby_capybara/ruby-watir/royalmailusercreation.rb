




#require "rubygems"
require "watir"
#require "watir-webdriver"
#require "rspec"
#require 'win32ole'



#from the watir library go to the browser class and instatiee a browser class and give the firefox

mybrowser = Watir::Browser.new:chrome
#mybrowser = Watir::Browser.new:chrome
#mybrowser = Watir::Browser.new:phantomjs
#mybrowser = Watir::Browser.new:ie
#mybrowser.maximize

#mybrowser = Watir::Browser.start 'http://www.royalmail.com/'
#visit royalmail.com

#to launch a browser
mybrowser.goto "http://www.royalmail.com/"

#to get the url
puts mybrowser.url

#to refresh the webpage
mybrowser.refresh

#to maximize
mybrowser.window.maximize

#to go previous page
#mybrowser.back()

#to go next page 
#mybrowser.forward()

#to perform keyboard actions
#mybrowser.send_keys(“{TAB}{TAB}{ENTER}”)


#puts mybrowser.show_links()

#puts mybrowser.show_forms()

#puts mybrowser.show_images()

#puts mybrowser.html()

#clicking on log in register link with xpath 
mybrowser.a(:xpath,"//a[contains(text(),'Log in or register')]").click()

mybrowser.a(:css => ".btn_secondary_register.secondary.right").click()


#to click the radio through xpath
#mybrowser.input(:xpath,"//input[@id='edit-account-type-personal']").click()

#to click the radio through css
mybrowser.input(:css,"#edit-account-type-personal").click()

#clicking on continue button
mybrowser.button(:css,"#edit-continue").click()


mybrowser.select_list(:id, "edit-title-of-person").select("Mr")

mybrowser.text_field(:xpath, "//*[@id='edit-first-name']").set("kiru")

mybrowser.text_field(:css, "#edit-last-name").set("test")

mybrowser.checkbox(:xpath, "//input[@id='edit-terms-conditions']").set

mybrowser.input(:css => "#edit-register").click()

#to take screenshot using watir-webdriver
mybrowser.screenshot.save 'myprofile.png'

mybrowser.close

#window handling
# get new window
#browser.windows.last.use do
    # new window stuff
    # close new window
   # browser.window.close


#frame handling
#mybrowser.frame(:id, 'iframe').text_field(:id, 'mytextfield').when_present.set "hello"

#https://leanpub.com/watirways/read
#https://www.thoughtworks.com/insights/blog/creating-automated-test-scripts-ruby-and-watir
#http://watirwebdriver.com/web-elements/

