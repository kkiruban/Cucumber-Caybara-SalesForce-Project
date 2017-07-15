require_relative '../../src/page-objects/abstract_page'

class LoginPage < Abstract_Page

   def initialize (driver)
     super(driver)
   end

    def loginSalesforce
      @@driver.find_element(:id,"username").send_keys("kiruba")
      @@driver.find_element(:id,"password").send_keys("kiruba")
      @@driver.find_element(:id,"Login").click
      return LoginPage.new(driver)
    end
end