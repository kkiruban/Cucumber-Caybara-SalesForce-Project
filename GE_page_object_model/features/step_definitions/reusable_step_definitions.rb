
#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)"$/) do |content|
  if page.has_content? content
    puts "#{content} content is present"
  else
    fail(ArgumentError.new(content + ' content is not present'))
  end
end

#Step to click on new button
When(/^I follow on "([^"]*)" button$/) do |button_name|
  if find_button(button_name).visible?
    click_on button_name
  else
    fail(ArgumentError.new(button_name + ' button is not visible'))
  end
end

#step definition to verify the link in a web page that specified in an feature step
Then(/^I should see "([^"]*)" link$/) do |link|
  find_link(link).visible?
end


#step definition to click the particular link in a web page that specified in an feature step
When(/^I follow "([^"]*)" link$/) do |link|
  find_link(link).visible?
  click_link(link)
end

#step definition to wait for time we mention in a method
When(/^I wait for (\d+) seconds$/) do |seconds|
  sleep(seconds.to_i)
end

#step definition to click on a button in top button row
When(/^I click on "([^"]*)" button on top button row$/) do |button_name|
  within all('.pbButton')[0] do
    click_on button_name
    puts "The button #{button_name} has been clicked"
    sleep 5
  end
  
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field picklist options$/) do |select_field|
  begin
    arg=getDetails "CommonData"
    if page.has_select?(select_field)
      #actualArrayOption=find(:xpath, '//label[contains(text(), "Renewal Currency")]').all('option').collect(&:text)
      actualArrayOption=find_field(select_field).all('option').collect(&:text)
    elsif page.has_xpath?('//label[text()="'"#{select_field}"'"]')
      writeFailure"The field -#{select_field}-is present with R-Only permission"
    else
      writeFailure"The field -#{select_field}- is not present over the page"
    end
    expectedArrayOption=arg[select_field]
    puts "Actual options are : #{actualArrayOption}"
    puts "Expected Options are : #{expectedArrayOption}"
    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "All the expected options for the field -#{select_field}- is present"
    else
      puts "The following options from -#{select_field}- dropdown is missing"
      puts resultArray
    end
  end
end

#step definition to click on edit,save,cancel Button in the opened Quotes page
#And(/^I click on the "([^"]*)" button$/) do |val|
When(/^I click on "([^"]*)" button from top row$/) do |val|
  begin
    within(:id,'topButtonRow') do
      if find(:button, val).visible?
        click_on val
      end
    end
    sleep 2
    if page.has_content?("Error: Invalid Data. ")
      writeFailure "Not " + val + "d successfully due to Invalid Data. "
    else
      puts val + "d successfully"
    end
    sleep 2
  rescue Exception=> ex
    writeFailure"Error while doing #{val}"
    writeFailure ex.message
  end
end

When(/^I follow go button$/) do
  begin
    within('.bFilterView') do
      click_on("Go!", match: :first)
      sleep 5
    end
  rescue Exception=> ex
    writeFailure "Error while clicking on quote type year field under information section"
    writeFailure ex.message
  end
end

Then(/^I should see "([^"]*)" field is visible$/) do |label_name|
  if find_field(label_name).visible?
    puts label_name + " field is present"
  else
    puts label_name + " field is not present"
  end
end

When(/^I click on xpath "([^"]*)"$/) do |xpath|
  page.find(:xpath, xpath).click
end


#Step definition to verify the field is select type
Then(/^I veified the "([^"]*)" field is of type select$/) do |select_type|
  begin
    if page.has_select?(select_type)
      puts "The #{select_type} is of type select"
    else
      puts "The #{select_type} is not of type select "
    end
  end
end

# Step definition verify the drop down option
Then(/^I should see "([^"]*)" field picklist values$/) do |select_field|\
    begin
    arg=getDetails "CommonData"
    expectedArrayOption=arg[select_field]
    expectedArrayOption.each do |option|
      if page.has_xpath?('//label[text()= "'"#{select_field}"'"]/parent::td[1]/following-sibling::td[1]//option[contains(text(),"'"#{option}"'")]')
        next
      else
        puts "The option #{option} is missing from #{select_field} dropdown"
      end
    end
  end
end


#Step definition to enter date in date field
And(/^I entered todays date in "([^"]*)" field$/) do |field_name|
  begin
    currentTime=Time.now.strftime("%m/%d/%Y")
    page.find_field(field_name).set(currentTime)
    puts "The 'Multi Year End Date' field value is slected"
  rescue Exception=> ex
    writeFailure"Error while saving the Opportunity Asset"
    writeFailure ex.message
  end
