Then(/^I select "([^"]*)" from "([^"]*)" picklist MC$/) do |option, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//select').select option
    puts "The option -- #{option} -- is selected from -- #{field_name} -- dropdown"
  else
    writeFailure "Fail to enter data in --- #{field_name} -- dropdown "
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click Save button from top button row MC$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    puts "The Save button has been clicked"
  else
    writeFailure "Fail to click Save button"
  end
  Capybara.default_wait_time =30
end

# Verify if the account record saves successfully
Then(/^The "([^"]*)" record should save seccessfully MC$/) do |record_type|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_content?("Error: Invalid Data.")
    writeFailure "-- #{record_type} record -- NOT saved successfully due to Invalid Data. "
  else
    puts "-- #{record_type} record -- created successfully"
  end
  Capybara.default_wait_time =30
end

Given(/^I should navigate to "([^"]*)" tab in saleforce application MC$/) do |tab|
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
  sleep 5
end

#Step definition to verify field not present over the page
Then(/^I should see the field "([^"]*)" over the page MC$/) do |field_name|
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
Then(/^I select "([^"]*)" from "([^"]*)" dropdown MC$/) do |option, dropdown_name|
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


#Step definition to verify if the button is present over the page
Then(/^I clicked the button "([^"]*)" over the page MC$/) do |field_name|
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


When(/^I should create new account record "([^"]*)" as test data MC$/) do |account_name|
  sleep 3
  flag=0
  step 'I login as BA'
  find(:xpath, '//input[@title="Search..."]').set account_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 5
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  sleep 10

  if page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{account_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    
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

#When(/^I should create new product record to test multi currency$/) do
When(/^I should create new product record "([^"]*)" to test multi currency$/) do |product_name|
  step 'I login as BA'
  $prod_name = product_name
  find(:xpath, '//input[@title="Search..."]').set product_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"productBlock")]//a[text()="'"#{product_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  elsif page.has_xpath?('//div[contains(@class,"productBlock")]//a[text()="'"#{product_name}"'"]')==false
    flag=1
  end

  if flag==1

    step 'Navigate to "Products" tab'
    step 'I click "New" button'

    #$prod_name = "Smoke_test_multiC_"+ Random.new.rand(1..20000).to_s
    $prod_name = product_name

    if page.has_xpath?('//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input')
      find(:xpath, '//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input').set $prod_name
      puts "Entered -- #{$prod_name}  -- in product name field"
    else
      writeFailure "Fail to enter data in - product Name - field "
    end

    step 'I check the checkbox "Active" MC'
    step 'I click on "Save" button from top row'
    step 'The "Product" record should save seccessfully'
    step 'I click "Add" button'
    if page.has_xpath?('//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input')
      find(:xpath, '//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input').set "1"
      puts "Data has been entered into --  USD - U.S. Dollar  --  field"
    else
      writeFailure "Fail to enter data in -- USD - U.S. Dollar -- field "
    end
    if page.has_xpath?('(//input[@title="Save"])[1]')
      find(:xpath, '(//input[@title="Save"])[1]').click
      puts "- Save -  button has been clicked"
    else
      writeFailure "Fail to click - Save - button "
    end
    
  end
  step 'I selected "Logout" from user menu'
end

