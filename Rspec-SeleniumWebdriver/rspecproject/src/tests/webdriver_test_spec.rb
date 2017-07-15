require 'rspec'
require 'selenium-webdriver'

describe 'Salesforce Site' do

  app = nil

  before(:each) do
    #create a webdriver driver
    app = Abstract_Page.new(Selenium::WebDriver.for(:chrome))

    @driver.manage.window.maximize
  end


  it 'should open browser and fill invalid username and  invalid password' do

     # #enter username,password and click on login button
     #    @driver.find_element(:id,"username").send_keys("kiruba")
     #
     #    @driver.find_element(:id,"password").send_keys("kiruba")
     #
     #    @driver.find_element(:id,"Login").click
     #
     #   if @driver.find_element(:id,'error').displayed?
     #     puts "Please check your username and password. If you still can't log in, contact your Salesforce administrator."
     #   else
     #      puts "failed"
     #   end
     #   title = @driver.title
     #   expect(title).to be == 'kiruba'
     app.loginSalesforce
  end

    after(:each) do
      app.quit
    end

end