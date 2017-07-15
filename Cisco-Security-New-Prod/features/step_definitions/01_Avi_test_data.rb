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
  sleep 10

  if page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{account_name}"'"]')    
    flag=0    
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'Navigate to "Accounts" tab'
    step 'I follow on "New" button'

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

    step 'I click on "Save" button from top row'
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
  sleep 10

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
    step 'I follow on "New" button'
    #step 'I select "Opportunity - Edit" from "Record Type of new record" dropdown'
    step 'I clicked "Continue" button over the page'
    if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set opportunity_name
      puts "Entered -- opportunity_name -- in Opportunity name field"
    else
      writeFailure "Fail to enter data in - Opportunity Name - field "
    end
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
      puts "Entered -- Smoke_test_accounts_avi -- in Account Name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end

    if page.has_xpath?('//label[text()="Renewal Target"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Renewal Target"]/parent::td[1]/following-sibling::td[1]//input').set "1"
      puts "Entered -- 1 -- in Renewal Target field"
      #    else
      #      writeFailure "Fail to enter data in - Renewal Target - field "
    end

    if page.has_xpath?('//label[text()="Amount"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Amount"]/parent::td[1]/following-sibling::td[1]//input').set "1"
      puts "Entered -- 1 -- in Amount field"
    else
      writeFailure "Fail to enter data in - Amount - field "
    end

    if page.has_xpath?('//label[text()="Close Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
      find(:xpath, '//label[text()="Close Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
      puts "Entered current date in field -- Close Date"
      sleep 5
    else
      writeFailure "Fail to enter date in field - Close Date -"
      #fail(ArgumentError.new('Fail'))
    end

    if page.has_xpath?('//label[text()="Business Line"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Business Line"]/parent::td[1]/following-sibling::td[1]//select').select "Maintenance Renewals"
      puts "Entered -- Core -- in -- Business Line -- field"
    else
      writeFailure "Fail to enter data in -- Business Line -- field "
    end

    if page.has_xpath?('//label[text()="Direct/Channel"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Direct/Channel"]/parent::td[1]/following-sibling::td[1]//select').select "Direct"
      puts "Entered -- Direct -- in -- Direct/Channel -- field"
    else
      writeFailure "Fail to enter data in -- Direct/Channel -- field "
    end

    if page.has_xpath?('//label[text()="Price Book"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Price Book"]/parent::td[1]/following-sibling::td[1]//input').set "Standard Price Book"
      puts "Entered -- Standard Price Book -- in -- Price Book -- field"
    else
      writeFailure "Fail to enter data in -- Price Book -- field "
    end

    if page.has_xpath?('//label[text()="Opportunity Type"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Opportunity Type"]/parent::td[1]/following-sibling::td[1]//select').select "Enterprise"
      puts "Entered -- Enterprise -- in -- Opportunity Type -- field"
    else
      writeFailure "Fail to enter data in -- Opportunity Type -- field "
    end

#    if page.has_xpath?('//label[text()="Client Territory"]/parent::td[1]/following-sibling::td[1]//select')
#      find(:xpath, '//label[text()="Client Territory"]/parent::td[1]/following-sibling::td[1]//select').select "USA"
#      puts "Entered -- Central -- in -- Client Territory -- field"
#    else
#      writeFailure "Fail to enter data in -- Client Territory -- field "
#    end
    if page.has_xpath?('//label[text()="Stage"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Stage"]/parent::td[1]/following-sibling::td[1]//select').select "Contacted"
      puts "Entered -- Contacted -- in -- Stage -- field"
    else
      writeFailure "Fail to enter data in -- Stage -- field "
    end
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "USA"
      puts "Entered -- NALA -- in -- Client Region -- field"
    else
      writeFailure "Fail to enter data in -- Client Region -- field "
    end
    if page.has_xpath?('//label[text()="Country"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Country"]/parent::td[1]/following-sibling::td[1]//select').select "American Samoa"
      puts "Entered -- American Samoa -- in -- Country -- field"
    else
      writeFailure "Fail to enter data in -- Country -- field "
    end
    if page.has_xpath?('//label[text()="SSI Theatre"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="SSI Theatre"]/parent::td[1]/following-sibling::td[1]//select').select "APJ"
      puts "Entered -- APJ -- in -- SSI Theatre -- field"
    else
      writeFailure "Fail to enter data in -- SSI Theatre -- field "
    end
    step 'I click on "Save" button from top row'
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
    step 'I follow on "New" button'

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
    step 'I click on "Save" button from top row'
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
