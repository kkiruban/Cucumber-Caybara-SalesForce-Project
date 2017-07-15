Given(/^I navigate to "([^"]*)" tab in the salesforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
  sleep 10
  if page.has_xpath?('//li/a[text()="'"#{tab}"'"]')
    find(:xpath, '//li/a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  elsif page.has_xpath?('//img[@title="All Tabs"]')
    find(:xpath, '//img[@title="All Tabs"]').click
    sleep 3
    find(:xpath, '//a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  else
    writeFailure "Fail to find tab - #{tab} -"
    #fail(ArgumentError.new('Fail to find tab - '+ tab))
  end
  sleep 10
end

When(/^I should create new account record "([^"]*)" as test data$/) do |account_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set account_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 5
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  sleep 5

  if page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{account_name}"'"]')    
    flag=0    
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Accounts" tab'
    step 'I click "New" button'

    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set account_name
      puts "Enter - #{$account_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input').set "1234"
      puts "Enter - 1234 - in account Number field"
    else
      writeFailure "Fail to enter - 1234 - in account Number field "
    end
    if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
      puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
    end

    step 'I click Save button from top button row'
    step 'The "Account" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
end

When(/^I should create new opportunity record "([^"]*)" as test data$/) do |opportunity_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 5
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  sleep 5
  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]')
    within(:xpath, '//div[contains(@class,"opportunityBlock")]')do
      #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
      if page.has_xpath?('//a[text()="'"#{opportunity_name}"'"]')
        sleep 1
        flag=0
      end
    end
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Opportunities" tab'
    step 'I click "New" button'
    #step 'I select "Opportunity - Edit" from "Record Type of new record" dropdown'
    step 'I clicked "Continue" button over the page'
    if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set opportunity_name
      puts "Entered -- opportunity_name -- in Opportunity name field"
    else
      writeFailure "Fail to enter data in - Opportunity Name - field "
    end
    
    step 'I select first option from "Stage" dropdown MC'
    step 'I select first option from "SSI Theatre" dropdown MC'
    step 'I select first option from "Country" dropdown MC'
    step 'I select first option from "Client Region" dropdown MC'
    step 'I select first option from "Client Territory" dropdown MC'
    step 'I select first option from "Opportunity Type" dropdown MC'
    step 'I select first option from "Business Line" dropdown MC'
    step 'I select first option from "Direct/Channel" dropdown MC'
    step 'I enter date in "Close Date" field MC'
    step 'I enter "Standard Price Book" in "Price Book" lookup field MC'
    step 'I select first option from "Business Line" dropdown MC'
    step 'I enter "Smoke_test_accounts_MC" in "Account Name" lookup field MC'
  
    step 'I click Save button from top button row'
    step 'The "Opportunity" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end

end

When(/^I should create new contact record "([^"]*)" as test data$/) do |contact_name|
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set contact_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end

  if page.has_xpath?('//div[contains(@class,"contactBlock")]')
    within(:xpath, '//div[contains(@class,"contactBlock")]')do
      #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
      if page.has_xpath?('//a[text()="'"#{contact_name}"'"]')
        sleep 1
        flag=0
      end
    end
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Contacts" tab'
    step 'I click "New" button'

    #$last_name = "Smoke_test_contacts_Avi"
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_accounts_cases"
      puts "Entered -- Smoke_test_accounts_avi -- in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set contact_name
      puts "Entered -- #{contact_name} -- in last name field"
    else
      writeFailure "Fail to enter data in last name field"
    end
    step 'I click Save button from top button row'
    step 'The "Contacts" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end

  #  if page.has_xpath?('//label[text()="First Name"]/parent::td[1]/following-sibling::td[1]//input')
  #    find(:xpath, '//label[text()="First Name"]/parent::td[1]/following-sibling::td[1]//input').set $fist_name
  #    puts "Entered -- #{$fist_name} -- in First Name field"
  #  else
  #    writeFailure "Fail to enter data in First Name field"
  #  end
end

Given(/^I enter value to all the mandatory field over Location Address edit page$/) do
  $lastName = "Smoke_test_Location_Address_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Location Address Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Location Address Name"]/parent::td[1]/following-sibling::td[1]//input').set $lastName
    puts "Entered data - #{$lastName} - in - Location Address Name - field"
  else
    writeFailure "Fail to enter data in - Location Address Name - field "
  end
  #  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
  #    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
  #    puts "Enter data in Account Name"
  #  else
  #    writeFailure "Fail to enter data in - Account Name - field "
  #  end
end

Given(/^I enter value to all the mandatory field over new account page$/) do
  $account_name = "Smoke_test_accounts_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set $account_name
    puts "New account record - #{$account_name} is created"
  else
    writeFailure "Fail to enter data in - Account Name - field "
  end
  if page.has_xpath?('//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Number"]/parent::td[1]/following-sibling::td[1]//input').set "123"
    puts "Enter - 1234 - in Account Number field"
    #  else
    #    writeFailure "Fail to enter data in - Account Number - field "
  end
  if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
    puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
  end
end