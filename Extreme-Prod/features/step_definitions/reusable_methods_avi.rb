
Then(/^I should see the error message "([^"]*)"$/) do |error_msg|
  sleep 5
  if has_text?(error_msg)
    puts "The error message --  #{error_msg} -- is present over the page"
  else
    writeFailure "The error message --  #{error_msg} -- is not present over the page"
  end
end

Then(/^I select "([^"]*)" from "([^"]*)" picklist$/) do |option, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select').select option
    puts "The option -- #{option} -- is selected from -- #{field_name} -- dropdown"
  else
    writeFailure "Fail to enter data in --- #{field_name} -- dropdown "
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//a)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


Then(/^I should see "([^"]*)" column under "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="'"#{column_name}"'"]')
    puts "The coulmn name - #{column_name} - is present under section - #{section_name} -"
  else
    writeFailure "The coulmn name - #{column_name} - is - NOT -present under section - #{section_name} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end
# Verify if the field is present under account detail section
Then(/^I should see the field "([^"]*)" under Account Detail section$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h2[text()="Account Detail"]/ancestor::div[1]/following-sibling::div[1]/div[3]//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present under account detail section"
  else
    writeFailure "The field  - #{field_name} - is not present under account detail section"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in left column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[1]//*[text()="'"#{field_name}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')==true
    #if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - left - column"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with - RW - permission$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end
# Verify if the field is appearing with Read only permission
Then(/^I should see the field "([^"]*)" with - Read Only - permission$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*')
    writeFailure "The field  - #{field_name} - is present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1][not(*)]')
    puts "The field  - #{field_name} - is present with - R Only - Permission"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1][not(*)]')
    puts "The field  - #{field_name} - is present with - R Only - Permission"
  else
    writeFailure "The field  - #{field_name} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with Read only permission
Then(/^I should see the field Local Currency with Read Only permission$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="Local Currency"]/following-sibling::td[1][contains(@class,"inlineEditLock")]')
    puts "The field  - Local Currency - is present with - ReadOnly - permission"
  else
    writeFailure "The field  - Local Currency - is not present over the page with Read Only permission"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is first field in the right column under given section
Then(/^I should see the field "([^"]*)" as the first item in the right column$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]/preceding-sibling::td[3]')
    writeFailure "The field  - #{dropdown_name} - is not the first item in the right column"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{dropdown_name} - is the first item in the right column"
  end
  Capybara.default_wait_time =30
end

# Verify options not present under given dropdown
Then(/^I should not see the option "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    writeFailure "The option - #{option} - is present under - #{dropdown_name} - dropdown"
    #fail(ArgumentError.new('Fail'))
  else
    if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
      writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
      #fail(ArgumentError.new('Fail'))
    else
      puts "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
    end
    Capybara.default_wait_time =30
  end
end

# Verify the section over the page
Then(/^I should see the "([^"]*)" section under "([^"]*)" section$/) do |section_name1, sectionName_2|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{sectionName_2}"'"]/ancestor::div[@class="bRelatedList"]/following-sibling::div[1]//h3[text()="'"#{section_name1}"'"]')
    puts "The section - #{section_name1} - is present under - #{sectionName_2} - section"
    sleep 5
  else
    writeFailure "The section - #{section_name1} - is NOT present under - #{sectionName_2} - section"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the section over the page
Then(/^I should see "([^"]*)" section over "([^"]*)" detail page$/) do |section_name, pageName|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]')
    puts "The section - #{section_name} - is present over the #{pageName} detail page"
    sleep 5
  else
    writeFailure "The section - #{section_name} - is NOT present over the #{pageName} detail page"
    #fail(ArgumentError.new('Fail'))
  end
end

Then(/^I should see the "([^"]*)" as picklist type$/) do |picklist_name|

  sleep 5
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select')
    if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
      writeFailure "The field - #{picklist_name} - is multiple selection dropdown field"
    else
      puts "The field - #{picklist_name} - is single selection dropdown field"
    end
  else
    writeFailure "The section - #{picklist_name} - is NOT present as picklist type"
    #fail(ArgumentError.new('fail'))
  end

end

