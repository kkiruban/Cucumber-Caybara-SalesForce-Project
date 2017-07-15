
## Verify options under given dropdown
#Then(/^I select "([^"]*)" from "([^"]*)" dropdown$/) do |option, dropdown_name|
#  begin
#    sleep 5
#    Capybara.default_wait_time =1
#    if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]')
#      if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::td[1]/following-sibling::td[1]//select//option[text()="'"#{option}"'"]')
#        find(:xpath, '//label[text()="Health Status Reason"]/parent::td[1]/following-sibling::td[1]//select').select option
#        puts "The option - #{option} - is selected from - #{dropdown_name} - dropdown"
#      else
#        writeFailure "The option - #{option} - is not present under  - #{dropdown_name} - dropdown"
#      end
#    else
#      if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
#        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
#fail(ArgumentError.new('Fail'))
#      else
#        writeFailure "The DROPDOWN - #{dropdown_name} - is NOT present over the page"
#fail(ArgumentError.new('Fail'))
#      end
#    end
#  end
#  Capybara.default_wait_time =30
#end

# Verify options under given dropdown

Then(/^The "([^"]*)" field should show current date$/) do |field_name|
  begin
    sleep 5
    Capybara.default_wait_time =1
    if page.has_xpath?('//td[text()="Last Health Status"]/following-sibling::td[1]/div')
      appDate=""
      currentDate=""
      appDate=find(:xpath, '//td[text()="Last Health Status"]/following-sibling::td[1]/div').text
      currentDate=Time.now.strftime("#{Time.now.month}/#{Time.now.day}/%Y")
      if appDate==currentDate
        puts "The field - #{field_name} - is showing current date"
      else
        if appDate==""
          writeFailure "The field - #{field_name} - is not containing any date"
        else
          writeFailure "The field - #{field_name} - is - NOT -showing current date "
        end        
      end
      #      end
    else
      writeFailure "The field - #{field_name} - is NOT present over the page"
      #fail(ArgumentError.new('Fail'))
    end
  end  
  Capybara.default_wait_time =30
end

#Enter data in all the required field
Then(/^I enter data in all the required field over Account Edit page$/) do
  begin
    sleep 5
    Capybara.default_wait_time =3
    if page.has_xpath?('//label[text()="Account Name"]')
      temp="Smoke Test_"+Random.new.rand(111..9999).to_s
      find(:xpath, '//label[text()="Account Name"]/parent::td/following-sibling::td[1]//input').set temp
      puts "The account created is #{temp}"
    else
      writeFailure"Fail to entered data in Account Name"
    end
    
    if page.has_xpath?('//label[text()="Client Theatre"]')
      find(:xpath, '//label[text()="Client Theatre"]/parent::td/following-sibling::td[1]//select').select 'NALA'
      puts "Entered data in Client Theatre"
      #else
      #writeFailure "Fail to entered data in Client Theatre"
    end   
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
    sleep 7
  end
  Capybara.default_wait_time =30
end
# Clicking Save button
Then(/^I click Cancel button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Cancel"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Cancel"]').click
    puts "The Cancel button has been clicked"
    sleep 7
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
    sleep 7
  end
  Capybara.default_wait_time =30
end

# Verify if the account record saves successfully
Then(/^The account record should save seccessfully$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_content?("Error: Invalid Data.")
    writeFailure "Account NOT saved successfully due to Invalid Data. "
  else
    puts "Account created successfully"
  end
  Capybara.default_wait_time =30
end

# Verify the health status
Then(/^The Health Status should be "([^"]*)"$/) do |color_value|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="Health Status"]/following-sibling::td[1]/div[text()="'"#{color_value}"'"]')
    puts "The field - Health Status - is showing - #{color_value} -"
  else
    if page.has_xpath?('(//td[text()="Health Status"]/following-sibling::td[1]/div)[1]')
      temp=find(:xpath, '//td[text()="Health Status"]/following-sibling::td[1]/div').text
      writeFailure "The field - Health Status - is showing - #{temp} - color rather than - #{color_value} -"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "The field - Health Status - is - NOT - showing any option"
      #fail(ArgumentError.new('Fail'))
    end
  end
  Capybara.default_wait_time =30