#When(/^I should create second new product record to test multi currency$/) do
When(/^I should create second new product record "([^"]*)" to test multi currency$/) do |product_name|
  step 'I login as BA'
  $prod_name1 = product_name
  find(:xpath, '//input[@title="Search..."]').set product_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"productBlock")]//a[text()="'"#{product_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  elsif page.has_xpath?('//div[contains(@class,"productBlock")]//a[text()="'"#{product_name}"'"]')==false
    flag=1
  end

  if flag==1

    step 'Navigate to "Products" tab'
    step 'I click "New" button'

    #$prod_name1 = "Smoke_test_multiC_"+ Random.new.rand(1..20000).to_s
    $prod_name1 = product_name
    if page.has_xpath?('//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input')
      find(:xpath, '//label[text()="Product Name"]/parent::td[1]/following-sibling::td[1]/div[@class="requiredInput"]/input').set $prod_name1
      puts "Entered -- #{$prod_name}  -- in product name field"
    else
      writeFailure "Fail to enter data in - product Name - field "
    end

    step 'I check the checkbox "Active" MC'
    step 'I click on "Save" button from top row'
    step 'The "Product" record should save seccessfully'
    step 'I click "Add" button'

    
    if page.has_xpath?('//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input')
      find(:xpath, '//td[text()="USD - U.S. Dollar"]/following-sibling::td[1]/input').set "1"
      puts "Data has been entered into --  USD - U.S. Dollar  --  field"
    else
      writeFailure "Fail to enter data in -- USD - U.S. Dollar -- field "
    end
    if page.has_xpath?('(//input[@title="Save"])[1]')
      find(:xpath, '(//input[@title="Save"])[1]').click
      puts "- Save -  button has been clicked"
    else
      writeFailure "Fail to click - Save - button "
    end  
  end
  step 'I selected "Logout" from user menu'
end

# Check the check box
Then(/^I check the checkbox "([^"]*)" MC$/) do |fieldName|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="'"#{fieldName}"'"]/parent::td/following-sibling::td[1]//input').set(true)
    puts "The checkbox - #{fieldName} - has been checked"
    sleep 5
  else
    writeFailure "Fail to check the checkbox - #{fieldName} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

When(/^I enter data in all the required fields over Renewable Line Item page MC$/) do
  if page.has_xpath?('//label[text()="Quantity"]/ancestor::th[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Quantity"]/ancestor::th[1]/following-sibling::td[1]//input').set "1"
    puts "Entered -- 1 -- in Quantity field"
  else
    writeFailure "Fail to enter data in - Quantity - field "
  end
  if page.has_xpath?('//label[text()="Existing End Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="Existing End Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field - Existing End Date"
    sleep 5
  else
    writeFailure "Fail to find field - Existing End Date -"
  end
  if page.has_xpath?('//label[text()="Existing Start Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="Existing Start Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field - Existing Start Date"
    sleep 5
  else
    writeFailure "Fail to find field - Existing Start Date -"
  end
  if page.has_xpath?('//label[text()="New End Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="New End Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field - New End Date"
    sleep 5
  else
    writeFailure "Fail to find field - New End Date -"
  end
  if page.has_xpath?('//label[text()="New Start Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a')
    find(:xpath, '//label[text()="New Start Date"]/parent::*/following-sibling::td[1]//span[@class="dateFormat"]/a').click
    puts "The date has been entered in the field - New Start Date"
    sleep 5
  else
    writeFailure "Fail to find field - New Start Date -"
  end
  if page.has_xpath?('//label[text()="Existing Product"]/ancestor::th[1]/following-sibling::td[1]//span/input')
    find(:xpath, '//label[text()="Existing Product"]/ancestor::th[1]/following-sibling::td[1]//span/input').set $prod_name
    puts "Entered -- #{$prod_name} -- in Existing Product field"
  else
    writeFailure "Fail to enter data in - Existing Product - field "
  end
  step 'I select "Renewal" from "Batch Type" picklist'
  if page.has_xpath?('//label[text()="Owner"]/ancestor::th[1]/following-sibling::td[1]//span/input')
    find(:xpath, '//label[text()="Owner"]/ancestor::th[1]/following-sibling::td[1]//span/input').set "DSIntegration Admin"
    puts "Entered -- DSIntegration Admin -- in Owner field"
  else
    writeFailure "Fail to enter data -DSIntegration Admin - in - Owner - field "
  end
end

# Verify the table column under given section
Then(/^I should see the "([^"]*)" column in "([^"]*)" section MC$/) do |column_name, section_name|
  sleep 5
  if page.has_xpath?('//th[text()="'"#{column_name}"'"]/ancestor::div[1]/preceding-sibling::div[1]//h3[text()="'"#{section_name}"'"]')
    puts "The column - #{column_name} - is present over the page under #{section_name} section"
    sleep 5
  else
    writeFailure "The column - #{column_name} - is NOT present over the page under #{section_name} section"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

Then(/^I should see "([^"]*)" column under "([^"]*)" section MC$/) do |column_name, section_name|
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

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is present under "([^"]*)" section MC$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')
    within(:xpath, '(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')do
      if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
        puts "The field -#{field_name}- is present under #{section} section"
      elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
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


Then(/^I click Renewal Opportunity link MC$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[contains(text(),"Opportunity")]/following-sibling::td[1]//a')
    find(:xpath, '//td[contains(text(),"Opportunity")]/following-sibling::td[1]//a').click
    puts "The renewal opportunity link has been clicked"
  else
    writeFailure "fail to click renewal opportunity link"
  end
end

#Step definition to click a button
Then(/^I click "([^"]*)" button MC$/) do |buttonName|
  sleep 5
  if page.has_xpath?('//input[@title="'"#{buttonName}"'"]')
    find(:xpath, '//input[@title="'"#{buttonName}"'"]').click
    puts "The button - #{buttonName} - has been clicked"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The button - #{buttonName} - NOT found"
  end
end

#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)" MC$/) do |content|
  sleep 5
  if page.has_content? content
    puts "#{content} content is present"
  else
    fail(ArgumentError.new(content + 'content is not present'))
  end
end

Then(/^I should see Renewal Target column value as "([^"]*)" under RLI section MC$/) do |field_value|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{$prod_name}"'"]/parent::td[1]/following-sibling::td[text()="'"#{field_value}"'"]')
    puts "The column - Renewal Target - is showing - #{field_value} - under RLI section"
  else
    writeFailure "FAIL The column - Renewal Target - is NOT showing - #{field_value} - under RLI section"
  end