# Verify a section over page
Then(/^I should see the "([^"]*)" as multiselect picklist$/) do |picklist_name|
  step 'I click Edit button from top button row'
  sleep 5
  #if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select[@multiple="multiple"]')
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
    puts "The field - #{picklist_name} - is multiple selection dropdown field"
  elsif page.has_xpath?('//td[text()="'"#{picklist_name}"'"]')
    writeFailure "The MultiSelectPicklist - #{picklist_name} -is appearing with - R Permission -"
  else
    writeFailure "The picklist - #{picklist_name} - is NOT present as multiselect picklist"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
  step 'I click Save button from top button row'
end

# Verify the table column under given section
Then(/^I should see the "([^"]*)" column in "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  if page.has_xpath?('//th[text()="'"#{column_name}"'"]/ancestor::div[1]/preceding-sibling::div[1]//h3[text()="'"#{section_name}"'"]')
    puts "The column - #{column_name} - is present over the page under #{section_name} section"
    sleep 5
  else
    writeFailure "The column - #{column_name} - is NOT present over the page under #{section_name} section"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Verify a section over page
Then(/^I should see the "([^"]*)" section over the page$/) do |section_Name|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
    puts "The section - #{section_Name} - is present over the page"
    sleep 5
  else
    writeFailure "The section - #{section_Name} - is NOT present over the page"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Clicking Save button
Then(/^I click Cancel button from top button row$/) do
  sleep 5
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Cancel"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Cancel"]').click
    next
    sleep 5
  else
    writeFailure "Fail to click Cancel buttton"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

#Step definition to click a button
Then(/^I should see the field "([^"]*)" as numeric type$/) do |field_name|
  sleep 5
  step 'I click Edit button from top button row'
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input')
    sleep 5
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input').set "AAAAAA"
    step 'I click Save button from top button row'
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/div/strong[text()="Error:"]')
      puts "The #{field_name} is numeric type"
      step 'I click Cancel button from top button row'
    else
      writeFailure "The #{field_name} is NOT a numeric field"
    end
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is appearing with - R Permission -"
    #next
  else
    writeFailure "The field - #{field_name} - is not present over the page"
  end
  step 'I click Save button from top button row'
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field MultiSelectPicklist options$/) do |select_field|
  sleep 5
  begin
    step 'I click Edit button from top button row'
    arg=getDetails "CommonData"
    resultArray=[]
    expectedArrayOption=[]
    actualArrayOption=[]
    #  if page.has_xpath?('//td[text()="'"#{select_field}"'"]')
    #     writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
    #     next
    #  end
    #  if page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
    #     writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
    #     next
    #  end
    expectedArrayOption=arg[select_field]
    if page.has_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
      actualArrayOption=find(:xpath, '//select[contains(@title,"'"#{select_field +" - Available"}"'")]').all('option').collect(&:text)
    elsif  page.has_xpath?('//td[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
      step 'I click Save button from top button row'
      next
    elsif page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//label[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
      step 'I click Save button from top button row'
      next
    end
    #puts "Actual options are : #{actualArrayOption}"
    #puts "Expected Options are : #{expectedArrayOption}"

    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the dropdown - #{select_field} - is present"
    else
      writeFailure "The following options are not present in the dropdown"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra option are appearing in the dropdown"
      writeFailure resultArray
    end
    #  end
    step 'I click Save button from top button row'
    sleep 5
  rescue Exception => ex
    step 'I click Save button from top button row'
		writeFailure "Error while verifying - #{select_field} - MultiSelectPicklist option"
		writeFailure ex.message
  end
end

#Step definition to click a button
Then(/^I click "([^"]*)" button$/) do |buttonName|
  sleep 5
  if page.has_xpath?('//input[@title="'"#{buttonName}"'"]')
    find(:xpath, '//input[@title="'"#{buttonName}"'"]').click
    puts "The button - #{buttonName} - has been clicked"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The button - #{buttonName} - NOT found"
  end
end

#Step definition to verify date type field
Then(/^The field "([^"]*)" should be of date type$/) do |field_name|
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//*[contains(@class,"dateInput")]')
    puts "The - #{field_name} - field is -  Date Type -"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The field - #{field_name} - is - Not Date Type  -"
  end
  #end
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the right column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[3][text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present in the - right - column"
  elsif page.has_xpath?('//tr/td[3]/label[text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present in the - right - column"
  else
    writeFailure"The - #{field_name} - field is not present in the - right - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the left column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  elsif page.has_xpath?('//tr/td[1]/label[text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - left - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is present under "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section}"'"]')
    if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table//*[text()="'"#{field_name}"'"])[1]')
      puts "The field -#{field_name}- is present under #{section} section"
    else
      writeFailure"The field  - #{field_name} - is NOT present under #{section} section"
    end
  else
    writeFailure"The section - #{section} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click Save button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    puts "The Save button has been clicked"
    
  end
  Capybara.default_wait_time =30
