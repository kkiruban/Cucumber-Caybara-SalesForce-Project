
Given(/^I should navigate to "([^"]*)" tab in the application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
  sleep 7
  step 'I navigate to "Leads" tab in the application'
  sleep 6
end



#Step definition for searching and selecting an Leads record
Then(/^I select "([^"]*)" record$/) do |record_name|  
  find(:xpath, '//input[@title="Search..."]').set record_name
  sleep 2
  find(:xpath, '//input[@value="Search"]').click
  sleep 5
  if page.has_xpath?('//div[contains(@class,"leadBlock")]')
    within(:xpath, '//div[contains(@class,"leadBlock")]')do
      if page.has_xpath?('//a[text()="'"#{lead_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{lead_Name}"'"])[1]').click
        puts "The record - #{lead_Name} - is found and selected"
        sleep 10
      else
        writeFailure "Fail to search - #{lead_Name} - record"
      end
    end
  end
end


#Step definition for searching and selecting an Leads record
Then(/^I select existing leads record$/) do
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    if (ENV['UserRole']=="opsmgrsit")
      lead_Name="Smoke Test _leads_opsManager"
      #puts "#{lead_Name}"
    elsif (ENV['UserRole']=="opsrepsit")
      lead_Name="Smoke Test _leads_opsRep"
      #puts "#{lead_Name}"
    elsif (ENV['UserRole']=="Admin")
      lead_Name="Smoke Test _leads_Admin"
      #puts "#{lead_Name}"
    elsif (ENV['UserRole']=="salesrepsit")
      lead_Name="Smoke Test _leads_SalesRep"
      #puts "#{lead_Name}"
    elsif (ENV['UserRole']=="salesmgrsit")
      lead_Name="Smoke Test _leads_SalesManager"
      # puts "#{lead_Name}"
    elsif (ENV['UserRole']=="salesopssit")
      lead_Name="Smoke Test _leads_SalesOps"
      #puts "#{lead_Name}"
    end
    find(:xpath, '(//input[@title="Search..."])[1]').set lead_Name
    sleep 5
    find(:xpath, '//input[@value="Search"]').click
    if (ENV['UserRole']=="salesopssit")
      if page.has_xpath?('(//a[text()="Search All"])[1]')
        find(:xpath, '(//a[text()="Search All"])[1]').click
      end
      #puts "#{lead_Name}"
    end
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"leadBlock")]')
    within(:xpath, '//div[contains(@class,"leadBlock")]')do
      if page.has_xpath?('//a[text()="'"#{lead_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{lead_Name}"'"])[1]').click
        puts "The record - #{lead_Name} - is found and selected"
        sleep 10
      else
        writeFailure "Fail to search - #{lead_Name} - record"
      end
    end
  end
end

# Verify error message over the page
Then(/^I should see error message "([^"]*)"$/) do |error_message|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[@class="pbError"]/p[contains(text(),"Contract Type is required when Stage = Stage 4 or greater")]')
    puts "The error message - #{error_message} - is appearing as expected."
    sleep 7
  elsif page.has_text?(error_message)
    #elsif page.has_xpath?('//div[@class="pbError"]/p[contains(text(),"Contract Type is required when Stage = Stage 4 or greater")]')
    puts "The error message - #{error_message} - is appearing as expected."
    sleep 7
  elsif page.has_content?(error_message)
    puts "The error message - #{error_message} - is appearing as expected."
    sleep 7
  else
    writeFailure "The error message - #{error_message} - is - NOT - appearing"
  end
  Capybara.default_wait_time =30
end

# Verify error message over the page
Then(/^I click the button "([^"]*)" over the page$/) do |button_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//input[@class="btn" and @title="'"#{button_name}"'"]')
    find(:xpath, '//input[@class="btn" and @title="'"#{button_name}"'"]').click
    puts "The button - #{button_name} - has been clicked"
    sleep 7
  else
    writeFailure "The button - #{button_name} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present as required field
Then(/^I should see the field "([^"]*)" over the page as required field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//div[@class="requiredInput"]')
    puts "The field - #{field_name} - is present over the page as required field"
    sleep 7
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page however is not a required field"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page with - READ ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present as required field
Then(/^I should see the field "([^"]*)" over the page as lookup$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]/following-sibling::a[contains(@title,"Lookup")]')
    puts "The field - #{field_name} - is present over the page as lookup"
    sleep 7
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page however is not a lookup"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page with - READ ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present picklist
Then(/^I should see the field "([^"]*)" over the page as picklist$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    puts "The field - #{field_name} - is present over the page as picklist"
    sleep 7
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page however is not a picklist"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page with - READ ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present picklist
Then(/^I should see the field "([^"]*)" over the page as multi select picklist$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//table[@class="multiSelectPicklistTable"]')
    puts "The field - #{field_name} - is present over the page as multi select picklist"
    sleep 7
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page however is not a multi select picklist"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page with - READ ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