end

Then(/^I should see Total Price as "([^"]*)" under Products section MC$/) do |field_value|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"opportunityLineItemBlock")]//a[text()="'"#{$prod_name}"'"]/parent::th[1]/following-sibling::td[8][text()="'"#{field_value}"'"]')
    puts "The column - Total Price - is showing - #{field_value} - under Products section"
  else
    writeFailure "FAIL The column - Total Price - is NOT showing - #{field_value} - under Products section"
  end
end

Then(/^I should select the existing product MC$/) do
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{$prod_name}"'"]/parent::td[1]/preceding-sibling::td/input[@type="checkbox"]')
    find(:xpath, '//a[text()="'"#{$prod_name}"'"]/parent::td[1]/preceding-sibling::td/input[@type="checkbox"]').set(true)
    puts "The product - #{$prod_name} - has now beeen selected"
  else
    writeFailure "FAIL to select the product - #{$prod_name} - "
  end
end

Then(/^I click the link "([^"]*)" MC$/) do |link_text|
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{link_text}"'"]').click
    puts "The link - #{link_text} - has now beeen clicked"
  else
    writeFailure "FAIL to click the link - #{link_text} - "
  end
end

Then(/^I should see the product added in products related section MC$/) do
  sleep 30
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"opportunityLineItemBlock")]//a[text()="'"#{$prod_name}"'"]')
    puts "product - #{$prod_name} - has now been added in product section"
  else
    writeFailure "FAIL to find product - #{$prod_name} - under product section"
  end
end

Then(/^I click the newly added product under product section MC$/) do
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"opportunityLineItemBlock")]//a[text()="'"#{$prod_name}"'"]')
    find(:xpath, '//div[contains(@class,"opportunityLineItemBlock")]//a[text()="'"#{$prod_name}"'"]').click
    puts "product - #{$prod_name} - has been clicked"
  else
    writeFailure "FAIL to open newly added product"
  end
end

When(/^I open the existing opportunity MC$/) do
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set $opportunity_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  if page.has_xpath?('(//a[text()="Search All"])[1]')
    find(:xpath, '(//a[text()="Search All"])[1]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"opportunityBlock")]//a[text()="'"#{$opportunity_name}"'"]')
    find(:xpath, '//div[contains(@class,"opportunityBlock")]//a[text()="'"#{$opportunity_name}"'"]').click
  elsif page.has_xpath?('//div[text()="No matches found"]')
    writeFailure "FAIL to open the opportunity - #{$opportunity_name}"
  end