end

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

#Step definition to verify field not present over the page
Then(/^I should not see the field "([^"]*)"$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td/following-sibling::td[1]//input')
      writeFailure "The - #{field_name} - is present over account detail page with -WR- permission"
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

#Step definition to verify if the button is present over the page
Then(/^I should not see the "([^"]*)" button$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//input[@class="btn" and @title="'"#{field_name}"'"]')
      writeFailure "The button - #{field_name} - is present over page"
    elsif page.has_xpath?('//*[contains(@class,"Button") and text()="'"#{field_name}"'"]')  #Used at few places, dont delete
      writeFailure "The button - #{field_name} - is present over page"
    else
      puts "The button - #{field_name} - is - NOT - present over the page"
    end
    #end
    Capybara.default_wait_time =30
  end
end

#Step definition to verify if the button is present over the page
Then(/^I click "([^"]*)" button$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//input[@class="btn" and @title="'"#{field_name}"'"]')
      find(:xpath, '//input[@class="btn" and @title="'"#{field_name}"'"]').click
      puts "The button - #{field_name} - has been clicked"
      sleep 5
    else
      writeFailure "Fail to click the button - #{field_name} "
    end
    #end
    Capybara.default_wait_time =30
  end
end

#Step definition to verify if the button is present over the page
Then(/^I should see the "([^"]*)" button$/) do |field_name|
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

