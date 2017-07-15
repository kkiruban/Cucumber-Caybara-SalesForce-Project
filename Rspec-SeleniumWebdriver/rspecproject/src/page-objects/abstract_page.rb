require 'rspec'
require 'selenium-webdriver'

class Abstract_Page

  @@driver = nil

   def initialize (driver)
      @@driver = driver
   end

     def navigateToAppRoot
       @@driver.navigate.to 'https://test.salesforce.com/'
       return LoginPage.new(driver)
     end
   def quit
     @@driver.quit
   end

   def getPageTitle
     return @@driver.title
   end
end