#Step definition to verify date type field
Then(/^The field "([^"]*)" should be of date type$/) do |field_name|
  step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/*[contains(@class,"dateInput")]')
    puts "The - #{field_name} - field is -  Date Type -"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The field - #{field_name} - is - Not Date Type  -"
  end
  #end
  step 'I click Save button from top button row'
end

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is visible under "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')
    within(:xpath, '(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')do      
      if  page.has_xpath?('//label[text()="'"#{field_name}"'"]')
        puts "The field -#{field_name}- is present under #{section} section"
      elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
        puts "The field -#{field_name}- is present under #{section} section"
      else
        writeFailure"The field  - #{field_name} - is NOT present under #{section} section"
        #fail(ArgumentError.new('Fail'))
      end
    end
  else
    writeFailure"The section - #{section} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

When(/^I enter data in all the mandatory fields and enter "([^"]*)" in Lead Engagement Type dropdown$/) do |lead_Engagement_Type|
  begin  
    Capybara.default_wait_time =2
    step 'I select "1 Prospect" from "Stage" dropdown'
    
    step 'I select "Renewal" from "Lead Type" dropdown'
    if page.has_xpath?('//label[text()="Lead Engagement Type"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Lead Engagement Type"]/parent::td[1]/following-sibling::td[1]//select').select lead_Engagement_Type
    else
      writeFailure "Fail to enter data in - Lead Engagement Type - field"
    end

    if page.has_xpath?('//label[text()="Prior MRR"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Prior MRR"]/parent::td[1]/following-sibling::td[1]//input').set "10"
      
    else
      writeFailure "Fail to enter data in - Prior MRR - field"
    end
    if page.has_xpath?('//label[text()="Previous Contract"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_Pre_contract_"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Previous Contract"]/parent::td[1]/following-sibling::td[1]//input').set temp
    else
      writeFailure "Fail to enter data in - Previous Contract - field"
    end
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke Test _Account"
    else
      writeFailure "Fail to enter data in - Account Name - field"
    end
    if page.has_xpath?('//label[text()="Primary Contact"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Primary Contact"]/parent::td[1]/following-sibling::td[1]//input').set "Saswata Mukerji"
    else
      writeFailure "Fail to enter data in - Primary Contact - field"
    end
    if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_LastName"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set temp
    else
      writeFailure "Fail to enter data in - Last Name - field"
    end

    if page.has_xpath?('//label[text()="Company"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_Company_"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Company"]/parent::td[1]/following-sibling::td[1]//input').set temp
    else
      writeFailure "Fail to enter data in - Company - field"
    end
    step 'I select "CSM" from "Lead Source" dropdown'
    step 'I select "Spark" from "Products" multi dropdown'

    Capybara.default_wait_time =30
   
  end
end

# Verify if the field is present as NOT required field
Then(/^I should see the field "([^"]*)" over the page as not required field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//div[@class="requiredInput"]')
    writeFailure "The field - #{field_name} - is present over the page as required field"
    sleep 7
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present over the page as not required field"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is present over the page with - READ ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" over the page$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =4
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is not present with - READ ONLY - permission"
  else
    writeFailure "The field  - #{field_name} - is not present over the page"
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" as currency field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =4
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]/div')
    temp=find(:xpath, '//td[text()="'"#{field_name}"'"]/following-sibling::td[1]/div').text
    if temp.include? "USD"
      puts "The field  - #{field_name} - is a currency field"
    else
      writeFailure "The field  - #{field_name} - is - NOT - a currency field"
    end    
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field  - #{field_name} - is present over the page however is not containing any data"
  else
    writeFailure "The field  - #{field_name} - is not present over the page"
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


# Verify if the checkbox is enabled for the fields
Then(/^I should see track history checked for "([^"]*)" field$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td[1]/following-sibling::td[1]/input[@checked="checked"]')
    puts "The track history has been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td[1]/following-sibling::td[1]/input[not(@checked)]')
    writeFailure "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


When(/^I create new lead record by entering all the mandatory field$/) do
  begin    
    step 'I select "1 Prospect" from "Stage" dropdown'
    step 'I select "SD / Cisco" from "Lead Engagement Type" dropdown'
    step 'I select "Renewal" from "Lead Type" dropdown'

    if page.has_xpath?('//label[text()="Prior MRR"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Prior MRR"]/parent::td[1]/following-sibling::td[1]//input').set "10"
      #puts "Data in - Subject - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Prior MRR - field"
    end
    if page.has_xpath?('//label[text()="Previous Contract"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_Pre_contract_"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Previous Contract"]/parent::td[1]/following-sibling::td[1]//input').set temp
      #puts "Data in - Comments - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Previous Contract - field"
    end
    if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_LastName"+Random.new.rand(111..9999).to_s
      puts "The lead record name is - #{temp}"
      find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set temp
      #puts "Data in - Comments - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Last Name - field"
    end

    if page.has_xpath?('//label[text()="Cisco Rep"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Cisco Rep"]/parent::td[1]/following-sibling::td[1]//input').set "Saswata Mukerji"
    else
      writeFailure "Fail to enter data in - Cisco Rep - field"
    end
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke Test _Account"
    else
      writeFailure "Fail to enter data in - Account Name - field"
    end
    if page.has_xpath?('//label[text()="Primary Contact"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Primary Contact"]/parent::td[1]/following-sibling::td[1]//input').set "Saswata Mukerji"
    else
      writeFailure "Fail to enter data in - Primary Contact - field"
    end
    if page.has_xpath?('//label[text()="CSM"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="CSM"]/parent::td[1]/following-sibling::td[1]//input').set "Saswata Mukerji"
    else
      writeFailure "Fail to enter data in - CSM - field"
    end

    if page.has_xpath?('//label[text()="Sales Development"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Sales Development"]/parent::td[1]/following-sibling::td[1]//input').set "Saswata Mukerji"
    else
      writeFailure "Fail to enter data in - Sales Development - field"
    end
    if page.has_xpath?('//label[text()="Company"]/parent::td[1]/following-sibling::td[1]//input')
      temp="PES_Company_"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Company"]/parent::td[1]/following-sibling::td[1]//input').set temp
    else
      writeFailure "Fail to enter data in - Company - field"
    end
    step 'I select "CSM" from "Lead Source" dropdown'
    step 'I select "Spark" from "Products" multi dropdown'

    Capybara.default_wait_time =30
    if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
      find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
      sleep 120
    end
    if page.has_content?("Error: Invalid Data.")
      writeFailure "Account NOT saved successfully due to Invalid Data. "
    else
      puts "Activity History record created successfully"
    end
  end
end
  
# Verify if the checkbox is enabled for the fields
Then(/^I should see the field "([^"]*)" as empty field$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td[1]/following-sibling::td[1]/*[not(@value)]')
    puts "The - #{fieldName} - is empty field"
    sleep 5
  elsif page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td[1]/following-sibling::td[1]/*[@value]')
    writeFailure "The field - #{fieldName} - is - NOT - an empty field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to find field - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is enabled for the fields
Then(/^I should see the picklist "([^"]*)" as empty picklist$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  #if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td[1]/following-sibling::td[1]//script[contains(text(),"['','']")]')
  if page.has_select?(fieldName, :selected => "--None--")
    puts "The - #{fieldName} - is empty field"
    sleep 5
  else
    writeFailure "The field - #{fieldName} - is - NOT - an empty field"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Enter date in date field
Then(/^I enter date in "([^"]*)" field$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field #{fieldName}"
    sleep 5
  else
    if page.has_xpath?('//td[text()="'"#{fieldName}"'"]')
      writeFailure "The field - #{fieldName} - is present with R-Only permission"
    else
      writeFailure "Fail to find field - #{fieldName} -"
    end    
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# find if the field is locked
Then(/^I should see the  "([^"]*)" field$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field #{fieldName}"
    sleep 5
  else
    writeFailure "Fail to find field - #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


# find if the field is locked
Then(/^I should see the "([^"]*)" field as ReadOnly field$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{fieldName}"'"]/following-sibling::td[contains(@class,"inlineEditLock")]')
    puts "The field - #{fieldName} - is present over the page with READ-ONLY permission"
    sleep 5
  else
    writeFailure "Fail to find the permission of the field - #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify options under given dropdown
Then(/^I should see the "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    puts "The option - #{option} - is present under - #{dropdown_name} - dropdown"
  else
    if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option')
      writeFailure "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
      #fail(ArgumentError.new('Fail'))
    else
      if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
        #fail(ArgumentError.new('Fail'))
      else
        writeFailure "The DROPDOWN - #{dropdown_name} - is NOT present over the page"
        #fail(ArgumentError.new('Fail'))
      end

    end
  end
  Capybara.default_wait_time =30
end