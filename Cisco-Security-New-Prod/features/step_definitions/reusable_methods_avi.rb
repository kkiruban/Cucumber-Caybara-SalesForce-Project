
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
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    writeFailure "The field  - #{field_name} - is not present with - READ ONLY - permission"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{field_name} - is present with - READ ONLY - permission"
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
    #if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input])[1]')
    if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*)[1]')
      writeFailure"The - #{field_name} - is present over account detail page with -WR- permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      writeFailure"The - #{field_name} - is present over account detail page with -R- permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      writeFailure"The - #{field_name} - is present over account detail page with -R- permission"
    else
      puts "The - #{field_name} - is -NOT- present over account detail page"
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
  if page.has_xpath?('//label[text()="Comments"]/parent::td/following-sibling::td[1]//textarea')
    find(:xpath, '//label[text()="Comments"]/parent::td/following-sibling::td[1]//textarea').set text
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