require 'rubygems'
require 'capybara'
require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require "Capybara/cucumber"
require 'rspec/expectations'
require "watir-webdriver"
require "watir-webdriver/wait"
require "capybara-screenshot"
require 'D:\my_cucumber_projects\pe_cucumber_capybara\features\support\lib\configuration.rb'



browser = Capybara::Session.new(:selenium)


Before do
  @browser = browser
  #   DatabaseCleaner.start
  browser.driver.browser.manage.window.maximize
end


BASE_URL = Configuration["base_url"]

at_exit do
  ARGV.each do |a|
    if a =~ /\.htm(l)?/
      file = File.open(a, 'r')
      new_file = ""
      while (line = file.gets)
        if line.match(/\lessthan/) and line.match(/greaterthan\<\/pre\>/)
          new_file = new_file + line.gsub!(/\lessthan/, "<").gsub!(/greaterthan\<\/pre\>/, ">")
        else
          new_file = new_file + line
        end
      end
      file.close

      File.open(a, "w") do |f|
        f.write(new_file)
      end
    end
  end
#  @browser.reset
end

#
After do |scenario|
  #need to write as a byte instead of IP#puts
  if scenario.failed?
    #  name =  scenario.name.gsub!(' ', '').gsub!(/[\?\.\&=\-\/\\\(\),\'\"\|]/, '')
    filename = "#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}"
    File.open("./screenshots/#{filename}.jpeg", 'wb') do |f|
      f.write(Base64.decode64(@browser.driver.browser.screenshot_as(:base64)))
    end
    raise "lessthanimg src='D:/my_cucumber_projects/pe_cucumber_capybara/screenshots/#{filename}.jpeg' /greaterthan"
  end
end