#Step definition to verify field not present over the page
Then(/^I should see the field "([^"]*)"$/) do |field_name|
  begin
    Capybara.default_wait_time =2
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      puts "The - #{field_name} - is present over account detail page with -WR- permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      puts "The - #{field_name} - is present over account detail page with -R- permission"
    else
      writeFailure "The - #{field_name} - is -NOT- present over account detail page"
    end
    #end
    Capybara.default_wait_time =30
  end
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =4
  #if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input])[1]')
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]/*)[1]')
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

# Verify if the field is appearing as text field
Then(/^I should see the field "([^"]*)" as text type$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//input[@type="text" and @maxlength])[1]')
    puts "The field  - #{field_name} - is present as - TEXT - field type"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - TEXT - field type"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing as text field
Then(/^I checked the "([^"]*)" checkbox$/) do |field_name|

  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if has_no_text?('Track old and new values')
    #find(:xpath, '//label[text()="'"#{field_name}"'"]/preceding-sibling::input[1][@type="checkbox"]').click
    find(:xpath, '//input[@name="enable"]').click
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end


# Verify if the field is appearing as checkbox field
Then(/^I should see the field "([^"]*)" as checkbox type$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@type="checkbox"]')
    puts "The field  - #{field_name} - is present as - CHECKBOX - field type"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - CHECKBOX - field type"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing as checkbox field
Then(/^I should see the field "([^"]*)" as currency type$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@type="currency"]')
    puts "The field  - #{field_name} - is present as - currency - field type"
  else
    writeFailure "The field  - #{field_name} - is - NOT - present as a - currency - field type"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
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

# Verify the section over the page
Then(/^I should see the "([^"]*)" section under "([^"]*)" section$/) do |section_name1, sectionName_2|
  sleep 10
  if page.has_xpath?('//h3[text()="'"#{sectionName_2}"'"]/ancestor::div[1]/following-sibling::div//h3[text()="'"#{section_name1}"'"]')
    puts "The section - #{section_name1} - is present under - #{sectionName_2} - section"
    sleep 5
  else
    writeFailure "The section - #{section_name1} - is NOT present under - #{sectionName_2} - section"
    #fail(ArgumentError.new('Fail'))
  end
  
  
end

#Step definition for searching and selecting an account
Then(/^I select existing account record$/) do
  sleep 10
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    if (ENV['UserRole']=="opsmgrsit")
      accout_Name="Smoke Test_Account_opsManager"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="opsrepsit")
      accout_Name="Smoke Test_Account_Ops_Rep"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="Admin")
      accout_Name="Smoke Test_Account_Ba"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="salesrepsit")
      accout_Name="Smoke Test_Account_Sales_Rep"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="salesmgrsit")
      accout_Name="Smoke Test_Account_Sales_Mgr"
      # puts "#{accout_Name}"
    elsif (ENV['UserRole']=="salesopssit")
      accout_Name="Smoke Test_Account_Sales_Ops"
      #puts "#{accout_Name}"
    end
    find(:xpath, '//input[@title="Search..."]').set accout_Name
    sleep 2
    find(:xpath, '//input[@value="Search"]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"accountBlock")]')
    within(:xpath, '//div[contains(@class,"accountBlock")]')do
      if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        puts "The record - #{accout_Name} - is found and selected"
        sleep 10
      else
        writeFailure "Fail to search - #{accout_Name} - record"
      end
    end
  end
end

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is present under "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')
    within(:xpath, '(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')do
      if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
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

# Verify if the field is appearing with Read only permission
Then(/^I should see the field "([^"]*)" with - Read Only - permission$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1  
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present with - READ ONLY - permission"
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    writeFailure "The field  - #{field_name} - is not present with - READ ONLY - permission"
    #fail(ArgumentError.new('Fail'))
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      puts "The field  - #{field_name} - is present with - READ ONLY - permission"
    else
      writeFailure "The field  - #{field_name} - is not present over the page"
    end
    Capybara.default_wait_time =30
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
# Verify the column headings

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

# select option from user menu
Then(/^I selected "([^"]*)" from user menu$/) do |option|
  sleep 5
  if page.has_xpath?('//div[@id="userNav-arrow"]')
    find(:xpath, '//div[@id="userNav-arrow"]').click
    sleep 1
  else
    writeFailure "Fail to click user menu"
    #fail(ArgumentError.new('Fail'))
  end
  if page.has_xpath?('(//a[@title="'"#{option}"'"])[1]')
    find(:xpath, '(//a[@title="'"#{option}"'"])[1]').click
    sleep 1
  else
    writeFailure "Fail to select #{option} option from user menu"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify if the checkbox is enabled for the fields
Then(/^I should see that track history has been enabled for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Checked"]')
    puts "The track history has been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Not Checked"]')
    writeFailure "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify if the checkbox is enabled for the fields
Then(/^I should see that track history has not been enabled for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Not Checked"]')
    puts "The track history has not been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Checked"]')
    writeFailure "The track history has been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
end

# click a link present under App Setup
Then(/^I clicked the "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div[1]')do
    if page.has_xpath?('//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]')
      find(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]').click
      puts "The - #{link_text} - link has been clicked"
      sleep 5
    else
      writeFailure "Fail to click - #{link_text} - link"
      #fail(ArgumentError.new('Fail'))
    end
  end
end

# Verify if the checkbox is enabled for the fields
Then(/^I should see track history checkbox checked for "([^"]*)" field$/) do |fieldName|
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@checked="checked"]')
    puts "The track history has been enabled for - #{fieldName} - field"
  elsif page.has_xpath?('//label[text()="'"#{fieldName}"'"]/ancestor::td[1]/following-sibling::td[1]/input[not(@checked)]')
    writeFailure "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is enabled for the fields

Then(/^I should see track history checkbox not checked for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/ancestor::td[1]/following-sibling::td[1]/input[@checked="checked"]')
    writeFailure "The track history has been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//label[text()="'"#{fieldName}"'"]/ancestor::td[1]/following-sibling::td[1]/input[not(@checked)]')
    puts "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the table column under given section
Then(/^I should see the "([^"]*)" column in "([^"]*)" section$/) do |column_name, section_name|
  #sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]')
    if page.has_xpath?('//th[text()="'"#{column_name}"'"]/ancestor::div[1]/preceding-sibling::div[1]//h3[text()="'"#{section_name}"'"]')
      puts "The column - #{column_name} - is present over the page under #{section_name} section"
      sleep 5
    else
      writeFailure "The column - #{column_name} - is NOT present over the page under #{section_name} section"
      #fail(ArgumentError.new('fail to click Cancel button'))
    end
  else
    writeFailure "The section #{section_name} is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with Read only permission
Then(/^I should see the field "([^"]*)" with - Read Only - permission for salesops and RW for sales rep$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if (ENV['UserRole']=="salesrepsit")
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
      puts "The field  - #{field_name} - is not present with - READ ONLY - permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      writeFailure "The field  - #{field_name} - is present with - READ ONLY - permission"
    else
      writeFailure"Fail to find the permission"
    end
  end

  if (ENV['UserRole']=="salesopssit")
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
      writeFailure "The field  - #{field_name} - is not present with - READ ONLY - permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      puts "The field  - #{field_name} - is present with - READ ONLY - permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      puts "The field  - #{field_name} - is present with - READ ONLY - permission"
    else
      writeFailure"Fail to find the permission"
    end
  end
  
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I enter "([^"]*)" in "([^"]*)" field$/) do |data, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input').set data
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      writeFailure "The field - #{field_name} - is present with READ ONLY permission"
    elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      writeFailure "The field - #{field_name} - is present with READ ONLY permission"
    else
      writeFailure "Fail to find field - #{field_name} -"
    end
    
  end
  Capybara.default_wait_time =30
end


# Select options from multi dropdown
Then(/^I select "([^"]*)" from "([^"]*)" multi dropdown$/) do |option, dropdown_name|
  sleep 5
  #
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select[@multiple="multiple" and contains(@id,"unselected")]')
    if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select[contains(@id,"unselected")]')
      find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//select[contains(@id,"unselected")]').select option
      if page.has_xpath?('//label[text()="Products"]/ancestor::td[1]/following-sibling::td[1]//table[@class="multiSelectPicklistTable"]//tr[2]/td[2]//img[@title="Add"]')
        find(:xpath, '//label[text()="Products"]/ancestor::td[1]/following-sibling::td[1]//table[@class="multiSelectPicklistTable"]//tr[2]/td[2]//img[@title="Add"]').click
      else
        writeFailure"Fail to find add arrow button to add option selected in multi dropdown"
      end
      puts "The option - #{option} - is selected from - #{dropdown_name} - multi select dropdown"
    else
      writeFailure "The option - #{option} - is NOT present under - #{dropdown_name} - multi select dropdown"
    end
  else
    if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::td/following-sibling::td[1]//select')
      writeFailure "The drop down - #{dropdown_name} - is not a - multi select - dropdown"
      #fail(ArgumentError.new('Fail'))
    else
      if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]')
        writeFailure "The field - #{dropdown_name} - is not a dropdown"
      elsif page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
        #fail(ArgumentError.new('Fail'))
      else
        writeFailure "The DROPDOWN - #{dropdown_name} - is NOT present over the page"
        #fail(ArgumentError.new('Fail'))
      end
    end
  end
  sleep 20
  Capybara.default_wait_time =30
end

# Select options from dropdown
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

# Clicking Save button
Then(/^I select existing record for task processing$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"row-first")]//div[contains(@class,"NAME")]//a')
    find(:xpath, '//div[contains(@class,"row-first")]//div[contains(@class,"NAME")]//a').click
  else    
    writeFailure "Fail to find any record under - Task Processing tab"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click "([^"]*)" link over the page$/) do |link_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//a[text()="'"#{link_Name}"'"])[1]')
    find(:xpath, '(//a[text()="'"#{link_Name}"'"])[1]').click
  else
    writeFailure "The link - #{link_Name} -  is not found"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click the "([^"]*)" link$/) do |link_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//li//div[text()="'"#{link_Name}"'"]')
    find(:xpath, '//li//div[text()="'"#{link_Name}"'"]').click
  else
    writeFailure "The link - #{link_Name} -  is not found"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I should see the "([^"]*)" visible$/) do |link_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"unused")]//span[text()="'"#{link_Name}"'"]')
    puts "The button - #{link_Name} is not visible"
  else
    writeFailure "The button - #{link_Name} is visible"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I should not see the "([^"]*)" under All Scheduled Jobs table$/) do |link_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[text()="'"#{link_Name}"'"]')
    writeFailure "The button - #{link_Name} is visible"
  else
    puts "The button - #{link_Name} is not visible"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I should see the "([^"]*)" under All Scheduled Jobs table$/) do |link_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[text()="'"#{link_Name}"'"]')
    puts "The button - #{link_Name} is visible"
  else
    writeFailure "The button - #{link_Name} is visible"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I should see the following batch job should be scheduled to run every day until 12-31-2021  1:00AM CST each morning$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//th[text()="CSM_DailyOppBatchCreatePlaySchdDispatchr"]/parent::tr[1]//a[text()="Manage"]')
    find(:xpath, '//th[text()="CSM_DailyOppBatchCreatePlaySchdDispatchr"]/parent::tr[1]//a[text()="Manage"]').click
  else
    puts "Fail to find manager link for the task - CSM_DailyOppBatchCreatePlaySchdDispatchr"
  end
  step 'checkbox cheked for "Sunday"'
  step 'checkbox cheked for "Monday"'
  step 'checkbox cheked for "Tuesday"'
  step 'checkbox cheked for "Wednesday"'
  step 'checkbox cheked for "Thursday"'
  step 'checkbox cheked for "Friday"'
  step 'checkbox cheked for "Saturday"'
  sleep 3
  if page.has_xpath?('//input[@value="12/31/2021" and @name="end0"]')
    puts " The end date is appearing as --  12/31/2021 "
  else
    writeFailure "The end date is not showing date as --  12/31/2021"
  end
  sleep 3
  if page.has_xpath?('//select[@name="pst0"]//option[@selected and @value="1:00 AM"]')
    puts " The Preferred Start Time is appearing as --  1:00 AM "
  else
    writeFailure "The Preferred Start Time is NOT appearing as --  1:00 AM"
  end

  step 'I selected "Setup" from user menu'
  step 'I clicked the "Manage Users" link under "Administration Setup"'
  #step 'I clicked the "Users" link under "Manage Users"'
  step 'I click "Users" link under "Manage Users"'
  sleep 3
  if page.has_xpath?('(//a/span[text()="S"])[1]')
    find(:xpath, '(//a/span[text()="S"])[1]').click
  else
    writeFailure "Fail to find filter S over manager users - Users page"
  end
  sleep 3
  if page.has_xpath?('(//a[text()="Saravanan R, Anusha"])[1]')
    find(:xpath, '(//a[text()="Saravanan R, Anusha"])[1]').click
  else
    writeFailure "Fail to find user - Saravanan R, Anusha"
  end
  sleep 3
  if page.has_xpath?('//td[text()="Time Zone"]/following-sibling::td[text()="(GMT-05:00) Central Daylight Time (America/Chicago)"]')
    puts "The time zone is - CST"
  else
    writeFailure "The time zone is NOT - CST"
  end

  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^checkbox cheked for "([^"]*)"$/) do |day_Name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//input[@checked="checked"]/following-sibling::label[text()="'"#{day_Name}"'"]')
    puts "#{day_Name} --  is checked"
  else
    writeFailure "The checkbox is not checked for - #{day_Name}"
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I click "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]//div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
end
#end

# click a link present under App Setup
Then(/^I should see "([^"]*)" in active state$/) do |user_Name|
  sleep 5
  first_char_of_naem=user_Name.to_s.chars.first
  if page.has_xpath?('(//a/span[text()="'"#{first_char_of_naem}"'"])[1]')
    find(:xpath, '(//a/span[text()="'"#{first_char_of_naem}"'"])[1]').click
  else
    writeFailure "Fail to find filter --  #{first_char_of_naem} -- over manager users - Users page"
  end
  sleep 2
  if page.has_xpath?('//a[text()="'"#{user_Name}"'"]')
    find(:xpath, '//a[text()="'"#{user_Name}"'"]').click
    puts " The user name - #{user_Name} -- is present in the user table"
  else
    writeFailure "Fail to find filter --  #{first_char_of_naem} -- over manager users - Users page"
  end
  sleep 5
  if page.has_xpath?('//td[text()="Active"]/following-sibling::td[1]/img[@title="Checked"]')
    puts " The user name - #{user_Name} -- is active user"
  else
    writeFailure " The user name - #{user_Name} -- is NOT active user"
  end
  
  sleep 3
end
#end