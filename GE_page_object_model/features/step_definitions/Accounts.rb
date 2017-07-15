#Step definition for selecting first account record from table
Then(/^I select first account from "([^"]*)" collection$/) do |collection|
  begin
    if page.has_xpath?('//div[contains(@class,"row-first")]//td[contains(@class,"Name")]//a')
      find(:xpath, '//div[contains(@class,"row-first")]//td[contains(@class,"Name")]//a').click
      puts "The first account record has been selected from -#{collection}"
    else
      writeFailure"Fail to find account record in -#{collection}- collection"
    end

  rescue Exception=> ex
    writeFailure"Error while opening account record from -#{collection}- collection"
    writeFailure ex.message
  end
end


#Step definition to verify if the field is NOT present under a particular page section ---WITHOUT EDIT---
Then(/^I should see the field "([^"]*)" under "([^"]*)" section$/) do |field_name, section|
  begin
  within(:xpath, '//h2[text()="Account Detail"]/parent::td/parent::tr/parent::tbody/parent::table/parent::div/following-sibling::div[1]/div[2]')do
    if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      puts "The -#{field_name}- field is present under -#{section}- section"
    else
      writeFailure "The -#{field_name}- field is not present under -#{section}- section"
    end
  end
    rescue Exception=> ex
      writeFailure"Error while verifying the field permission of field - #{field_name}"
      writeFailure ex.message
end
end

#Step definition to check if the field is having R-Only permission
Then(/^I should see the field "([^"]*)" with R-Only permission$/) do |field_name|
  begin
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td/following-sibling::td[1]/*')
    writeFailure "The field #{field_name} is present with RW permission"
  else
    puts "The field #{field_name} is present with R-Only permission"
  end
    rescue Exception=> ex
      writeFailure"Error while verifying the field permission of field - #{field_name}"
      writeFailure ex.message
end
end


#step definition to verify max length of given field
When(/^I verified the field "([^"]*)" max lenght is "([^"]*)"$/) do |value, length|
 begin
    if page.has_xpath?('//label[text()="'"#{value}"'"]/parent::td/following-sibling::td[1]/input[@maxlength="'"#{length}"'"]')
      puts "The field -#{value}- is present over the page with maxlenght -#{length}"
    else
      writeFailure "The field -#{value}- maxlenght is -NOT- -#{length}"
    end
  rescue Exception=> ex
    writeFailure"Error while verifying field #{value} maxlenght"
    writeFailure ex.message
  end
end