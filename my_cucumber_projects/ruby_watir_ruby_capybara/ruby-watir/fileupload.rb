
#require "rubygems"
require "watir"
require "watir-webdriver"
#require "rspec"


#from the watir library go to the browser class and instatiee a browser class and give the firefox

mybrowser = Watir::Browser.new:firefox
#mybrowser = Watir::Browser.new:chrome
#mybrowser = Watir::Browser.new:phantomjs
#mybrowser = Watir::Browser.new:ie
#mybrowser.maximize

#visit royalmail.com
mybrowser.goto "http://cgi-lib.berkeley.edu/ex/fup.html"

mybrowser.button(:name, "upfile").click

system("start ruby E:\\new automation tools to implement\\ruby-watir\\autoitscript.rb") 
mybrowser.file_field(:id, "the_file").set("E:\\new automation tools to implement\\ruby-watir\\myprofile.png")