end

Then(/^I enter data in quote detail page to create new quote MC$/) do
  $quote_name = "Smoke_test_quote_MC_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input').set $quote_name
    puts "Entered -- #{$quote_name} -- in Quote Name field"
  else
    writeFailure "Fail to enter data in - Quote Name - field "
  end
  step 'I select "Direct" from "Quote Type" dropdown'
  step 'I select "1" from "Quote Type Year" dropdown'
  #step 'I select "CAD" from "Local Currency Code" dropdown'
end


Then(/^I select existing product MC$/) do
  if page.has_xpath?('//input[@title="Search" and @type="text"]')
    find(:xpath, '//input[@title="Search" and @type="text"]').set $prod_name1
    puts "- #{$prod_name1} - has been entered into search field"
  else
    writeFailure "Fail to enter - #{$prod_name1} - into search field"
  end
  if page.has_xpath?('//input[@title="Search" and @type="button"]')
    find(:xpath, '//input[@title="Search" and @type="button"]').click
    puts "Search button has been cliccked"
  else
    writeFailure "Fail to click search button"
  end
  sleep 5
  if page.has_xpath?('//span[text()="'"#{$prod_name1}"'"]/ancestor::td[1]/preceding-sibling::td//input[@type="checkbox"]')
    find(:xpath, '//span[text()="'"#{$prod_name1}"'"]/ancestor::td[1]/preceding-sibling::td//input[@type="checkbox"]').set(true)
    puts "The checkbox having product -- #{$prod_name1} -- has been checked"
  else
    writeFailure "Fail to check the checkbox having product -- #{$prod_name1} -- "
  end
  if page.has_xpath?('(//input[@title="Select"])[1]')
    find(:xpath, '(//input[@title="Select"])[1]').click
    puts "- Select -  button has been clicked"
  else
    writeFailure "Fail to click - Select - button "
  end
end


Then(/^I saved the product by entering quantity and sales price MC$/) do
  sleep 10
  if page.has_xpath?('//input[contains(@id,"Quantity")]')
    find(:xpath, '//input[contains(@id,"Quantity")]').set "1"
    puts "- 1 - has been entered into Quantity field"
  else
    writeFailure "Fail to enter - 1 - into Quantity field"
  end
  if page.has_xpath?('//input[contains(@id,"UnitPrice")]')
    find(:xpath, '//input[contains(@id,"UnitPrice")]').set "1"
    puts "- 1 - has been entered into Sales Price field"
  else
    writeFailure "Fail to enter - 1 - into Sales Price field"
  end
  if page.has_xpath?('//label[text()="Local Currency Amount"]/ancestor::tr[1]/following-sibling::tr[2]//td[8]//input')
    find(:xpath, '//label[text()="Local Currency Amount"]/ancestor::tr[1]/following-sibling::tr[2]//td[8]//input').set $currency_val
    puts "- #{$currency_val} - has been entered into Local Currency Amount field"
  else
    writeFailure "Fail to enter - #{$currency_val} - into Local Currency Amount field"
  end

  if page.has_xpath?('(//input[@title="Save"])[1]')
    find(:xpath, '(//input[@title="Save"])[1]').click
    puts "Save button has been clicked"
  else
    writeFailure "Fail to click the Save buttton"
  end
  
end



Then(/^I should see the new product over quote detail page under quote line item section MC$/) do
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"quoteLineItemBlock")]//a[text()="'"#{$prod_name1}"'"]')
    puts "The product - #{$prod_name1} - is present under quote line item section"
  else
    writeFailure "FAIL The product - #{$prod_name1} - is NOT present under quote line item section"
  end
end

#Step definition to verify if the button is present over the page
Then(/^I clicked on Start Sync button over the page MC$/) do
  begin
    sleep 5
    if page.has_xpath?('(//input[@title="Start Sync"])[1]')
      find(:xpath, '(//input[@title="Start Sync"])[1]').click
      puts "The button - Start Sync - is clicked"
    else
      writeFailure "The button - Start Sync - is - NOT - clicked"
    end
    #end
    Capybara.default_wait_time =30

  end
