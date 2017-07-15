
#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)"$/) do |content|
  sleep 5
  if page.has_content? content
    puts "#{content} content is present"
  else
    writeFailure "#{content} content is not present"
  end
end

Then(/^I select "([^"]*)" from "([^"]*)" field$/) do |value, locator|
  if page.has_select? locator
    select(value, :from => locator)
  else
     writeFailure " #{locator} is not visible"
  end
end

Then(/^I should see "([^"]*)" field with read and write permission$/) do |value|
  if page.has_field?(value)
    puts "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

When(/^I click on all tabs view button$/) do
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 5
end

Given(/^I should navigate to Home tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 15
end

Then(/^I should not see "([^"]*)" list$/) do |layout|
  sleep 5
  if page.has_content? layout
    writeFailure "#{layout} list is present"
  else
    puts "#{layout} list is not present"
  end
end

When(/^I click on New Renewable Line Item button$/) do
   find(:xpath,"//input[@title='New Renewable Line Item']").click
   sleep 5
end

#step definition to click on bottom row button
When(/^I click on "([^"]*)" button from bottom row$/) do |val|
  within(:id,'bottomButtonRow') do
    if find(:button, val).visible?
      click_on val
      sleep 5
    end
  end
end

#step definition to verify the link in a web page that specified in an feature step
Then(/^I should see "([^"]*)" link$/) do |link|
  if page.find_link(link).visible?
    puts "#{link} link is visible"
  else
    fail(ArgumentError.new(link + ' link is not visible'))
  end
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

#step definition to click on button under top button row
When(/^I click on "([^"]*)" button on top button row$/) do |button_name|
  sleep 5
  within all('.pbButton')[0] do
    click_on button_name
  end
end

#step definition to select a value from drop down
When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, locator|
  sleep 10
  if page.has_select? locator
    select(value, :from => locator)
  else
    fail(ArgumentError.new(value + ' is not editable for current user '))
  end
end

#Step to click on new button
When(/^I follow on "([^"]*)" button$/) do |button_name|
  if find_button(button_name).visible?
    click_on button_name
  else
    fail(ArgumentError.new(+button_name+ ' button is not visible'))
  end
  sleep 5
end


#step definition to click on edit,save,cancel Button in the opened Quotes page
When(/^I click on "([^"]*)" button from top row$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
  if page.has_content?("Error: Invalid Data. ")
    fail(ArgumentError.new('Not'+val+ 'd successfully due to Invalid Data. '))
  else
    puts val + "d successfully"
  end
  sleep 2
end

#step definition to click on go button
When(/^I follow go button$/) do
  within('.bFilterView') do
    click_on("Go!", match: :first)
    sleep 5
  end
end

#step definition to verify the field is visible or not
Then(/^I should see "([^"]*)" field is visible$/) do |label_name|
  if find_field(label_name).visible?
    puts label_name + " field is present"
  else
    fail(ArgumentError.new(label_name + 'field is not present'))
  end
end

#Step definition to verify the field is select type
Then(/^I verify "([^"]*)" field is of type select$/) do |select_type|
  if page.has_select?(select_type)
    puts "The #{select_type} is of type select"
  else
    fail(ArgumentError.new('The' + select_type + 'is not of type select'))
  end
end

#Step definition to enter date in date field
And(/^I entered todays date in "([^"]*)" field$/) do |field_name|
  currentTime=Time.now.strftime("%m/%d/%Y")
  page.find_field(field_name).set(currentTime)
end

#step definition to navigate to particular tab
When(/^I navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
end

#step definition to verify button under top row
Then(/^I should see "([^"]*)" button in top row$/) do |button_value|
  within(:id,'topButtonRow') do
    if find_button(button_value).visible?
      puts button_value + "button is visible"
    else
      fail(ArgumentError.new(button_value + 'button is not visible'))
    end
  end
end

When(/^I click on "([^"]*)" tab$/) do |tab|
  click_on(tab)
end