end

# Clicking edit button
Then(/^I click Edit button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  #step 'I click Save button from top button row'
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Edit"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Edit"]').click
    puts "The Edit button has been clicked"    
  end
  Capybara.default_wait_time =30
end

#Step definition for searching and selecting an account
Then(/^I select "(.*?)" account record$/) do |accout_Name|
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    find(:xpath, '//input[@title="Search..."]').set accout_Name
    sleep 2
    find(:xpath, '//input[@value="Search"]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"accountBlock")]')
    within(:xpath, '//div[contains(@class,"accountBlock")]')do
      if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        puts "The record #{accout_Name} is accout is found and selected"
      else
        writeFailure "Fail to search given account record"
      end
    end
  end
end

#click on tab
When(/^I navigate to "([^"]*)" tab in the application$/) do |tab|
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

#click on tab
When(/^I navigate to "(.*?)" tab in salesforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
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

# Verify if the account record saves successfully
Then(/^The "([^"]*)" record should save seccessfully$/) do |record_type|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_content?("Error: Invalid Data.")
    writeFailure "-- #{record_type} record -- NOT saved successfully due to Invalid Data. "
  else
    puts "-- #{record_type} record -- created successfully"
  end
  
  Capybara.default_wait_time =30
end

#Step definition to verify field not present over the page
Then(/^I should not see the field "([^"]*)" over the page$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//div[contains(@class,"EditBlock")]//*[text()="'"#{field_name}"'"]')==false
      puts "The - #{field_name} - is -NOT- present over account detail page"
    elsif page.has_xpath?('//div[contains(@class,"EditBlock")]//*[text()="'"#{field_name}"'"]')
      writeFailure"The - #{field_name} - is present over the page"
    else
      writeFailure "Method condition Fail"
    end
    #end
    Capybara.default_wait_time =30
  end
end

# Verify if the field is present as NOT required field
Then(/^I should see the field "([^"]*)" over the page as not required field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/*[not(div)]')
    puts "The field - #{field_name} - is present over the page as not required field"
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//div[@class="requiredInput"]')
    writeFailure "The field - #{field_name} - is present over the page as required field"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present with - R ONLY - permission"
  else
    writeFailure "The field - #{field_name} - is - NOT -present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is present as NOT required field