end

Then(/^I click on "([^"]*)" button MC$/) do |button_name|
  sleep 5
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  sleep 10
  within("div#syncQuoteOverlay_buttons") do #within("div#syncQuoteOverlay_buttons") --> id is used inside within
    sleep 5
    click_on(button_name)
    puts "- #{button_name} - button has been clicked"
  end
  page.driver.browser.switch_to.window(main)
end

Then(/^I open the quote line item just created MC$/) do
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"quoteLineItemBlock")]//a[text()="'"#{$prod_name1}"'"]')
    find(:xpath, '//div[contains(@class,"quoteLineItemBlock")]//a[text()="'"#{$prod_name1}"'"]').click
    puts "The product - #{$prod_name1} - link has been clicked"
  else
    writeFailure "FAIL The product - #{$prod_name1} - link has been not been clicked"
  end
end

Then(/^I click quote name from quote name field MC$/) do
  sleep 20
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="Quote Name"]/following-sibling::td[1]//a')
    find(:xpath, '//td[text()="Quote Name"]/following-sibling::td[1]//a').click
    puts "The quote name link has been clicked"
  else
    writeFailure "FAIL The quote name link has not been clicked"
  end
end

Then(/^I get "([^"]*)" currency value$/) do |currency_name|
  sleep 5
  step 'I selected "Setup" from user menu'
  step 'I clicked the "Company Profile" link under "Administration Setup"'
  step 'I clicked the link "Manage Currencies"'
  $currency_val=""
  if page.has_xpath?('(//th[text()="'"#{currency_name}"'"]/parent::tr[1]//td[contains(@class,"numericalColumn")])[1]')
    $currency_val=find(:xpath, '(//th[text()="'"#{currency_name}"'"]/parent::tr[1]//td[contains(@class,"numericalColumn")])[1]').text
    puts "The currency value is - #{$currency_val}"
  else
    writeFailure "FAIL to capture the currency value"
  end
 
end

# Click the button
Then(/^I clicked "([^"]*)" button over the page MC$/) do |field_name|
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

# Clicking Save button
Then(/^I click save button over RLI page MC$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//input[@value="Save"])[1]')
    find(:xpath, '(//input[@value="Save"])[1]').click
    puts "The Save button has been clicked over RLI page"

  end
  Capybara.default_wait_time =30
end

Then(/^I should see "([^"]*)" in "([^"]*)" field MC$/) do |field_value, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]/following-sibling::td[1]//div[text()="'"#{field_value}"'"]')
    puts "The field - #{field_name} -  with data - #{field_value} -  is present over the page"
  else
    writeFailure "fail to find the field - #{field_name} -  with data - #{field_value} -"
  end
end

Then(/^I enter EUR capture value in Previous Local Currency Amount MC$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="Previous Local Currency Amount"]/parent::*/following-sibling::*[1]//input')
    find(:xpath, '//label[text()="Previous Local Currency Amount"]/parent::*/following-sibling::*[1]//input').set $currency_val
    puts "Entered - #{$currency_val}- in Previous Local Currency Amount field"
  else
    writeFailure "fail to enter - #{$currency_val}- in Previous Local Currency Amount field"
  end
end



# Step definition to create new opportunity
Then(/^I enter "([^"]*)" in account name field$/) do |account_name|
	begin
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//img[@class="lookupIcon"]').click
      within_window(page.driver.browser.window_handles.last) do
        sleep 5
        within_frame('searchFrame')do
          find(:xpath, '//input[@name="lksrch"]').set account_name
          click_button('Go!')
          sleep 5
        end
        page.driver.browser.switch_to.frame("resultsFrame")
        within('.pbBody') do
          table=all("tbody")[0]
          table.all("tr")[1].all("th")[0].find('a').click
        end
      end
    else
      writeFailure "Fail Account Name field is present with R Only permission "
    end
  end
end

Then(/^I enter date in "([^"]*)" field MC$/) do |fieldName|
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

