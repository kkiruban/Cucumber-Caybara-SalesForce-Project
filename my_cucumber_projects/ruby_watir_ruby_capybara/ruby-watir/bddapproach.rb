#require "rubygems"
require "watir"
require "watir-webdriver"
require "rspec"
require 'colorize'
require 


#from the watir library go to the browser class and instatiee a browser class and give the firefox

mybrowser = Watir::Browser.new:firefox

#visit royalmail.com
mybrowser.goto "http://localhost/bdd/"

def assert message, &block
    begin
        if (block.call)
            puts "Assertion PASSED for #{message}".green
        else
            puts "Assertion FAILED for #{message}".red
        end
    rescue => e
        puts "Assertion FAILED for #{message} with exception '#{e}'".red
    end
end

#verify the text_field
assert('that the page title exists') { mybrowser.h1(text: 'Welcome to BDD Section').visible? }
#puts mybrowser.h1(text: 'Welcome to BDD Section').visible?

#verifying the first name field whether is it exist in a webpage
puts mybrowser.input(id: 'first_name').exists?

#passing a firstname parameter into first name edit box
mybrowser.text_field(:id,'first_name').set("test")

#passing a lastname parameter into first name edit box
mybrowser.text_field(:id,'last_name').set("user")

#clicking hobbies checkbox
mybrowser.checkbox(:id, "Hobbies-1").set

#performing action in country selectbox 
mybrowser.select_list(:id, "country-name").select_value("India")

#clicking subscribe checkbox
mybrowser.checkbox(:id, "Subscribe").set

#clicking donate  radio button
mybrowser.radio(:id, "Donate-yes").set

#clicking confirm and submit button
mybrowser.button(:id, "submit_page").click

mybrowser.close

