
When(/^I enter the value in all the mandatory field over case edit page for record type Data Update Request$/) do
  sleep 5
  Capybara.default_wait_time =1 
  if page.has_xpath?('//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke-test-opportunity-for-cases"
    puts "Entered -- Smoke_test_opportunity_avi -- in Opportunity field"
  else
    writeFailure "Fail to enter data in - Opportunity - field "
  end
  
  if page.has_xpath?('//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_primery_contact"
    puts "Entered -- Smoke_test_contacts_Avi -- in Contact Name field"
  else
    writeFailure "Fail to enter data in - Contact Name - field"
  end
  
  if page.has_xpath?('//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input').set "123"
    puts "Entered -- 132 -- in -- Contract Amount -- field"
  end

  if page.has_xpath?('//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Description -- field"
  else
    writeFailure "Fail to enter data in -- Description -- field "
  end

  if page.has_xpath?('//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select').select "New"
    puts "Entered -- New -- in -- Sub Case Type -- field"
  else
    writeFailure "Fail to enter data in -- Sub Case Type -- field "
  end

  if page.has_xpath?('//label[text()="New Term Dates"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="New Term Dates"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- New Term Dates -- field"
  end

  if page.has_xpath?('//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Product(s) That Needs To Be Quoted -- field"
  end
  if page.has_xpath?('//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Applicable Discounts -- field"
  end
  Capybara.default_wait_time =30
end


# Click the button
Then(/^I should see "([^"]*)" under "([^"]*)" field$/) do |field_data, field_name|
  sleep 5
  Capybara.default_wait_time =1  
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]//div[contains(text(),"'"#{field_data}"'")]')
    puts "The data -- #{field_data} -- is present under the field -- #{field_name} --"
  else
    writeFailure "Fail to find the data -- #{field_data} -- under the field -- #{field_name} --"
  end
  Capybara.default_wait_time =30
end

When(/^I enter the value in all the mandatory field over case edit page for "([^"]*)" record type$/) do |record_type|
  sleep 3
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_accounts_cases"
    puts "Entered -- Smoke_test_accounts_cases -- in Account Name field"
    #  else
    #    writeFailure "Fail to enter data in - Account Name - field"
  end
  
  if page.has_xpath?('//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke-test-opportunity-for-cases"
    puts "Entered -- Smoke_test_opportunity_avi -- in Opportunity field"
    #  else
    #    writeFailure "Fail to enter data in - Opportunity - field "
  end

  if page.has_xpath?('//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_primery_contact"
    puts "Entered -- Smoke_test_contacts_Avi -- in Contact Name field"
    #  else
    #    writeFailure "Fail to enter data in - Contact Name - field"
  end

  if page.has_xpath?('//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input').set "123"
    puts "Entered -- 132 -- in -- Contract Amount -- field"
  end

  if page.has_xpath?('//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Description -- field"
    #  else
    #    writeFailure "Fail to enter data in -- Description -- field "
  end
  if page.has_xpath?('//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select').select "New"
    puts "Entered -- New -- in -- Sub Case Type -- field"
  end
  #  if (record_type=="Booking Request")
  #    if page.has_xpath?('//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select')
  #      find(:xpath, '//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select').select "New"
  #      puts "Entered -- New -- in -- Sub Case Type -- field"
  #    end
  #  end
  

  #  if page.has_xpath?('//label[text()="New Term Dates"]/ancestor::td[1]/following-sibling::td[1]//textarea')
  #    find(:xpath, '//label[text()="New Term Dates"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
  #    puts "Entered -- Testing -- in -- New Term Dates -- field"
  #  end

  if page.has_xpath?('//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Product(s) That Needs To Be Quoted -- field"
  end
  if page.has_xpath?('//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Applicable Discounts -- field"
  end
  Capybara.default_wait_time =30
end


When(/^I enter the value in all the mandatory field over case edit page for record type Quote Request Request$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//a/img')
    find(:xpath, '//label[text()="Opportunity"]/parent::td[1]/following-sibling::td[1]//span//a/img').click
    puts "Opportunity lookup icon has been clicked"
    #  else
    #    writeFailure "Fail to enter data in - Contact Name - field"
  end
  within_window(page.driver.browser.window_handles.last) do
    sleep 15
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 2
    within_frame('searchFrame')do
      find(:xpath, '//input[@name="lksrch"]').set "Smoke-test-opportunity-for-cases"
      click_button('Go!')
      sleep 10
    end
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all("tr")[1].all("th")[0].find('a').click
    end
  end
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_accounts_cases"
    puts "Entered -- Smoke_test_accounts_cases -- in Account Name field"
    #  else
    #    writeFailure "Fail to enter data in - Account Name - field"
  end

  if page.has_xpath?('//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input')
    find(:xpath, '//label[text()="Contact Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke_test_primery_contact"
    puts "Entered -- Smoke_test_contacts_Avi -- in Contact Name field"
    #  else
    #    writeFailure "Fail to enter data in - Contact Name - field"
  end

  if page.has_xpath?('//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Contract Amount"]/ancestor::td[1]/following-sibling::td[1]//input').set "123"
    puts "Entered -- 132 -- in -- Contract Amount -- field"
  end

  if page.has_xpath?('//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Description -- field"
    #  else
    #    writeFailure "Fail to enter data in -- Description -- field "
  end
  if page.has_xpath?('//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Sub Case Type"]/parent::td[1]/following-sibling::td[1]//select').select "New"
    puts "Entered -- New -- in -- Sub Case Type -- field"
  end
  if page.has_xpath?('//label[text()="Quote Type"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Quote Type"]/parent::td[1]/following-sibling::td[1]//select').select "1 Year"
    puts "Entered -- New -- in -- Quote Type -- field"
  end
  if page.has_xpath?('//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Product(s) That Needs To Be Quoted"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Product(s) That Needs To Be Quoted -- field"
  end
  if page.has_xpath?('//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Applicable Discounts"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
    puts "Entered -- Testing -- in -- Applicable Discounts -- field"
  end
    
  Capybara.default_wait_time =30
end 


# Verify the section over the page
Then(/^I should see "([^"]*)" in Case Milestones section$/) do |link_name|
sleep 10
if page.has_xpath?('//div[contains(@class,"caseBlock")]//a[contains(text(),"'"#{link_name}"'")]')
  puts "The section - Case Milestones - is showing - #{link_name} -"
  sleep 5
else
  writeFailure "The section - Case Milestones - is NOT showing - #{link_name} - under it"
  #fail(ArgumentError.new('Fail'))
end
end

#Step to verify the drop down options appearing against requirement
Then(/^I verified Renewal Status field for "([^"]*)" option$/) do |select_field|
begin
  sleep 5
  arg=getGeneralDetails "CommonData"
  resultArray=[]
  if select_field== "Closed Sale"
    expectedArrayOption=["--None--","CS - Backdated - BKD","CS - Co-term Long - CTL","CS - Co-term Short - CTS","CS - Discount - DIS","CS - Multi-year Advance - MYA","CS - Multi-year Annual - MYY","CS - Pricing Change - PRC","CS - Re-Cert Fee Included - RCT","CS - Renewed at Par - R@P","CS - Service Downgrade - DNG","CS - Service Upgrade - UPG","CS - Uncovered - UNC"]
  elsif select_field== "House Account"
    expectedArrayOption=["--None--","HA - Bad Data - BDT","HA - Cancelled - CNL","HA - Covered - COV","HA - Duplicate - DUP","HA - End of Life - EOL","HA - Other - OTH","HA - Product Return - PRT","HA - Sales Pull Back - SPB","HA - Client Product Replacement - CPR","HA - System Relocation - SRL"]
  elsif select_field== "No Service"
    expectedArrayOption=["--None--","NS - Competitive Product Replacement - PCP","NS - Competitive Service Loss Other - SCS","NS - Customer No Longer Exists - RNE","NS - Customer Satisfaction Driven - SSD","NS - Product Decommissioned - PPD","NS - Unresponsive End User - REU","NS - Cost Benefit/Budget - CBB","NS - Cost Benefit/Value - CBV","NS - Instrument Low Usage - ILU","NS - In-House Service Provider - ISP","NS - Time and Materials - TNM"]
  end
  actualArrayOption=[]
    

  if page.has_select?("Renewal Status")
    actualArrayOption=find_field("Renewal Status").all('option').collect(&:text)
  elsif page.has_xpath?('//td[text()="'"#{Renewal Status}"'"]')
    writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
    next
  elsif page.has_xpath?('//th[text()="'"#{Renewal Status}"'"]')
    writeFailure "The dropdown - Renewal Status - is appearing with - R Permission -"
    next
  end
  temp_Array=actualArrayOption.find_all { |e| actualArrayOption.count(e) > 1 }
  if temp_Array.count>0
    writeFailure "Following are the duplicate option appearing in dropdown  -- Renewal Status"
    writeFailure temp_Array
  end
  resultArray=expectedArrayOption.sort-actualArrayOption.sort
  if resultArray.count==0
    puts "The expected options for the field - Renewal Status - is present"
  else
    writeFailure "The following options from - Renewal Status -  dropdown is missing"
    writeFailure resultArray
  end
  resultArray=actualArrayOption.sort-expectedArrayOption.sort
  if resultArray.count!=0
    writeFailure "The following extra options are appearing in  - Renewal Status -  dropdown"
    writeFailure resultArray
  end
  sleep 5
rescue Exception => ex
  writeFailure "Error while verifying - Renewal Status - picklist option"
  writeFailure ex.message
end
end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_val, field_val|
if page.has_field?(field_val)
  select(option_val, :from => field_val)
end
end


When(/^I enter the mandatory field values under new case for data update request$/) do
sleep 5  
if page.has_xpath?('//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea')
  find(:xpath, '//label[text()="Description"]/ancestor::td[1]/following-sibling::td[1]//textarea').set "Testing"
  puts "Entered -- Testing -- in -- Description -- field"
  #  else
  #    writeFailure "Fail to enter data in -- Description -- field "
end
Capybara.default_wait_time =30
end

When(/^I should see Case Owner field value as "([^"]*)"$/) do |field_data|
sleep 5
if page.has_xpath?('//td[text()="Case Owner"]/following-sibling::td[1]//a[contains(text(),"Sales & Ops Manager Queue")]')
  puts "The field - Case Owner - is showing - #{field_data} -"
else
  writeFailure "FAIL The field - Case Owner - is NOT showing - #{field_data} -"
end
Capybara.default_wait_time =30
end

When(/^I capture the case number$/) do
sleep 5
if page.has_xpath?('//td[text()="Case Number"]/following-sibling::td[1]')
  $caseNumber=find(:xpath, '//td[text()="Case Number"]/following-sibling::td[1]').text
  puts "The case number is - #{$caseNumber} -"
else
  writeFailure "FAIL to capture the case numebr"
end
Capybara.default_wait_time =30
end

When(/^I search the case number created$/) do
sleep 3  
find(:xpath, '//input[@title="Search..."]').set $caseNumber
sleep 5
find(:xpath, '//input[@value="Search"]').click
sleep 10
if page.has_xpath?('//div[contains(@class,"caseBlock")]//a[text()="'"#{$caseNumber}"'"]')
  find(:xpath, '//div[contains(@class,"caseBlock")]//a[text()="'"#{$caseNumber}"'"]').click
  puts "The case number - #{$caseNumber} - is found and clicked"
else
  writeFailure "FAIL to find the case number - #{$caseNumber} -"
end
end


When(/^I clicked the case number from Items to Approve section$/) do
if page.has_xpath?('//a[text()="Approve / Reject"]/parent::td/following-sibling::th/a[text()="'"#{$caseNumber}"'"]')
  find(:xpath, '//a[text()="Approve / Reject"]/parent::td/following-sibling::th/a[text()="'"#{$caseNumber}"'"]').click
  puts "The case number - #{$caseNumber} - is found and clicked"
else
  writeFailure "FAIL to find the case number - #{$caseNumber} -"
end
end

#Step definition to verify if the field is present under a particular page section
Then(/^I clicked the link "([^"]*)" from "([^"]*)" section$/) do |field_name, section|
sleep 5
Capybara.default_wait_time =1
if page.has_xpath?('(//h3[text()="'"#{section}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{field_name}"'"])[1]')
  find(:xpath, '(//h3[text()="'"#{section}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{field_name}"'"])[1]').click
  puts "The link - #{field_name} - is clicked from - #{section} - section"
else
  writeFailure"FAIL tto click the link - #{field_name} - from #{section} section"
  #fail(ArgumentError.new('Fail'))
end
Capybara.default_wait_time =30
end

Then(/^I should see the HA NS meets approval criteria check box checked$/) do 
sleep 5
Capybara.default_wait_time =1
if page.has_xpath?('//td[text()="HA/ NS meets approval criteria"]/following-sibling::td[1]//img[@title="Checked"]')
  puts "The HA NS meets approval criteria check box is checked"
  sleep 5
else
  writeFailure "The HA NS meets approval criteria check box is NOT checked"
  #fail(ArgumentError.new('Fail'))
end
Capybara.default_wait_time =30
end

When(/^I should not see lock icon next to edit button$/) do
sleep 5
if page.has_xpath?('//img[@title="Locked"]/following-sibling::input[@title="Edit"]')
  writeFailure "FAIL - The - Lock Icon - is appearing next to - Edit - button"
else
  puts "The - Lock Icon - is NOT appearing next to - Edit - button"
end
Capybara.default_wait_time =30
end


#step definition to navigate to particular tab
When(/^Navigate to "([^"]*)" tab$/) do |tab|
sleep 5
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
end

When(/^I select "([^"]*)" from record type of new record$/) do |arg1|
select arg1, :from => "Record Type of new record"
sleep 3
if find(:button,'Continue').visible?
  sleep 2
  click_on('Continue')
  puts "clicked on continue button"
else
  puts "Continue button is not available for this user"
end
end

# Verify a section over page
Then(/^I should not see the "([^"]*)" section over the page$/) do |section_Name|
sleep 5
if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
  writeFailure "The section - #{section_Name} - is present over the page"
  sleep 5
else
  puts "The section - #{section_Name} - is NOT present over the page"
  #fail(ArgumentError.new('fail to click Cancel button'))
end
end

When(/^I select the existing opportunity "([^"]*)"$/) do |opportunity_name|
sleep 3
flag=0
find(:xpath, '//input[@title="Search..."]').set opportunity_name
sleep 5
find(:xpath, '//input[@value="Search"]').click
sleep 5

if page.has_xpath?('//div[contains(@class,"opportunityBlock")]')
  #    within(:xpath, '//div[contains(@class,"opportunityBlock")]')do
  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]//a[text()="'"#{opportunity_name}"'"]')
    find(:xpath, '//div[contains(@class,"opportunityBlock")]//a[text()="'"#{opportunity_name}"'"]').click
    puts "The opprtunity record -- #{opportunity_name} --- is found and selected"
  end
  #    end
elsif page.has_xpath?('//div[text()="No matches found"]')
  writeFailure "The opportunity record  - #{opportunity_name} - is - NOT - found"
end
sleep 5
end


# Verify ptions under drop down
Then(/^I should see the option "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
sleep 5
Capybara.default_wait_time =1
if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
  puts "The option - #{option} - is present under under - #{dropdown_name} - dropdown"
else
  if page.has_xpath?('(//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select)[1]')
    writeFailure "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
    #fail(ArgumentError.new('Fail'))
  else
    if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
      writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
      #fail(ArgumentError.new('Fail'))
    elsif page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]')
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

# Click the button
Then(/^I clicked "([^"]*)" button over the page$/) do |field_name|
sleep 5
Capybara.default_wait_time =1
if page.has_xpath?('//input[@title="'"#{field_name}"'"]')
  find(:xpath, '//input[@title="'"#{field_name}"'"]').click
  puts "The button -- #{field_name} -- has been clicked"
  #  else
  #    writeFailure "Fail to click the button -- #{field_name} --"
end
Capybara.default_wait_time =30
end

When(/^I should see the specific case type option for individual role$/) do
begin
  sleep 5
  actualArrayOption=[]
  expectedArrayOption=[]
  if (ENV['UserRole']=="Admin")
    expectedArrayOption=["Booking Request","Data Update Request","Lead Submission","Quote Request","Reporting Request"]
  elsif (ENV['UserRole']=="SalesRepSit")
    expectedArrayOption=["Booking Request","Data Update Request","Lead Submission","Quote Request","Reporting Request"]
  elsif (ENV['UserRole']=="SalesManagerSit")
    expectedArrayOption=["Booking Request","Data Update Request","Lead Submission","Quote Request","Reporting Request"]
  elsif (ENV['UserRole']=="OperationManagerSit")
    expectedArrayOption=["Booking Request","Data Update Request","Lead Submission","Quote Request","Reporting Request"]
  elsif (ENV['UserRole']=="OperationRepSit")
    expectedArrayOption=["Booking Request","Data Update Request","Lead Submission","Quote Request","Reporting Request"]
  elsif (ENV['UserRole']=="SalesOperationSit")
    expectedArrayOption=["Booking Request","Data Update Request","Reporting Request"]
  end

  if page.has_xpath?('//label[text()="Record Type of new record"]/parent::td[1]/following-sibling::td[1]')
    actualArrayOption=find(:xpath, '//label[text()="Record Type of new record"]/parent::td[1]/following-sibling::td[1]').all('option').collect(&:text)
    puts "actualArrayOption  --  #{actualArrayOption}  - "
  else
    writeFailure "FAIL to find - Record Type of new record - drop down"
  end

  resultArray=expectedArrayOption.sort-actualArrayOption.sort
  if resultArray.count==0
    puts "The expected options for the field - Record Type of new record - is present"
  else
    writeFailure "The following options from - Record Type of new record -  dropdown is missing"
    writeFailure resultArray
  end
  resultArray=actualArrayOption.sort-expectedArrayOption.sort
  if resultArray.count!=0
    writeFailure "The following extra options are appearing in  - Record Type of new record -  dropdown"
    writeFailure resultArray
  end
end
end

When(/^I should see lock icon next to edit button$/) do
sleep 5
if page.has_xpath?('//img[@title="Locked"]/following-sibling::input[@title="Edit"]')
  puts "The - Lock Icon - is appearing next to - Edit - button"
else
  writeFailure "FAIL -  The - Lock Icon - is NOT appearing next to - Edit - button"
end
Capybara.default_wait_time =30
end

When(/^I verify that the Target Date value under Case Milestones and Target Date value under Case Management are same$/) do
sleep 5
if page.has_xpath?('//h3[text()="Case Management"]/parent::div[1]/following-sibling::div[1]//table//td[text()="Target Date"]/following-sibling::td[1]/div')
  targetDate_CaseMnt=find(:xpath, '//h3[text()="Case Management"]/parent::div[1]/following-sibling::div[1]//table//td[text()="Target Date"]/following-sibling::td[1]/div').text
  puts "Target Date value present under Case Management is - #{targetDate_CaseMnt}"
else
  writeFailure "FAIL -  to capture target date value from Case Management section"
end
if page.has_xpath?('//h3[text()="Case Milestones"]/ancestor::div[contains(@class,"caseBlock")]//tr[2]//td[3]')
  targetDate_CaseMilestones=find(:xpath, '//h3[text()="Case Milestones"]/ancestor::div[contains(@class,"caseBlock")]//tr[2]//td[3]').text
  puts "Target Date value present under Case Milestones is - #{targetDate_CaseMnt}"
else
  writeFailure "FAIL -  to capture target date value from Case Milestones section"
end

if targetDate_CaseMnt.strip==targetDate_CaseMilestones.strip
  puts "The target date value present under case milstone and case management section are same"
else
  writeFailure "FAIL -- The target date value present under case milstone and case management section are NOT same"
end
Capybara.default_wait_time =30
end

             