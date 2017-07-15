
Then(/^I fill all mandantory fields to create a new opportunity$/) do
  $newopportunity="smoke-test-quote" + Random.new.rand(0001..10000).to_s
  puts $newopportunity
  fill_in "Opportunity Name",:with => $newopportunity
  sleep 3

  # to click on account
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='opp4_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  fill_in "Close Date",:with => "9/27/2016"
  sleep 2
  select("Not Contacted", :from => 'opp11')
  sleep 2
  select("Volume", :from => 'Opportunity Type')
  select("Direct", :from => 'Direct/Channel')
  select("ANZ", :from => 'Client Region')
  select("United Kingdom", :from => 'Country')
  select("NALA", :from => 'SSI Theatre')
  sleep 2
end

Then(/^I should see direct channel field under partner information$/) do
  if page.has_field?("Direct/Channel")
    puts "direct channel field is visible"
  else
    writeFailure "direct channel field is not found"
  end
end

Then(/^I should see Google SFDC ID field under opportunity detail$/) do
  if page.has_content?("Google SFDC ID")
    puts "Google SFDC ID field is visible"
  else
    writeFailure "Google SFDC ID field is not found"
  end
end

When(/^I click on underlying opportunity name$/) do
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[1].all('a')[0].click
    puts "opportunity is selected"
  end
end

When(/^I click on opportunity link under renewal relationship details$/) do
  find(:xpath,".//*[@id='CF00N3600000PVO7I_ilecell']/div/a").click
  sleep 5
end

Then(/^I should see Existing Product field in opportunity edit page$/) do
  if page.has_field?("Existing Product")
    puts "Existing Product field is visible"
  else
    writeFailure "Existing Product field is not found"
  end
end

When(/^I click on new quote button$/) do
  find(:xpath,"//input[@value='New Quote']").click
  sleep 5
end

When(/^I fill quote name under quote information section$/) do
 $newquote="smoke-test-quote" + Random.new.rand(0001..10000).to_s
  puts $newquote
  fill_in "Quote Name",:with => $newquote
  sleep 5
end

When(/^I click on opporunity name under quote detail$/) do
  find(:xpath,".//*[@id='Opportunity_ilecell']/div/a").click
  sleep 5
end

When(/^I select "([^"]*)" from stage picklist$/) do |value|
  select("Closed Sale", :from => 'opp11')
end

When(/^I select "([^"]*)" from view picklist$/) do |value|
  sleep 5
  select value, :from => "View:"
  if find(:button,"Go!").visible? == true
    click_on "Go!"
    sleep 5
  else
    puts "Go! button is not visible"
  end
end

Then(/^I should see Covered Product field in opportunity edit page$/) do
  if page.has_field?("Covered Product")
    puts "Covered Product field is visible"
  else
    writeFailure "Covered Product field is not found"
  end
end

Then(/^I should see Product field in opportunity edit page$/) do
  if page.has_field?("Product")
    puts "Product field is visible"
  else
    writeFailure "Product field is not found"
  end
end

Then(/^I should see Original Order Number under order information$/) do
  if page.has_field?("Original Order Number")
    puts "Original Order Number field is visible"
  else
    writeFailure "Original Order Number field is not found"
  end
end

Then(/^I should verify direct channel field permission$/) do
  if page.has_select?("*Direct/Channel", :selected => "--None--")
    puts "direct channel field is editable picklist"
  else
    puts "direct channel field is not picklist"
  end
end

Then(/^I should verify Google SFDC ID field permission$/) do
  if page.has_content?("Google SFDC ID")
    puts "Google SFDC ID is a text field"
  else
    writeFailure "Google SFDC ID field is not found"
  end
end

When(/^I click on new renewable line item button$/) do
  find(:xpath,"//input[@value='New Renewable Line Item']").click
  sleep 5
end

Then(/^I should verify Original Order Number field permission$/) do
  if page.has_field?("Original Order Number")
    puts "Original Order Number is a text field"
  else
    writeFailure "Original Order Number field is not found"
  end
end

Then(/^I should verify business line picklist values$/) do
  actualvalues =find_field("Business Line").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Maps"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in business line picklist"
  else
    writeFailure "expected values are not visible in business line picklist"
  end
end

Then(/^I should verify Client Territory picklist values$/) do
  actualvalues =find_field("Client Territory").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["TBD"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Territory picklist"
  else
    writeFailure "expected values are not visible in Client Territory picklist"
  end
end

Then(/^I should verify Renewal Currencies picklist values$/) do
  actualvalues =find_field("Opportunity Currency").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["EUR - Euro","GBP - British Pound", "JPY - Japanese Yen","USD - U.S. Dollar"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Renewal Currencies picklist"
  else
    writeFailure "expected values are not visible in Renewal Currencies picklist"
  end
end

Then(/^I should verify SSI Theatre picklist values$/) do
  actualvalues =find_field("SSI Theatre").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","APAC","EMEA", "NALA"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in SSI Theatre picklist"
  else
    writeFailure "expected values are not visible in SSI Theatre picklist"
  end
end

Then(/^I should verify Client Regions picklist values$/) do
  actualvalues =find_field("Client Region").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","ANZ","ASIA", "Canada","Commercial","EMEA","EMEA - DACH","EMEA - FRITES","EMEA - Other","EMEA - UK","Federal","Japan","LATAM","MIDDLE EAST - UNITED ARAB EMIRATES","NA","Other APAC","SLED","UK&I - UNITED KINGDOM"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Regions picklist"
  else
    writeFailure "expected values are not visible in Client Regions picklist"
  end
end

When(/^I fill all mandantory fields to create new renewable line item$/) do
  fill_in "Existing Start Date",:with => "9/27/2016"
  sleep 3
  fill_in "New Start Date",:with => "9/27/2016"
  sleep 3
  fill_in "Existing End Date",:with => "9/27/2016"
  sleep 3
  fill_in "New End Date",:with => "9/27/2016"
  sleep 3
  fill_in "Quantity",:with => "200"
  sleep 3

  # to select existing product
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id30:0:j_id31_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  # to select owner
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id30:11:j_id31_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end


When(/^I search opportunity "([^"]*)" under search input field$/) do |opportunity_name|
  fill_in "phSearchInput",:with => opportunity_name
  sleep 2
  click_button('Search')
  sleep 3
  within(:id,'Opportunity_body') do
       table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
      
  end
  
end

Then(/^I click on Edit Product Line Item in opportunity page$/) do
   within(:id,'0066C000001rNOb_RelatedLineItemList_body') do
    table=all("tbody")[0].all('tr')[1].all('td')[0]    
    table.click_link("Edit")
#    table.all('tr')[1].all('td')[0].find('a').click
    end
      
 end