Then(/^I check the "([^"]*)" checkbox$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input').set(true)
    puts "The field  - #{field_name} - is checked"
  else
    writeFailure "FAIL to check the checkbox - #{field_name} -"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter "([^"]*)" in "([^"]*)" textarea field$/) do |text, fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//textarea').set text
    puts "The data - #{text} - has been entered in - #{fieldName} - field"
    sleep 5
  else
    writeFailure "Fail to enter data in field - #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

Then(/^I should see "([^"]*)" selected under "([^"]*)" drop down$/) do |text, fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]/div[text()="'"#{text}"'"]')
    puts "The option  - #{text} - is appearing under  - #{fieldName} - drop down"
    sleep 5
  else
    writeFailure "Fail The option  - #{text} - is NOT appearing under  - #{fieldName} - drop down"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing as checkbox field
Then(/^I should see the field "([^"]*)" as checkbox type$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 10
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@type="checkbox"]')
    puts "The field  - #{field_name} - is present as - CHECKBOX - field type"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field  - #{field_name} - is present with - R - permission"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - CHECKBOX - field type"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission except salesops$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if (ENV['UserRole'] == "SalesOperationSit")
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      puts "The field - #{field_name} - is present with - R Only - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      writeFailure "The field - #{field_name} - is present with - RW - Permission"
    end
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      puts "The field - #{field_name} - is present with - RW - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    else
      writeFailure "The field is not present over the page"
    end
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission only for ops role$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1

  if (ENV['UserRole'] == "OperationManagerSit") or (ENV['UserRole'] == "OperationRepSit")    
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      puts "The field - #{field_name} - is present with - RW - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    end
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      puts "The field - #{field_name} - is present with - RW - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    else
      writeFailure "The field is not present over the page"
    end
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" as required field only for ops role$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if (ENV['UserRole'] == "OperationManagerSit") or (ENV['UserRole'] == "OperationRepSit")
    if page.has_xpath?('//td[contains(@class,"requiredInput")]/label[text()="'"#{field_name}"'"]')
      puts "The field - #{field_name} - is present as required field"
    else
      writeFailure "The field - #{field_name} - is NOT present as required field"
    end
  else
    if page.has_xpath?('//td[contains(@class,"requiredInput")]/label[text()="'"#{field_name}"'"]')
      writeFailure "The field - #{field_name} - is present as required field"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      puts "The field - #{field_name} - is present with - R Only - Permission"
    else
      writeFailure "The field is not present over the page"
    end
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field picklist options$/) do |select_field|
  begin
    sleep 5
    arg=getDetails "CommonData"
    resultArray=[]
    actualArrayOption=[]
    expectedArrayOption=[]

    if page.has_select?(select_field)
      actualArrayOption=find_field(select_field).all('option').collect(&:text)
    elsif page.has_xpath?('//td[text()="'"#{select_field}"'"]')
      writeFailure "The dropdown - #{select_field} - is appearing with - R Permission -"
      next
    else
      writeFailure "FAIL to collect option from The dropdown - #{select_field} -"
      next
    end
    expectedArrayOption=arg[select_field]
    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the field - #{select_field} - is present"
    else
      writeFailure "The following options from - #{select_field} -  dropdown is missing"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra options are appearing in  - #{select_field} -  dropdown"
      writeFailure resultArray
    end
    #end
    sleep 5
  rescue Exception => ex
    writeFailure "Error while verifying - #{select_field} - picklist option"
		writeFailure ex.message
  end
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see Account Currency field picklist options only for ops role$/) do
  begin
    if (ENV['UserRole'] == "OperationManagerSit") or (ENV['UserRole'] == "OperationRepSit")
      sleep 5
      resultArray=[]
      actualArrayOption=[]
      expectedArrayOption=[]

      if page.has_select?('Account Currency')
        actualArrayOption=find_field('Account Currency').all('option').collect(&:text)
      elsif page.has_xpath?('//td[text()="Account Currency"]')
        writeFailure "The dropdown - Account Currency - is appearing with - R Permission -"
        next
      else
        writeFailure "FAIL to collect option from The dropdown - Account Currency -"
        next
      end
      expectedArrayOption=["AED","ARS","AUD","BRL","CAD","CHF","CLP","CNY","COP","CZK","DKK","EUR","GBP","HKD","IDR","ILS","INR","JPY","KRW","LKR","MXN","MYR","NOK","NZD","PLN","RUB","SEK","SGD","THB","TRY","TWD","USD","ZAR"]
      resultArray=expectedArrayOption.sort-actualArrayOption.sort
      if resultArray.count==0
        puts "The expected options for the field - Account Currency - is present"
      else
        writeFailure "The following options from - Account Currency -  dropdown is missing"
        writeFailure resultArray
      end
      resultArray=actualArrayOption.sort-expectedArrayOption.sort
      if resultArray.count!=0
        writeFailure "The following extra options are appearing in  - Account Currency -  dropdown"
        writeFailure resultArray
      end
    end
    
    sleep 5
  rescue Exception => ex
    writeFailure "Error while verifying - Account Currency - picklist option"
		writeFailure ex.message
  end
end

# Verify if the field is appearing as text field
Then(/^I should see the field "([^"]*)" as text type$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//input[@type="text"])[1]')
    puts "The field  - #{field_name} - is present as - TEXT - field type"
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field  - #{field_name} - is present with - R - permission"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - TEXT - field type"

  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


#Step definition to verify date type field
Then(/^I should see the field "([^"]*)" as type picklist$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    puts "The - #{field_name} - field is -  Date Type -"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The field - #{field_name} - is - Not Date Type  -"
  end
  #end
  # step 'I click Save button from top button row'
end

#Step definition to verify field not present over the page
Then(/^I should see the field "([^"]*)" over the page$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input])[1]')
      puts "The - #{field_name} - is present over account detail page with -WR- permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      puts "The - #{field_name} - is present over account detail page with -R- permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      puts "The - #{field_name} - is present over account detail page with -R- permission"
    else
      writeFailure "The - #{field_name} - is -NOT- present over account detail page"
    end
    #end
    Capybara.default_wait_time =30
  end
end

# Select options from drop down
Then(/^I select "([^"]*)" from "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select').select option
    puts "The option - #{option} - is selected from - #{dropdown_name} - dropdown"
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

