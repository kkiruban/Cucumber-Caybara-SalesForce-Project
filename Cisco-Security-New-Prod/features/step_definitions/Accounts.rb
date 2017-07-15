Given(/^I enter value to all the mandatory field$/) do
    $account_name = "Smoke_test_accounts_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set $account_name
    puts "New account record - #{$account_name} is created"
  else
    writeFailure "Fail to enter data in - Account Name - field "
  end
  if page.has_xpath?('//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input').set "12345"
    puts "Enter - 1234 - in Account Number field"
  else
    writeFailure "Fail to enter data in - Account Number - field "
  end
  if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
    puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
  end
end

#Step definition to verify if the button is present over the page
Then(/^I should see the "([^"]*)" button over the page$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//input[@class="btn" and @title="'"#{field_name}"'"]')
      puts "The button - #{field_name} - is present over page"
    elsif page.has_xpath?('//*[contains(@class,"Button") and text()="'"#{field_name}"'"]')  #Used at few places, dont delete
       puts "The button - #{field_name} - is present over page"
    else
      writeFailure "The button - #{field_name} - is - NOT - present over the page"
    end
    #end
    Capybara.default_wait_time =30
  end
end

#Step definition to verify if the button is present over the page
Then(/^I should see the field Partner Type editable for ops role only$/) do 
  begin
    Capybara.default_wait_time =2
    if (ENV['UserRole']=="OperationManagerSit") or (ENV['UserRole']=="OperationRepSit")
      if page.has_xpath?('(//label[text()="Partner Type"]/parent::td[1]/following-sibling::td[1]//*)[1]')
        puts "The field  - Partner Type - is present over page with RW permission"
      else
        writeFailure "The field  - Partner Type - is NOT present over page with RW permission"
      end
    elsif (ENV['UserRole']!="OperationManagerSit") and (ENV['UserRole']!="OperationRepSit")
        if page.has_xpath?('(//label[text()="Partner Type"]/parent::td[1]/following-sibling::td[1]//*)[1]')
        writeFailure "The field  - Partner Type - is present over page with RW permission"
      else
        puts "The field  - Partner Type - is NOT present over page with RW permission"
      end
    end
    #end
    Capybara.default_wait_time =30
  end
end