end

When(/^I navigate to "([^"]*)" tab$/) do |tab|
  click_link(tab)
end

Then(/^I should see "([^"]*)" button in top row$/) do |button_value|
  within(:id,'topButtonRow') do
    if find_button(button_value).visible?
      puts button_value + "button is visible"
    else
      fail(ArgumentError.new(button_value + 'button is not visible'))
    end
  end
end

#step definition to select a option from drop down also check the field permission
When(/^I select "([^"]*)" option from "([^"]*)" dropdown$/) do |option, select_field|
  begin
    if page.has_xpath?('//label[text()="'"#{select_field}"'"]')
      if page.has_xpath?('//label[text()="'"#{select_field}"'"]/parent::td/following-sibling::td[1]//select')
        find(:xpath, '//label[text()="'"#{select_field}"'"]/parent::td/following-sibling::td[1]//select').select option
        puts "Selected #{option} option from #{select_field} dropdown"
      else
        writeFailure "Fail to select #{option} option from #{select_field} dropdown"
        writeFailure "The field #{select_field} dropdown is present with R permission"
      end
    else
      writeFailure"The field #{select_field} is not present over the page "
    end
  rescue Exception=> ex
    writeFailure "Error while selecting #{option} option from #{select_field} dropdown"
    writeFailure ex.message
  end
end

#Step definition for clicking button over page
Then(/^I follow the "([^"]*)" button$/) do |button_value|
  begin
    if page.has_button?(button_value)
      click_on button_value
      puts "The #{button_value} button has been clicked"
    else
      fail(ArgumentError.new(button_value + 'button is not visible'))
    end
  end
end

#Step definition for clicking button over page
Then(/^I should see "([^"]*)" option in "([^"]*)" dropdown$/) do |option, select_field|
  begin

    if page.has_select?(select_field)
      actualArrayOption=find_field(select_field).all('option').collect(&:text)
    end
    if actualArrayOption.include? option
      puts "The options -#{option}- is present under -#{select_field}- dropdown"
    else
      puts "The options -#{option}- is NOT present under -#{select_field}- dropdown"
    end
  rescue Exception=> ex
    writeFailure "Error while verifying options -#{option}- under -#{select_field}- dropdown"
    writeFailure ex.message
  end
end

#Step definition to verify if the text field is having RW permission
Then(/^I should see "([^"]*)" text field with RW permission$/) do |field_name|
  begin
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td/following-sibling::td[1]//input')
        puts "The field -#{field_name}- is present with RW permission"
      else
        writeFailure "The field -#{field_name}- is present with R permission"
      end
    else
      writeFailure"The field -#{field_name}- is not present over the page "
    end
  rescue Exception=> ex
    writeFailure"Error while verifying -#{field_name}- field permission"
    writeFailure ex.message
  end
end


#Step definition to select option in drop down
And(/^I selected "([^"]*)" option from "([^"]*)" dropdown field$/) do |option, field_name|
  begin
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td/following-sibling::td[1]//select').select option
      puts "Selected -#{option}- option from -#{field_name}- dropdown"
    else
      writeFailure "Fail to selected -#{option}- option from -#{field_name}- dropdown"
    end
  
  rescue Exception=> ex
    writeFailure"Error while selecting -#{option}- option from -#{field_name}- dropdown"
    writeFailure ex.message
  end
end


#step definition to select a value from view drop down
When(/^I select "([^"]*)" from view picklist$/) do |value|
  begin
    if  find_field('fcf').find('option[selected]').text == value
      within('.filterOverview') do
        #find(:xpath, '//input[@type="button" and @title="Go!"]').click
        click_on "Go!"
        sleep 15
        puts "Selected #{value} option from view dropdown"
      end
    else
      select value, :from => "View:"
      #click_on "Go!"
      puts "Selected #{value} option from view dropdown"
      sleep 5
    end
  rescue Exception=> ex
    writeFailure"Error while selecting #{value} option from view dropdown"
    writeFailure ex.message
  end
end

#step definition to verify if the given field is a text field

When(/^I verified the field "([^"]*)" as text field$/) do |value|
  begin
    if page.has_xpath?('//label[text()="'"#{value}"'"]/parent::td/following-sibling::td[1]/input[@type="text"]')
      puts "The field #{value} is present over the page as -TEXT- field"
    else
      writeFailure "The field #{value} is -NOT- a text field"
    end
  rescue Exception=> ex
    writeFailure"Error while verifying field #{value} as text field"
    writeFailure ex.message
  end
end