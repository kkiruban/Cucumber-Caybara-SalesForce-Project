


require  "watir"
require  "watir-webdriver"
require  "rspec"
require "WIN32OLE"
require "colorize"

#to a open a firefox broswer 
mybrowser=Watir::Browser.new:firefox


#to navigate to url
mybrowser.goto ("http://www.royalmail.com/")

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


#to verify log in register link  --return boolean
assert('link is exist') { mybrowser.a(text: 'Log in or register').exists? }


#need to click on log in or register link
mybrowser.link(:text, "Log in or register").click


#need to click on register link
mybrowser.link(:text, "Register").click

#verfying the title text
assert('expected title exist in a webpage') { mybrowser.h1(text: 'Register with royalmail.com').text }
puts mybrowser.h1(text: 'Register with royalmail.com').text


#verifying personal radio button is exist or not --returns boolean
puts mybrowser.input(value: 'personal').exists?

#to click on personal radio button
mybrowser.radio(:id, "edit-account-type-personal").set

#clicking on continue button
mybrowser.button(:id, "edit-continue").click

#to select a mr value from title select box
mybrowser.select_list(:id, "edit-title-of-person").select_value("Mr.")

 excelsheet = WIN32OLE.new('excel.application')
 wrkbook= excelsheet.Workbooks.Open("D:\\Users\\kkiruban\\Desktop\\ruby.xlsx")

 wrksheet= wrkbook.Worksheets("Sheet1")
 wrksheet.Select

 firstname= wrksheet.Range("a1").Value
 lastname= wrksheet.Range("b1").Value

#to pass a parameter into first name edit box
mybrowser.text_field(:id, "edit-first-name").set(firstname)

#to pass a parameter into first name edit box
mybrowser.text_field(:id, "edit-last-name").set(lastname)

#to click on check box
mybrowser.checkbox(:id, "edit-terms-conditions").set

#clicking on continue button
mybrowser.button(:id, "edit-register").click