When(/^I click link "([^"]*)"$/) do |link_name|
  sleep 8
  if page.has_xpath?('(//a[text()="'"#{link_name}"'"])[1]')
    find(:xpath, '(//a[text()="'"#{link_name}"'"])[1]').click
    puts"The link - #{link_name} - has been clicked"
  else
    writeFailure "FAIL to click the link - #{link_name}"
  end
end

# Step definition to create new opportunity
Then(/^I enter "([^"]*)" in "([^"]*)" lookup field$/) do |record_name, field_name|
	begin
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
      main = page.driver.browser.window_handles.first
      find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//img[@class="lookupIcon"]').click
      10
      popup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(popup)
      within_frame('searchFrame')do
        find(:xpath, '//input[@name="lksrch"]').set record_name
        click_button('Go!')
        sleep 5
      end
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        table=all("tbody")[0]
        table.all("tr")[1].all("th")[0].find('a').click
      end
    else
      writeFailure "FAIL to click the - #{field_name} - lookup field"
    end
  end
end


Then(/^I enter date in "([^"]*)" field$/) do |fieldName|
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


#Step definition to verify if the button is present over the page
Then(/^I clicked the button "([^"]*)" over the page$/) do |field_name|
  begin
    sleep 12
    Capybara.default_wait_time =2
    if page.has_xpath?('(//input[@title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]')
      find(:xpath, '(//input[@title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]').click
      puts "The button - #{field_name} - is clicked"
    elsif page.has_xpath?('(//input[@class="btn" and @title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]')
      find(:xpath, '(//input[@class="btn" and @title="'"#{field_name}"'" or @value="'"#{field_name}"'"])[1]').click
      puts "The button - #{field_name} - is clicked"
    else
      writeFailure "The button - #{field_name} - is - NOT - present over the page"
    end
    #end
    Capybara.default_wait_time =30
  end
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

# Verify ptions under drop down
Then(/^I should see the field "([^"]*)" as type lookup$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =1

  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
    puts "The field is present as lookup field"
  else
    writeFailure "The field - #{dropdown_name} - is NOT a lookup field"
  end
  Capybara.default_wait_time =30
end

Then(/^I should see the field "([^"]*)" under "([^"]*)" field$/) do |field1, field2|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//*[text()="'"#{field2}"'"]/ancestor::tr[1]/following-sibling::tr[1]//*[text()="'"#{field1}"'"]')
    if page.has_xpath?('//tr/td[1]//*[text()="'"#{field2}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field2}"'"]')==true
      if page.has_xpath?('//tr/td[1]//*[text()="'"#{field1}"'"]')==true or page.has_xpath?('//tr/td[1][text()="'"#{field1}"'"]')==true
        puts "The field -#{field1} - is present under - #{field2}"
        puts "Avishek"
      end
    end
    if page.has_xpath?('//tr/td[2]//*[text()="'"#{field2}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{field2}"'"]')==true
      if page.has_xpath?('//tr/td[2]//*[text()="'"#{field1}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{field1}"'"]')==true
        puts "The field -#{field1} - is present under - #{field2}"
      end
    end
  else
    writeFailure "The field -#{field1} - is NOT present under - #{field2}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in right column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[2]//*[text()="'"#{field_name}"'"]')==true or page.has_xpath?('//tr/td[2][text()="'"#{field_name}"'"]')==true
    #if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - right - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - right - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)" over the page$/) do |content|
  sleep 5
  if page.has_content? content
    puts "#{content} content is present"
  else
    fail(ArgumentError.new(content + 'content is not present'))
  end
end


#-------------------Step definition to verify if the field is present under a particular page section--------------------------

Then(/^I should see the field "([^"]*)" is present under Account Detail section$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h2[text()="Account Detail"]')
    if page.has_xpath?('(//h2[text()="Account Detail"]/ancestor::div[contains(@class,"DetailBlock")]//*[text()="'"#{field_name}"'"])[1]')
      puts "The field -#{field_name}- is present under - Account Detail - section"
    else
      writeFailure"The field  - #{field_name} - is NOT present under - Account Detail - section"
    end
  else
    writeFailure"The section - Account Detail - is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Code added by Jayanta for RLI as ther is no container for RLI
