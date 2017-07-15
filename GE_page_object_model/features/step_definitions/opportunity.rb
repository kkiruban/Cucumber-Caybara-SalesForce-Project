
#When(/^I select "([^"]*)" from view picklist$/) do |value|
#  begin
#    sleep 5
#    select value, :from => "View:"
#    if find(:button,"Go!").visible?
#      click_on "Go!"
#      sleep 5
#    else
#      puts "Go! button is not available for current user"
#    end
#  rescue Exception => ex
#  end
#end

When(/^I click on underlying opportunity name$/) do
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[2].all('a')[0].click
    puts "opportunity is selected"
  end
end
Then(/^I should see Opportunity Currency picklist values under opportunity edit row$/) do
  
end

Then(/^I should see Renewal Currency picklist values under opportunity edit row$/) do
  #  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see Renewal List Price Currency picklist values under existing financials row$/) do
  #  pending # Write code here that turns the phrase above into concrete actions
end


When(/^I double click on quote number and select quote number from lookup field$/) do
  find(:xpath,"//*[@id='CF00N360000066Z8d_ilecell']").double_click
  sleep 5
  page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='CF00N360000066Z8dIcon']").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    #      #      table.click_link(ymlval["Account Name"])
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
end

Then(/^I should see invoice date field is visible and editable$/) do
  within all('.pbSubsection')[8] do
    if page.has_field?('Invoice Date')
      puts "Invoice Date text field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Invoice Date field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see service centre informed of cono field is visible and editable$/) do
  within all('.pbSubsection')[8] do
    if page.has_field?('Service Centre Informed of CONO')
      puts "Service Centre Informed of CONO field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Service Centre Informed of CONO field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see invoice amount field is visible and editable$/) do
  within all('.pbSubsection')[7] do
    if page.has_field?('Invoice Amount')
      puts "Invoice Amount field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Invoice Amount field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see business line picklist values under opportunity edit row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7N']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["Core", "DIAGNOSTIC IMAGING","Ultrasound"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in business line picklist"
  else
    fail(ArgumentError.new('expected values are not visible in business line picklist'))
  end
end

Then(/^I should see client region picklist values under location inofrmation row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7h']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["CENTRAL", "DACH", "DISTRIBUTOR", "IRELAND", "LONDON", "NAMED ACCOUNT", "NORTH EAST", "NORTHERN IRELAND", "NORTH WEST", "SCOTLAND", "SOUTH", "SOUTH EAST", "SOUTH WEST", "UKI", "UNKNOWN"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in client region picklist"
  else
    fail(ArgumentError.new('expected values are not visible in client region picklist'))
  end
end

Then(/^I should see Client Territory picklist values under location inofrmation row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7i']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["Austria","CENTRAL","DISTRIBUTOR","EAST","IRELAND","LONDON","NAMED ACCOUNT","NORTH","NORTH EAST","NORTHERN IRELAND","NORTH WEST","SCOTLAND","SOUTH","SOUTH EAST","SOUTH WEST","SUPPORT","Swiss-French","Swiss-German","Swiss-Italian","TP-Dr. Stork Düsseldorf","TP-Gesundheit Nordhessen Kassel","TP-Krhaus Dernbach und Radiologie Wiesbaden","TP-Krhaus Dresden Friedrichstadt","TP-Medizinische Hochschule Hannove","TP-Tumorbiologie Freiburg","UNKNOWN","WEST"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Territory picklist"
  else
    fail(ArgumentError.new('expected values are not visible in Client Territory picklist'))
  end
end

Then(/^I should see comm type picklist values under opportunity edit row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7k']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Email","Fax","Letter","Phone"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in comm type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in comm type picklist'))
  end
end

Then(/^I should see country picklist values under location inofrmation row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7t']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["Austria", "Germany", "Ireland", "Switzerland","United Kingdom"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Country picklist"
  else
    fail(ArgumentError.new('expected values are not visible in Country picklist'))
  end
end

Then(/^I should see direct channel picklist values under location inofrmation row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z7z']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Direct","Channel Tier 1","Channel Tier 2"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in direct channel picklist"
  else
    fail(ArgumentError.new('expected values are not visible in direct channel picklist'))
  end
end

Then(/^I should see opportunity type picklist values under opportunity edit row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z8V']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Enterprise","Volume","ODS","RECAPTURE"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in opportunity type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in opportunity type picklist'))
  end
end

Then(/^I should see SSI theatre picklist values under location information row$/) do
  actualvalues =find(:xpath,"//*[@id='00N360000066Z8r']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["EMEA","APAC","NALA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in SSI theatre picklist"
  else
    fail(ArgumentError.new('expected values are not visible in SSI theatre picklist'))
  end
end

Then(/^I should see age field is visible under opportunity detail row$/) do
  if page.has_field?('age')
    fail(ArgumentError.new('age field is editable under order information row'))
  else
    page.has_content?('age')
  end
end

Then(/^I should see Client Sales Stage field is visible under opportunity detail row$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?('Client Sales Stage')
      puts "Client Sales Stage field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Client Sales Stage field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see Customer Group field is visible and editable under opportunity edit row$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?('Customer Group')
      puts "Customer Group field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Customer Group field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see source field is visible and editable under opportunity edit row$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?('Source')
      puts "Source field is visible and editable under order information row"
    else
      fail(ArgumentError.new('Source field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see "([^"]*)" field is visible and editable under opportunity edit row$/) do |label_name|
  within all('.pbSubsection')[0] do
    if page.has_field?(label_name)
      puts "#{label_name} is visible and editable under order information row"
    else
      fail(ArgumentError.new(label_name + ' is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see "([^"]*)" picklist values under opportunity edit row$/) do |label_name|
  actualvalues =find(:xpath,"//*[@id='00NR0000001OY6O']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","0-Safety","1-System Down","2-System Part Down","3-System Up","None"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in #{label_name} picklist"
  else
    fail(ArgumentError.new('expected values are not visible in picklist'+ label_name))
  end
end

Then(/^I should see client quote number field is only readable and visible under opportunity detail row$/) do
  if page.has_field?('Client Quote Number')
    fail(ArgumentError.new('Client Quote Number field is editable under order information row'))
  else
    page.has_content?('Client Quote Number')
  end
end

When(/^I select "([^"]*)" from stage field under opportunity edit row with so number field blank$/) do |value|
  select(value, :from => "opp11")
end

When(/^I search opportunity "([^"]*)" under search input field$/) do |opportunity_name|
  fill_in "phSearchInput",:with => opportunity_name
  sleep 2
  click_button('Search')
  sleep 2
end

When(/^I click on opportunity name$/) do
  sleep 2
  if has_field?('helpBubbleCloseX')
    click_on('helpBubbleCloseX')
    sleep 2
    click_link('01_saswat_ge_admin')
  else
    click_link('01_saswat_ge_admin')
  end
  sleep 5
end

