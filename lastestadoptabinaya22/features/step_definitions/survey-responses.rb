#survey-responses
Given(/^I should navigate to survey responses tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 10
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
click_link("Survey Responses")
 #find(:xpath,"//a[@class='listRelatedObject']").click
  sleep 15
end

Then(/^I should see account field under information row$/) do
  if page.has_field?("Account")
    puts "Account field picklist is visible"
  else
    fail(ArgumentError.new('Account field picklist is not visible'))
  end
end

Then(/^I should see date completed field under information row$/) do
  if page.has_field?("Date Completed")
    puts "Date Completed field picklist is visible"
  else
    fail(ArgumentError.new('Date Completed field picklist is not visible'))
  end
end

Then(/^I should see time completed field under information row$/) do
  if page.has_field?("Time Completed")
    puts "Time Completed field picklist is visible"
  else
    fail(ArgumentError.new('Time Completed field picklist is not visible'))
  end
end

Then(/^I should see link to survey field under information row$/) do
  if page.has_field?("Link to Survey")
    puts "Link to Survey field picklist is visible"
  else
    fail(ArgumentError.new('Link to Survey field picklist is not visible'))
  end
end

Then(/^I should see taken by field under information row$/) do
  if page.has_field?("Product")
    puts "Product field picklist is visible"
  else
    fail(ArgumentError.new('Product field picklist is not visible'))
  end
end

Then(/^I should see product field under information row$/) do
  if page.has_field?("Taken By")
    puts "Taken By field picklist is visible"
  else
    fail(ArgumentError.new('Taken By field picklist is not visible'))
  end
end

Then(/^I should see survey name field under information row$/) do
  if page.has_field?("Survey Name")
    puts "Survey Name field picklist is visible"
  else
    fail(ArgumentError.new('Survey Name field picklist is not visible'))
  end
end