When(/^I click on the rli "([^"]*)" button from "([^"]*)" page of RLI$/) do |new_renewal_line_item, opportunity|
  begin
    sleep 5
    if page.has_button? new_renewal_line_item
      puts "Successfully see the #{new_renewal_line_item} button"
      find(:xpath,"//input[@title='#{new_renewal_line_item}']").click
      sleep 5
      puts "Successfully click the #{new_renewal_line_item} button"
    else
      putstr "Failed to see the #{new_renewal_line_item} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{new_renewal_line_item} button from #{opportunity} page"
  end
end

And(/^I select the "([^"]*)" product field$/) do |renewal_relationship|
  begin
    sleep 6
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} page"

      if page.has_css?("#renewalRelationshipGrid")
        sleep 4
        all("input[name='btSelectItem']").each do |renewal_products|
          if renewal_products.checked?
            puts "#{renewal_relationship} product field is already checked"
          else
            first("input[name='btSelectItem']").click
            sleep 4
            unless page.has_xpath?("//div/a[4][contains(@class, 'disabled')]")
              puts "Rebuild Opportunity button is enabled"
              break
            else
              puts "Rebuild Opportunity button is disabled"
              sleep 3
              first("input[name='btSelectItem']").click
            end
          end
        end
      else
        puts "No to renewal relationship grid"
      end
    else
      putstr "Failed to see the #{renewal_relationship} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{renewal_relationship} product"
  end
end

And(/^I click on renewal relationship "([^"]*)" button$/) do |rebuild|
  begin
    sleep 4
    unless page.has_xpath?("//div/a[4][contains(@class, 'disabled')]")

      puts "#{rebuild} button is enabled"
      sleep 4
      puts "Successfully see the Invalid Renewal Relationship"
      click_on rebuild
      sleep 5
      puts "Successfully click the #{rebuild} button"
    else
      puts "#{rebuild} button is disabled"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the #{rebuild} button"
  end
end

And(/^I verify the Opportunity Product Line is added to "([^"]*)" related list$/) do |products|
  begin
    sleep 4

    within(".listRelatedObject.opportunityLineItemBlock") do

      if page.has_content?(products)
        puts "Successfully see the #{products} related section"
        if page.has_css?(".list")
          puts "Successfully see the #{products} product records"
          within(".list") do
            if first("tbody").all(".dataRow").count > 0
              puts "Successfully added the Opportunity Product Line to #{products} related list"
              break
            else
              putstr "Failed to added the Opportunity Product Line to #{products} related list"
            end
          end
        else
          putstr "Failed to see the #{products} product records"
        end
      else
        putstr "Failed to see the #{products} related section"
      end
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{products} related section"
  end
end

And(/^I click on the Opportunity Product Line in "([^"]*)" related list$/) do |products|
  begin
    sleep 4

    within(".listRelatedObject.opportunityLineItemBlock") do

      if page.has_content?(products)
        puts "Successfully see the #{products} related section"
        if page.has_css?(".list")
          puts "Successfully see the #{products} product records"
          within(".list") do
            if first("tbody").all(".dataRow").count > 0
              puts "Successfully added the Opportunity Product Line to #{products} related list"
              tr = first("tbody").all(".dataRow")
              sleep 3
              tr.each do |row|
                row.first("th").first("a").click
                puts "Successfully clicked the #{products} product record"
                sleep 5
                break
              end
            else
              putstr "Failed to added the Opportunity Product Line to #{products} related list"
            end
          end
        else
          putstr "Failed to see the #{products} product records"
        end
      else
        putstr "Failed to see the #{products} related section"
      end
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{products} related section"
  end
end

When(/^I click on the "([^"]*)" button from "([^"]*)" page of RLI$/) do |edit, quote_line_items|
  begin
    sleep 3
    within("#topButtonRow") do
      puts "Successfully see the #{edit} button"
      click_on edit
      sleep 4
      puts "Successfully clicked the #{edit} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{edit} button from #{quote_line_items} page"
  end
end

And(/^I fill Renewable Line Item ID as "([^"]*)"$/) do |field_name|

  begin
    sleep 4
    if (ENV['UserRole'] == "OperationManagerSit") or (ENV['UserRole'] == "OperationRepSit")

      within(".pbSubsection") do
        if page.has_content?(field_name)
          puts "Successfully see the Field name as: #{field_name}"
          fill_in("Renewable Line Item ID", :with=> field_name)
        else
            putstr "Failed to see the #{field_name}"
        end
      end
    else
      writeFailure "The field is not present over the page"
    end
rescue Exception => ex
    putstr "Error occurred while verifying the #{field_name}"
