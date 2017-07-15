
Then(/^I should see type picklist under fields row$/) do
  if page.has_select?("Type", :selected => "--None--")
    puts "type picklist is visible"
  else
    writeFailure "type pick list not visible under contact information"
  end
end

Then(/^I should see type picklist with write permission$/) do
  if page.has_select?("Type", :selected => "--None--")
    puts "type picklist with write permission"
  else
    writeFailure "type pick list not editable"
  end
end

Then(/^I should see type picklist with read permission$/) do
  if page.has_select?("Type", :selected => "--None--")
    writeFailure "type picklist with write permission"
  elsif page.has_content?("Type")
    puts "type pick list with read permission"
  else
    writeFailure "type pick list is not visible"
  end
end

When(/^I click on contacts then fields under customize app setup$/) do
  fill_in('setupSearch', :with => 'contacts')
  sleep 5
  find(:xpath,"//*[@id='ContactFields_font']").click
  sleep 5
end

Then(/^I should see contact custom fields & relationships table$/) do
  if page.has_xpath?("//*[@id='CustomFieldRelatedList']")
    puts "contact custom fields & relationships table is visible"
  else
    writeFailure "contact custom fields & relationships table is not visible"
  end
end

Then(/^I should see clean button$/) do
  if page.has_field?("Clean")
    puts "Clean button is visible"
  else
    writeFailure "Clean button is not visible"
  end
end

Then(/^I should see clean status field with read only permission$/) do
  if page.has_field?('Clean Status')
    writeFailure "Clean status field is visible with read and write permission"
  elsif page.has_content?('Clean Status')
    puts "Clean status field is visible with read permission"
  else
    writeFailure "clean status field is not visible"
  end
end