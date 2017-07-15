#require "rubygems"
require "watir"
#require "watir-webdriver"
#require "rspec"
#require 'win32ole'



#from the watir library go to the browser class and instatiee a browser class and give the firefox

mybrowser = Watir::Browser.new:firefox
#mybrowser = Watir::Browser.new:chrome
#mybrowser = Watir::Browser.new:phantomjs
#mybrowser = Watir::Browser.new:ie
#mybrowser.maximize

#visit royalmail.com
mybrowser.goto "http://www.royalmail.com/"

#i want my firefox broswer to find the link login in or register
mybrowser.link(:text =>"Log in or register").when_present.click

excelsheet = WIN32OLE.new('excel.application')
 wrkbook= excelsheet.Workbooks.Open("C:\\Users\\kiruba the great\\Desktop\\Book1.xlsx")

 wrksheet= wrkbook.Worksheets(1)
 wrksheet.Select

 username1= wrksheet.Range("a1").Value
 password1= wrksheet.Range("b1").Value


#i want to pass username
mybrowser.text_field(:id,'edit-name').set(username1)

#i want to pass username
mybrowser.text_field(:id,'edit-pass').set(password1)

excelsheet.Quit

#i want to click login button
mybrowser.button(:id, "edit-submit").click

#i open the last window
#mybrowser.windows.last

#To handle the New window and performing some actions within that window,

#mybrowser.window(:title,/TITLE of the new window/i).use do
#mybrowser.send_keys('SampleText')
#mybrowser.button(:id,'insert').click
#puts mybrowser.title #returns the new window title
#end


#To access an element in an iframe:

#mybrowser.frame(:id, 'iframe').text_field(:id, 'mytextfield').when_present.set "hello"

#i should take screenshot
mybrowser.screenshot.save 'E:\new automation tools to implement\cucumberwithwatir\myprofile.png'

#i should close my browser
mybrowser.close