end
end

And(/^I click on the "([^"]*)" link from "([^"]*)" page$/) do |opportunity_name, quote_details|
  begin
    sleep 4

    if page.has_content?(quote_details)
      puts "Successfully see the #{quote_details} page"

      within all(".pbSubsection")[0] do

        if page.has_content?(opportunity_name)
          puts "Successfully see the #{opportunity_name} record"

          tr = first("tbody").all("tr")
          sleep 3
          tr.each do |row|

            if row.all("td")[2].text == opportunity_name
              puts "Successfully see the #{opportunity_name} record"

              row.all("td")[3].first("div").first("a").click

              puts "Successfully clicked the #{opportunity_name} link"
              sleep 5
              break
            else
              putstr "Failed to see the #{opportunity_name} record"
            end
          end
        else
          putstr "Failed to see the #{opportunity_name} record"
        end
      end
    else
      putstr "Failed to see the #{quote_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity_name} link from #{quote_details} page"
  end
end

Then(/^I click on the Edit button from Renewable Line Item section of product$/) do
begin
   sleep 5

   within all(".listRelatedObject.customnotabBlock")[0] do

     if page.has_content?("Renewable Line Item")
       puts "Successfully see the Renewable Line Item related section"

       if page.has_css?(".list")
         puts "Successfully see the Renewable Line Item product records"

         within(".list") do
           if first("tbody").all(".dataRow").count > 0
             puts "Successfully See the Renewable Line Item added"
             tr = first("tbody").all(".dataRow")
             sleep 5
             tr.each do |row|
               row.all("td")[0].all("a")[0].click
               puts "Successfully clicked Edit button of RLI Link"
               sleep 5
               break
             end
           else
             putstr "Failed to see the added  Opportunity Product Line to RLI related list"
           end
         end
       else
         putstr "Failed to see the Opporunity product records"
       end
     else
       putstr "Failed to see the RLI related section"
     end
   end
 rescue Exception => ex
   putstr "Error occurred while verifying the RLI related section"
 end
end

When(/^I enter data to all mandatory fields under Add Partner Opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 5
    $opp_name1 = "Partner-opportinity-"+ Random.new.rand(1..20000).to_s
    fill_in("Partner Opportunity", :with=> $opp_name1)
    puts "opportunity name is: #{$opp_name1}"
    sleep 5
  end
end


Then(/^I click on "([^"]*)" button in partner oppty$/) do |button_name|
  
  begin
    sleep 5

    if page.has_xpath?('//input[@value="'"#{button_name}"'"]')
    find(:xpath, '//input[@value="'"#{button_name}"'"]').click
    next
    sleep 5
    else
    writeFailure "Fail to click #{button_name} buttton"
    end

  rescue Exception => ex
  putstr "Error occurred while clicking the #{button_name} from partner oppty page"
  end
end



Then(/^I save the relationship id value to the variable$/) do
   
  within all('.pbSubsection')[0] do
    $relationshipid = page.find_field("Relationship ID").value
    puts "The Relatioship ID value store in varibale is #{$relationshipid}"
  end
end



Then(/^I click on the Partner Opportunity link from Partner Opportunities section$/) do
begin
   sleep 4

   within all(".listRelatedObject.customnotabBlock")[1] do

    if page.has_content?("Partner Opportunities")
      puts "Successfully see the Partner Opportunities related section"

       if page.has_css?(".list")
         puts "Successfully see the Partner Opportunities records"

         within(".list") do
           if first("tbody").all(".dataRow").count > 0
             puts "Successfully See the Partner Opportunities added"

             tr = first("tbody").all(".dataRow")
             sleep 3
             tr.each do |row|
               row.first("th").first("a").click
               puts "Successfully clicked Partner Opportunities Link"
               sleep 5
               break
             end
           else
             putstr "Failed to see the added  Partner Opportunities to Partner Opportunities related list"
           end
         end
       else
         putstr "Failed to see the Partner Opportunities records"
       end
     else
       putstr "Failed to see the Partner Opportunities related section"
     end
   end
 rescue Exception => ex
   putstr "Error occurred while verifying the Partner Opportunities related section"
 end
end

And(/^I fill the Renewal Relationship lookup$/) do
  begin
    sleep 3
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Renewal Relationship Lookup (New Window)']").click
    sleep 10
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> $relationshipid)
    sleep 20
    find_button('Go!').click
    sleep 15
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    
    within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
    end
    sleep 2
   page.driver.browser.switch_to.window(main)
   sleep 2
