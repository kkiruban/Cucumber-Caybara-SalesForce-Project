require 'watir'
require 'watir-webdriver'
require 'rspec'

#caps = Selenium::WebDriver::Remote::Capabilities.firefox
#caps.version = "11"
#caps.platform = :LINUX
#caps.browser= "firefox"
#caps[:name] = "testing this cloud thing"

mybrowser = Watir::Browser.new:firefox

#Watir::Browser.new:chrome
#Watir::Browser.new:ie
#Watir::Browser.new:phantomjs


#mybrowser = Watir::Browser.new(:remote,
#		:url => "http://kkirubanand:e457516d2-dec2-4f17-84f9-c791ce4511e2@ondemand.saucelabs.com:80/wd/hub",
#		:desired_capabilities => caps)

Before do
  @mybrowser = mybrowser
end

at_exit do
  mybrowser.close
end
