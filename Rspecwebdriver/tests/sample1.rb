require "selenium-webdriver"
require "rspec"

describe "sample1" do

  before(:each) do
    @driver = Selenium::WebDriver.for(:chrome)
    @base_url = "https://test.salesforce.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @driver.manage.window.maximize
  end

  after(:each) do
    @driver.quit
  end

  it "search text on google" do
    @driver.get(@base_url)
    sleep 5
    @driver.find_element(:id, "username").send_keys "testing"
    @driver.find_element(:id, "password").send_keys "testing"
    @driver.find_element(:id, "Login").click
    sleep 10
#    expect(@driver.title).to.be == ''
  end
end
