

require 'capybara'
require 'selenium-webdriver'
require 'win32ole'

#create
session = Capybara::Session.new(:selenium)

#to navigate to url
session.visit "https://test.salesforce.com/"


#book = Spreadsheet.open('D:\\spreedsheet.xlsx')

#sheet1 = book.worksheet('Sheet1')


excelsheet = WIN32OLE.new('excel.application')
 wrkbook= excelsheet.Workbooks.Open("D:\\spreedsheet.xlsx")

 wrksheet= wrkbook.Worksheets(1)
 wrksheet.Select

 username1= wrksheet.Range("a2").Value
 password1= wrksheet.Range("b2").Value
 
 
 puts username1
 puts password1

 session.fill_in('Username', :with => username1)
 session.fill_in('password', :with => password1)