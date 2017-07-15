require "selenium-webdriver"

##Firefox browser instantiation
#driver = Selenium::WebDriver.for :phantomjs
 driver = Selenium::WebDriver.for :chrome

  driver.navigate.to "https://test.salesforce.com/"
  
   sleep 10
   #maximize the window
driver.manage.window.maximize
   
   if driver.find_element(:id,"username").displayed?
     driver.find_element(:id,"username").send_keys("dsintegration-admin@servicesource.com.sitmcafee")
	 puts "successfully entered username"
    else
	  puts "username field is not visible"
   end
   if driver.find_element(:id,"password").displayed?
     driver.find_element(:id,"password").send_keys("srevds123!")
	 puts "successfully entered password"
    else
	  puts "password field is not visible"
   end
   
   if driver.find_element(:id,"password").displayed?
     driver.find_element(:id,"Login").click
	 puts "logged in successfully"
	 sleep 30
    else
	  puts "login button is not visible"
   end
   
   driver.find_element(:xpath,".//*[@id='Opportunity_Tab']/a").click
   sleep 25
   driver.find_element(:name,"new").click
   sleep 10
   
   select_box=driver.find_element(:id,'p3')

options=select_box.find_elements(:tag_name=>"option")
options.each do |option_field|
if option_field.text == 'Opportunity - Read Only'
option_field.click
break
end
end
   sleep 10
   puts "successfully selected Opportunity - Read Only"
   
   #quit the driver
   driver.close
   
   