end
end


Then(/^I click on the Opportunity Name link from Partner Opportunity Detail page$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[contains(text(),"Opportunity")]/following-sibling::td[1]//a')
    find(:xpath, '//td[contains(text(),"Opportunity")]/following-sibling::td[1]//a').click
    puts "The Opportunity Name link has been clicked from partner oppty"
  else
    writeFailure "fail to click renewal opportunity link"
  end
end


When(/^I click on the Edit button from Quotes Related list$/) do
begin
   sleep 5

   within all(".listRelatedObject.quoteBlock")[0] do

     if page.has_content?("Quotes")
       puts "Successfully see the Quotes related section"

       if page.has_css?(".list")
         puts "Successfully see the Quotes product records"

         within(".list") do
           if first("tbody").all(".dataRow").count > 0
             puts "Successfully See the Quote record added"
             tr = first("tbody").all(".dataRow")
             sleep 5
             tr.each do |row|
               row.all("td")[0].all("a")[0].click
               puts "Successfully clicked Edit button of Quote Related Link"
               sleep 5
               break
             end
           else
             putstr "Failed to see the added  Quote Record"
           end
         end
       else
         putstr "Failed to see the Quote records"
       end
     else
       putstr "Failed to see the Quote section"
     end
   end
 rescue Exception => ex
   putstr "Error occurred while verifying the Quote related section"
 end
end

# Enter date in date field
And(/^I should see Partneroppty name as opptyname$/) do
 sleep 5
 Capybara.default_wait_time =1
 if page.has_xpath?('//td[text()="Partner Opportunity"]/following-sibling::td[1]//*[text()=$opp_name1]')
   puts "The field- Partner Opportunity is present under field #{opp_name1}"
   sleep 5
 else
   writeFailure "Fail - The date - Opportunity is NOT present under field #{$opp_name1}"
   #fail(ArgumentError.new('Fail'))
 end
 Capybara.default_wait_time =30
end


Then(/^I verify Client Region picklist values as Education-K12$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Education-K12"
    puts "Entered -- Education-K12 -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Education-K12"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Named Hospitality$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Named Hospitality"
    puts "Entered -- Named Hospitality -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Named Hotels and Lodging","Named Sports and Entertainment"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Named RetailTransportation and Logistics$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Named Retail/Transportation and Logistics"
    puts "Entered -- Named Retail/Transportation and Logistics -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Named Retail/Transportation and Logistics"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Strategic Accounts and Segments$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Strategic Accounts and Segments"
    puts "Entered -- Strategic Accounts and Segments -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Canada","Intel","Schneider Electric","Walmart"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as US Territories$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "US Territories"
    puts "Entered -- US Territories -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Mid Atlantic","North Central","Northeast","South Central","Southeast","West"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as LATAM$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
  
    if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "LATAM"
    puts "Entered -- LATAM -- in -- Client Region -- field"

    actualvalues =find_field("Client Subregion").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Brazil/SC","Mexico/VECCA"]
    puts "expected values = #{expectedvalues}"

      if actualvalues == expectedvalues
      puts "expected values are visible in Client Subregion picklist #{expectedvalues}"
      else
      writeFailure "expected values are not visible in Client Subregion picklist #{expectedvalues}"
      end
    else
    writeFailure "Fail to enter data in -- Client Region -- field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues1$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Japan"
    puts "Entered -- Japan -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues2$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "ANZ"
    puts "Entered -- ANZ -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues3$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "ASEAN"
    puts "Entered -- ASEAN -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues4$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "GCR"
    puts "Entered -- GCR -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues5$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "India/SA"
    puts "Entered -- India/SA -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end

And(/^I verify Client Region picklist values as Multivalues6$/) do
sleep 5
  if page.has_field?("Client Region")
    puts "Client Region field is visible"
  
      if page.has_xpath?('//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="Client Region"]/parent::td[1]/following-sibling::td[1]//select').select "Korea"
    puts "Entered -- Korea -- in -- Client Region -- field"
    end

    if page.has_xpath?('//label[text()="Client Subregion"]/parent::td[1]/following-sibling::td[1]//select')
      puts "The Client Subregion is a readonly field"
    else
    puts "Fail to enter data in -- Client Subregion -- field as it is a Readonly field "
    end
  else
    writeFailure "Client Region field is not visible"
  end
end