Then(/^I get "([^"]*)" currency value from "([^"]*)" tab from the application MC$/) do |currency_name, tab_name|
  sleep 5
  step 'I login as BA'
  step 'I selected "Setup" from user menu'
  step 'I clicked the "Company Profile" link under "Administration Setup"'
  step 'I click link "Manage Currencies"'
  step 'I clicked the button "Manage Currencies" over the page'
  if page.has_xpath?('//th[text()="'"#{currency_name}"'"]/following-sibling::td[3]')
    $currency_val=find(:xpath, '//th[text()="'"#{currency_name}"'"]/following-sibling::td[3]').text
  end
  $currency_val=$currency_val.to_s.strip
  puts $currency_val.to_f
   
end


Then(/^I get "([^"]*)" currency value from "([^"]*)" tab present in config guide MC$/) do |currency_name, tab_name|
  sleep 5
  
  Capybara.default_wait_time =1
  sleep 10
  temp=""
  arg=getGeneralDetails 'AdminUsers'
  excelsheet= WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open(arg["File_Path"])
  #wrksheet= wrkbook.Worksheets(arg["SheetName"])
  wrksheet= wrkbook.Worksheets(tab_name)
  wrksheet.Select

  i=2
  puts "----------------------------------------------------------------------------------------"
  #puts wrksheet.UsedRange.Rows.Count
  Capybara.default_wait_time =1
  for counter in i..wrksheet.UsedRange.Rows.Count

    base_currency1="B"+i.to_s
    base_currency=wrksheet.Range(base_currency1).Value
    puts base_currency
    if base_currency.nil?
      writeFailure "base currency -- is not found under cell --- #{base_currency1}"
    elsif base_currency.strip==currency_name.strip
      $currency_val="D"+i.to_s
      $currency_val=wrksheet.Range($currency_val).Value
      $currency_val=$currency_val.to_s.strip
      puts $currency_val.to_f
      break
    end
    i=i+1
  end

  Capybara.default_wait_time =30
end
# Select options from drop down
Then(/^I select first option from "([^"]*)" dropdown MC$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//select')
    if find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').text == "--None--"
      find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[2]').select_option
      puts "Selected second option from the - #{dropdown_name} - dropdown"
    elsif find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').text != "--None--"
      find(:xpath, '//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//option[1]').select_option
      puts "Selected first option from the - #{dropdown_name} - dropdown"
    else
      writeFailure "FAIL to select any option from field - #{dropdown_name} -"
    end
  else
    if page.has_xpath?('//*[text()="'"#{dropdown_name}"'"]')
      if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/parent::*[1]/following-sibling::*[1]//select')==false
        writeFailure "The field - #{dropdown_name} - is NOT appearing as - DROPDOWN - field"
      end
    else
      writeFailure "The field - #{dropdown_name} - is NOT present over the page"
      #fail(ArgumentError.new('Fail'))
    end
  end
  Capybara.default_wait_time =30
end

When(/^I should create new opportunity record MC$/) do
  step 'I login as BA'
  step 'I navigate to "Opportunities" tab in the application'
  step 'I clicked the button "New" over the page MC'
  step 'I clicked the button "Continue" over the page MC'
  
  $opportunity_name = "Smoke_test_opp_multiCurrency_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Opportunity Name"]/parent::td[1]/following-sibling::td[1]//input').set $opportunity_name
    puts "Entered -- #{$opportunity_name} -- in Opportunity name field"
  else
    writeFailure "Fail to enter data in - #{$opportunity_name} - field "
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
  step 'I select "USD - U.S. Dollar" from "Opportunity Currency" picklist MC'

  step 'I click Save button from top button row MC'
  step 'The "Opportunity" record should save seccessfully MC'
end

# Step definition to create new opportunity
Then(/^I enter "([^"]*)" in "([^"]*)" lookup field MC$/) do |record_name, field_name|
	begin
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//img[@class="lookupIcon"]')
      main = page.driver.browser.window_handles.first
      find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::*[1]/following-sibling::td[1]//img[@class="lookupIcon"]').click
      sleep 10
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
      page.driver.browser.switch_to.window(main)
    else
      writeFailure "FAIL to click the - #{field_name} - lookup field"
    end
  end
  sleep 5
end