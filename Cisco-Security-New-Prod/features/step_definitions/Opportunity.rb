Then(/^I click on new Opportunity button from Opportunity related section$/) do
  sleep 2
  find(:xpath, "//td/input[@name='newOpp']").click
  within('.pbSubsection') do
    select("Opportunity - Edit", :from => "Record Type of new record")
  end
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

When(/^I Edit on existing RLI$/) do
  find(:xpath,"//a[@title='Edit - Record 1 - a0o0S00000055hV']").click
  sleep 10
end

Then(/^I verify adds picklist value in batch type picklist$/) do
  select("Adds", :from => "00N3600000POZG3")
  sleep 5
end

When(/^I update previous price or Renewal Target Multiplier fields$/) do
  fill_in("Previous Price", :with=> "300")
  fill_in("Renewal Target Multiplier", :with=> "10")
end

When(/^I click on Add New Partner Opportunity button$/) do
  find(:xpath,".//input[@value='Add New Partner Opportunity']").click
  sleep 10
end

When(/^I enter all mandantory fields to create new partner opportunity$/) do
  randomvalue=('0001'..'9999').to_a.sample
  partneropportunity= "smoke-test-partner-opportunity-#{randomvalue}"
  fill_in("j_id0:addRenewalPartnerForm:j_id102:j_id103:j_id104", :with=> partneropportunity)
  sleep 10
end

When(/^I should click on grant access bottom row button$/) do
  find(:xpath,".//*[@id='j_id0:addRenewalPartnerForm:j_id102:partnerOrgSection:ButtonBlock:j_id192:grantAccessBtn']").click
  sleep 10
end

When(/^I click "([^"]*)" button from top row$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  within(:id,'Opportunity_body') do
    click_on "smoke-test-opportunity-2-222"
    sleep 10
  end
end

Then(/^I should see following "([^"]*)" error$/) do |value|
  if page.has_content?(value)
    puts "#{value} error is visible"
  else
    writeFailure "#{value} error is not visible"
  end
end

When(/^I select "([^"]*)" from stage field$/) do |value|
  select("Closed Sale", :from => "opp11")
  sleep 15
end

Then(/^I should verify Partner Account one Type picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POWZZ']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Reseller","Distributor","Partner"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Partner Account one Type picklist"
  else
    writeFailure "expected values are not visible in Partner Account one Type picklist"
  end
end

Then(/^I should verify Partner Account two Type picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POWZc']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Reseller","Distributor","Partner"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Partner Account two Type picklist"
  else
    writeFailure "expected values are not visible in Partner Account two Type picklist"
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
  fill_in "Previous Price",:with => "500"
  sleep 3
  # to select existing product
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:0:j_id32_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke")
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
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:10:j_id32_lkwgt']").click
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

When(/^I click on opportunity link under renewal relationship details$/) do
  find(:xpath,"//*[@id='CF00N3600000POWbm_ilecell']/div/a").click
  sleep 5
end

When(/^I click on new renewable line item button$/) do
  find(:xpath,"//input[@value='New Renewable Line Item']").click
  sleep 5
end

When(/^I click on Manage Renewals button under Renewable Line Item section$/) do
  find(:xpath,"//input[@value='Manage Renewals']").click
  sleep 5
end

When(/^I choose a value from sales level one lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath, ".//*[@id='CF00N3600000R8i41_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

When(/^I choose a value from sales level two lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000R8i3y_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

When(/^I check existinig product in renewal relationship page$/) do
  find(:xpath,".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
  sleep 5
end

When(/^I click on rebuild opportunity link$/) do
  find(:xpath,".//*[@id='rebuildRRtoOLI']").click
  sleep 10
end

When(/^I choose a value from sales level three lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000R8i40_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

When(/^I choose a value from sales level four lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000R8i3w_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

When(/^I choose a value from sales level five lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000R8i3x_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

When(/^I choose a value from sales level six lookup field$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000R8i3z_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
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

Then(/^I should verify business line picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POZC1']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Security"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in business line picklist"
  else
    writeFailure "expected values are not visible in business line picklist"
  end  
end

Then(/^I should verify SSI Theatre picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POZDP']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "N/A"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Theatre picklist"
  else
    writeFailure "expected values are not visible in SSI Theatre picklist"
  end
end

Then(/^I should verify Client Territory picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POZC6']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "N/A"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Territory picklist"
  else
    writeFailure "expected values are not visible in Client Territory picklist"
  end
end

Then(/^I should verify Client Region picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000POZC4']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "N/A"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Region picklist"
  else
    writeFailure "expected values are not visible in Client Region picklist"
  end
end

Then(/^I should see Direct\/Channel picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000IJISv']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Direct", "Channel Tier 1", "Channel Tier 2","Unknown"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Direct Channel picklist"
  else
    writeFailure "expected values are not visible in Direct Channel picklist"
  end
end

Then(/^I should see SSI Theatre picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000IJIU7']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "APJ", "EMEA", "NALA","Unknown"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in SSI Theatre picklist"
  else
    writeFailure "expected values are not visible in SSI Theatre picklist"
  end
end

Then(/^I should see Client Region picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000IJISl']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "AF","ANZ","ASEAN","BENELUX","CANADA","CHINA","DACH","EE","EEMR","Finland","FRANCE","HK/TW","IBERIA","INDIA","ITALY","JAPAN","KOREA","LATAM","ME","RUSSIA","SAD","SAF","Scandinavia","UK","Unknown"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Region picklist"
  else
    writeFailure "expected values are not visible in Client Region picklist"
  end
end

Then(/^I should see Country picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000IJISs']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Afghanistan"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Country picklist"
  else
    writeFailure "expected values are not visible in Country picklist"
  end
end

#When(/^I enter following values in opportunity textbox:$/) do |table|
#  # table is a Cucumber::MultilineArgument::DataTable
#  fill_in('opp3', :with => table)
#end

Then(/^I should verify Country field picklist values:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  if page.has_xpath?("//*[@id='00N4100000IJISs']/option[@value='#{table}']")
    puts "#{table} value is visible"
  else
    writeFailure "#{table} value is not visible"
  end
  #   select(table, :from => "00N4100000IJISs")
  #   sleep 5
end

Then(/^I should see Dedicated Account field with read and write permission$/) do
  if page.has_field?("Dedicated Account")
    puts "Dedicated Account field is visible with editable permission"
  elsif page.has_content?('Dedicated Account')
    writeFailure "Dedicated Account field is visible with readable permission"
  else
    writeFailure "Dedicated Account field is not visible"
  end
end

Then(/^I should see Local Renewal Target field with read only permission$/) do
  if page.has_field?("Local Renewal Target")
    writeFailure "Local Renewal Target field is visible with editable permission"
  elsif page.has_content?('Local Renewal Target')
    puts "Local Renewal Target field is visible with readable permission"
  else
    writeFailure "Local Renewal Target field is not visible"
  end
end

Then(/^I should see Client Operating Region field with read and write permission$/) do
  if page.has_field?("Client Operating Region")
    puts  "Client Operating Region field is visible with editable permission"
  elsif page.has_content?('Client Operating Region')
    writeFailure "Client Operating Region field is visible with readable permission"
  else
    writeFailure "Client Operating Region field is not visible"
  end
end

Then(/^I should verify Client Operating Region field picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N4100000IJITb']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","ANZ", "ASEAN", "BENELUX", "CEE", "FRANCE", "GREATER CHINA", "INDIA", "JAPAN", "KOREA", "LATAM", "MEA", "N AMERICA", "NORDIC", "SPI", "UK"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Operating Region picklist"
  else
    writeFailure "expected values are not visible in Client Operating Region picklist"
  end
end

Then(/^I should see Client Sub\-Region field with read and write permission$/) do
  if page.has_field?("00N4100000IJITa")
    puts  "Client Sub\-Region field is visible with editable permission"
  elsif page.has_content?('Client Sub-Region')
    writeFailure "Client Sub-Region field is visible with readable permission"
  else
    writeFailure "Client Sub-Region field is not visible"
  end
end

Then(/^I should verify Client Sub\-Region field picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N4100000IJITa']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Adriatics", "ANZ", "ASEAN", "BELUX", "Brazil", "Canada", "China", "CIS", "DACH", "East Africa", "Finland", "France", "Greece", "Gulf", "HK/TW", "IBERIA", "India", "Israel", "Italy", "Japan", "KOREA", "Levant", "Maghreb", "Mexico", "Middle East", "Netherlands", "North Africa", "Poland", "Rest of Africa", "Rest of Latam", "Rest of Southern Africa", "RomBul", "Russia", "Saudi Arabia", "Scandinavia", "South Africa", "Turkey", "UK", "Ukraine", "USA", "Visegrad", "West Africa"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Sub-Region picklist"
  else
    writeFailure "expected values are not visible in Client Sub-Region picklist"
  end
end

Then(/^I should see Client Invoice Date field with read and write permission$/) do
  if page.has_field?("Client Invoice Date")
    puts  "Client Invoice Date field is visible with editable permission"
  elsif page.has_content?('Client Invoice Date')
    writeFailure "Client Invoice Date field is visible with readable permission"
  else
    writeFailure "Client Invoice Date field is not visible"
  end
end

Then(/^I should see PO Required field with read and write permission$/) do
  if page.has_field?("00N4100000IJIT9")
    puts  "PO Required field is visible with editable permission"
  elsif page.has_content?('PO Required')
    writeFailure "PO Required field is visible with readable permission"
  else
    writeFailure "PO Required field is not visible"
  end
end

Then(/^I should see Expected PO Date field with read and write permission$/) do
  if page.has_field?("Expected PO Date")
    puts  "Expected PO Date field is visible with editable permission"
  elsif page.has_content?('Expected PO Date')
    writeFailure "Expected PO Date field is visible with readable permission"
  else
    writeFailure "Expected PO Date field is not visible"
  end
end

Then(/^I should see Business Line field with read and write permission$/) do
  if page.has_field?("Business Line")
    puts  "Business Line field is visible with editable permission"
  elsif page.has_content?('Business Line')
    writeFailure "Business Line field is visible with readable permission"
  else
    writeFailure "Business Line field is not visible"
  end
end

Then(/^I should verify Business Line field picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N4100000IJISi']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Maintenance Renewals","Other"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Business Line picklist"
  else
    writeFailure "expected values are not visible in Business Line picklist"
  end
end

Then(/^I should see Country field with read and write permission$/) do
  if page.has_field?("Country")
    puts  "Country field is visible with editable permission"
  elsif page.has_content?('Country')
    writeFailure "Country field is visible with readable permission"
  else
    writeFailure "Country field is not visible"
  end
end

Then(/^I should verify Country field picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N4100000IJISs']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Country picklist"
  else
    writeFailure "expected values are not visible in Country picklist"
  end
end


Then(/^I should not see Sales Target field in opportunity page layout$/) do
  if page.has_field?("Sales Target")
    writeFailure "Sales Target field is visible with editable permission"
  elsif page.has_content?('Sales Target')
    writeFailure "Sales Target field is visible with readable permission"
  else
    puts "Sales Target field is not visible"
  end
end

Then(/^I should not see Probability field in opportunity page layout$/) do
  if page.has_field?("opp12")
    writeFailure "Probability % field is visible with editable permission"
  elsif page.has_content?('Probability (%)')
    writeFailure "Probability % field is visible with readable permission"
  else
    puts "Probability % field is not visible"
  end
end

When(/^I click on manage renewals button$/) do
  #  .//*[@id='CF00N4100000PM9JO_ilecell']/div/a
  find(:xpath,"//input[@title='Manage Renewals']").click
  sleep 5
end

Then(/^I should see secondary owner field$/) do
  if page.has_field?("Secondary Owner")
    puts "Secondary Owner field is visible with editable permission"
  elsif page.has_content?('Secondary Owner')
    puts "Secondary Owner field is visible with readable permission"
  else
    writeFailure "Secondary Owner field is not visible"
  end
end


Then(/^I should see renewal target as "([^"]*)"$/) do |value|
  if page.has_content?(value)
    puts "#{value} section is visible"
  else
    writeFailure "#{value} content is not visible"
  end
end

Then(/^I should not see content "([^"]*)"$/) do |value|
  if page.has_content?(value)
    writeFailure "#{value} section is visible"
  else
    puts "#{value} content is not visible"
  end
end

Then(/^I should not see "([^"]*)" field$/) do |value|
  if page.has_field?(value)
    writeFailure "#{value} field is visible"
  else
    puts "#{value} field is notvisible"
  end
end


When(/^I enter data to required fields under new opportunity section for sales ops$/) do
   
end

#When(/^I search existing opportunity and click$/) do
#  fill_in("phSearchInput", :with=> "Smoke_test_opportinity_3495")
#  sleep 5
#  find(:xpath,".//*[@id='phSearchButton']").click
#  sleep 5
#  click_on "Smoke_test_opportinity_3495"
#  sleep 10
#end

When(/^I click on edit product under products list$/) do
  #  within all('pbBody')[1] do
  #      table=all("tbody")[0]
  #    table.all('tr')[1].all('td')[0].find(:xpath,"").click
  #    sleep 5
  #  end
  find(:xpath,"//a[@title='Edit - Record 1 - smoke-test-product-002']").click
  sleep 5
end

Then(/^I should see Renewable Line Item Id field$/) do
  if page.has_field?("Renewable Line Item ID")
    puts "Renewable Line Item ID field is visible with editable permission"
  elsif page.has_content?('Renewable Line Item ID')
    puts "Renewable Line Item ID field is visible with readable permission"
  else
    writeFailure "Renewable Line Item ID field is not visible"
  end
end

Then(/^I should see Opportunity Product ID field$/) do
  if page.has_field?("Opportunity Product ID")
    puts "Opportunity Product ID field is visible with editable permission"
  elsif page.has_content?('Secondary Owner')
    puts "Opportunity Product ID field is visible with readable permission"
  else
    writeFailure "Opportunity Product ID field is not visible"
  end
end

Then(/^I should see Upsell Cross\-sell field$/) do
  if page.has_field?("00N4100000PMDok")
    puts "Upsell Cross-sell field is visible with editable permission"
  elsif page.has_content?('Upsell / Cross-sell')
    puts "Upsell Cross-sell field is visible with readable permission"
  else
    writeFailure "Upsell Cross-sell field is not visible"
  end
end

Then(/^I should verify Upsell Cross\-sell picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N4100000PMDok']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Up-Sell","Cross-Sell"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Upsell Cross-sell picklist picklist"
  else
    writeFailure "expected values are not visible in Upsell Cross-sell picklist"
  end
end

Then(/^I click on new quote button under quotes section$/) do
  sleep 2
  click_on "New Quote"
end

Then(/^I enter value to mandatory fields under new quote section$/) do
  sleep 2
  randomvalue=('aaaaa'..'zzzzz').to_a.sample
  newquote =  "Smoke_test_quotes-" + randomvalue
  if page.has_field?("Quote Name")
    fill_in("Quote Name", :with=> newquote)
  else
    writeFailure "Quote Name field is not available"
  end
  if page.has_field?("00N4100000IJIVr")
    select("Direct", :from => "00N4100000IJIVr")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N4100000IJIVq")
    select("1", :from => "00N4100000IJIVq")
  else
    writeFailure "Quote Type Year field is not available"
  end
end

Then(/^I click on add line items button under quote line items section$/) do
  sleep 3
  click_on "Add Line Item"
end

Then(/^I select existing product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("test")
  sleep 2
  page.find(:id, "save_filter_PricebookEntry").click
  sleep 5
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[0].click
    puts "opportunity is selected"
  end
end

Then(/^I clik on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

Then(/^I note the product name under add quote line items to section$/) do
  within('.genericTable') do
    table=all('tbody')[0]
    $product_name = table.all('tr')[4].all('th')[0].text
    puts "Selected Product Name is: #{$product_name}"
  end
end

Then(/^I check that new line items added is be visible under products related list$/) do
  within all('.pbBody')[1] do
    sleep 5
    if find_link($product_name).visible?
      puts "The new line items added is visible under products related list"
    else
      writeFailure "The new line items added is not visible under products related list"
    end
  end
end

Then(/^I enter start date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaQ01u36000003tyl8")
    fill_in("00N3600000PFBaQ01u36000003tyl8", :with=> "11/7/2016")
  else
    writeFailure "Start Date field is not present"
  end
end

Then(/^I enter end date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaM01u36000003tyl8")
    fill_in("00N3600000PFBaM01u36000003tyl8", :with=> "11/7/2018")
  else
    writeFailure "End Date field is not present"
  end
end

Then(/^I enter quantity field value$/) do
  sleep 2
  if page.has_field?("Quantity")
    fill_in("Quantity", :with=> "100")
  else
    writeFailure "Quantity field is not present"
  end
end

When(/^I click on sync button$/) do
  find(:xpath,"//*[@id='syncQuoteOverlay_buttons']/input[1]").click
  sleep 5
end

When(/^I click on done button$/) do
  find(:xpath,".//*[@id='syncQuoteOverlay_buttons']/input").click
  sleep 5
end

Then(/^I enter sales price field value$/) do
  sleep 2
  if page.has_field?("UnitPrice01u36000003tyl8")
    fill_in("UnitPrice01u36000003tyl8", :with=> "100")
  else
    writeFailure "sales price field is not present"
  end
end

Then(/^I select value from batch type field$/) do
  sleep 2
  if page.has_field?("00N3600000PFBi501u36000003tyl8")
    select("Renewal", :from => "00N3600000PFBi501u36000003tyl8")
  else
    writeFailure "batch type field is not available"
  end
end

Then(/^I click on "([^"]*)" button under add quote line items to page$/) do |button_name|
  within('.genericTable') do
    sleep 2
    click_on(button_name, match: :first)
  end
end

Then(/^I click on "([^"]*)" button$/) do |button_name|
  sleep 5
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  sleep 10
  within("div#syncQuoteOverlay_buttons") do #within("div#syncQuoteOverlay_buttons") --> id is used inside within
    sleep 5
    click_on(button_name)
  end
  page.driver.browser.switch_to.window(main)
end

Then(/^I click on opportunity name link$/) do
  within all('.pbSubsection')[0] do
    sleep 4
    puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
    page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
    sleep 5
  end
end

Then(/^I enter data to all mandatory fields under renewable line item$/) do
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Existing Product Lookup (New Window)']").click
  sleep 2
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
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Owner Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  if (ENV['UserRole'] == "SchneiderOperationManagerSit") || (ENV['UserRole'] == "SchneiderOperationRepSit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "SchneiderSalesManagerSit") || (ENV['UserRole'] == "SchneiderSalesRepSit") || (ENV['UserRole'] == "SchneiderSalesOperationSit")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "SchneiderAdmin")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 2
    if (ENV['UserRole'] == "SchneiderOperationManagerSit")
      click_on "Operations Manager Schneider"
      puts "assigned to Operations Manager Schneider"
      sleep 2
    else if (ENV['UserRole'] == "SchneiderOperationRepSit")
        click_on "Operations Rep Schneider"
        puts "assigned to Operations Rep Schneider"
        sleep 2
      else if (ENV['UserRole'] == "SchneiderSalesManagerSit")
          click_on "Sales Manager Schneider"
          puts "assigned to Sales Manager Schneider"
          sleep 2
        else if (ENV['UserRole'] == "SchneiderSalesRepSit")
            click_on "Sales Rep Schneider"
            puts "assigned to Sales Rep Schneider"
            sleep 2
          else if (ENV['UserRole'] == "SchneiderAdmin")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "SchneiderSalesOperationSit")
                click_on "Sales Ops Alcon"
                puts "assigned to Sales Ops Schneider"
                sleep 2
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  
  within('.pbSubsection') do
    if page.has_field?("Existing Start Date")
      fill_in("Existing Start Date",:with => "10/3/2016")
      puts "value for Existing Start Date field is entered"
    else
      puts "Existing Start Date field is not available"
    end
    if page.has_field?("New Start Date")
      fill_in("New Start Date",:with => "11/3/2016")
      puts "value for New Start Date field is entered"
    else
      puts "New Start Date field is not available"
    end
    if page.has_field?("Quantity")
      fill_in("Quantity",:with => "10")
      puts "value for Quantity field is entered"
    else
      puts "Quantity field is not available"
    end
    if page.has_field?("Existing End Date")
      fill_in("Existing End Date",:with => "11/3/2016")
      puts "value for Existing End Date field is entered"
    else
      puts "Existing End Date field is not available"
    end
    if page.has_field?("New End Date")
      fill_in("New End Date",:with => "11/3/2016")
      puts "value for New End Date field is entered"
    else
      puts "New End Date field is not available"
    end
    if page.has_field?("Previous Price")
      fill_in("Previous Price",:with => "20")
      puts "value for Previous Price field is entered"
    else
      puts "Previous Price field is not available"
    end
  end
end


Then(/^I click on "([^"]*)" button under renewable line item section$/) do |button_name|
  sleep 3
  within all('.pbHeader')[2] do
    click_on button_name
  end
end

Then(/^I click on renewal opportunity link$/) do
  sleep 3
  puts page.find(:xpath, "//*[@id='CF00N4100000PM9JO_ilecell']/div/a").text
  page.find(:xpath, "//*[@id='CF00N4100000PM9JO_ilecell']/div/a").click
  sleep 3
end

Then(/^I click on "([^"]*)" button in renewable line item section$/) do |button_name|
  within('.pbHeader') do
    click_on button_name
  end
end

Then(/^I select any existing product line on the list$/) do
  page.find(:xpath, ".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
end

Then(/^I click on renewal status button$/) do  
  page.find(:xpath, ".//*[@id='updateRRStatus']").click
end

Then(/^I check that existing contract number field is visible$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?("Existing Contract Number")
      puts "Existing Contract Number field is visible"
    else
      writeFailure "Existing Contract Number field is not visible"
    end
  end
end

Then(/^I check that SSI Result Reason field is visible$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?("SSI Result Reason")
      puts "SSI Result Reason field is visible"
    else
      writeFailure "SSI Result Reason field is not visible"
    end
  end
end

Then(/^I check the SSI Result Reason picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("SSI Result Reason")
      puts "SSI Result Reason field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'SSI Result Reason')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["SSI_Result_Reason"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "SSI Result Reason picklist is not present"
    end
  end
end


Given(/^I should navigate to opportunity tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 40
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 20
  find(:xpath,".//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 15
end

Then(/^I should see Business Line picklist values$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000PW6mo']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Energy","ITB"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in business line picklist"
  else
    writeFailure "expected values are not visible in business line picklist"
  end
end

Then(/^I should see Client Sales Stage picklist values$/) do
  if page.has_field?("Client Sales Stage")
    puts "Client Sales Stage field is visible"
    actualvalues =find_field('Client Sales Stage').all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Cataract","Vitreoretinal","Refractive","LenSx"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in product line picklist"
    else
      writeFailure "expected values are not visible in product line picklist"
    end
  else
    writeFailure "Client Sales Stage field is not visible"
  end
end

Then(/^I should see Client Territory picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PW6mt']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","USA","EMEA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Territory picklist"
  else
    writeFailure "expected values are not visible in Client Territory picklist"
  end
end

Then(/^I should see First Quote Delivered Date field$/) do
  if page.has_field?("SSI Result Reason")
    puts "SSI Result Reason field is visible"
  else
    writeFailure "SSI Result Reason field is not visible"
  end
end

Then(/^I should see nsight Reason picklist field$/) do
  if page.has_field?("Insight Reason")
    puts "Insight Reason field is visible"
  else
    writeFailure "Insight Reason field is not visible"
  end
end

When(/^I select "([^"]*)" from stage picklist$/) do |value|
  select(value, :from => 'opp11')
  sleep 5
end

Then(/^I should see nsight reason picklist field with read and write permission$/) do
  if page.has_field?("00N3600000PW6nb")
    select('Awaiting NS/HA', :from => '00N3600000PW6nb')
    sleep 5
    puts "nsight reason picklist field with read write permission"
  elsif page.has_content?("Insight Reason")
    writeFailure "Insight Reason field is with read only permission"
  else
    writeFailure "Insight Reason field is not visible"
  end
end


Then(/^I should see Agreement Number field$/) do
  if page.has_field?("00N3600000PW6ns")
    puts "Agreement Number field is visible"
  else
    writeFailure "Agreement Number field is not visible"
  end
end

Then(/^I should see Agreement Name field$/) do
  if page.has_field?("00N3600000PW6nt")
    puts "Agreement Name field is visible"
  else
    writeFailure "Agreement Name field is not visible"
  end
end

Then(/^I should see Existing PO Number field$/) do
  if page.has_field?("00N3600000PW6nu")
    puts "Existing PO Number field is visible"
  else
    writeFailure "Existing PO Number field is not visible"
  end
end

Then(/^I should see New Contract Number field$/) do
  if page.has_field?("00N3600000PW6nv")
    puts "New Contract Number field is visible"
  else
    writeFailure "New Contract Number field is not visible"
  end
end

Then(/^I should see Forecasting Status field$/) do
  if page.has_field?("SSI Result Reason")
    puts "SSI Result Reason field is visible"
  else
    writeFailure "SSI Result Reason field is not visible"
  end
end

Then(/^I should see Quoting Status field$/) do
  if page.has_field?("SSI Result Reason")
    puts "SSI Result Reason field is visible"
  else
    writeFailure "SSI Result Reason field is not visible"
  end
end

Then(/^I should see Contacted Status field$/) do
  if page.has_field?("SSI Result Reason")
    puts "SSI Result Reason field is visible"
  else
    writeFailure "SSI Result Reason field is not visible"
  end
end

Then(/^I should see boop converted value text field$/) do
  if page.has_field?("Boop Converted Value")
    puts "Boop Converted Value field is visible"
  else
    writeFailure "Boop Converted Value field is not visible"
  end
end

Then(/^I should see boop status picklist field$/) do
  if page.has_field?("00N3600000PW6nc")
    puts "Boop Status field is visible"
    actualvalues =find(:xpath,".//*[@id='00N3600000PW6nc']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Cancelled","Lost","Pending","Won"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in boop status picklist"
    else
      writeFailure "expected values are not visible in boop status picklist"
    end
  else
    writeFailure "Boop Status field is not visible"
  end
end

Then(/^I should see boop created date field$/) do
  if page.has_field?("00N3600000PW6nP")
    puts "boop created date field is visible"
  else
    writeFailure "boop created date field is not visible"
  end
end

Then(/^I should see "([^"]*)" field with read only permission$/) do |value|
  if page.has_content?(value)
    puts "#{value} field is visible with read only permission"
  else
    writeFailure "#{value} field is not visible"
  end
end


Then(/^I should verify Lead Source field with default value$/) do
  if page.has_select?("lea5", :selected => "ODS")
    puts "Lead Source field with default value ods"
  else
    writeFailure "Lead Source field is not visible"
  end
end

Then(/^I should verify Client Region field with default value$/) do
  if page.has_select?("00N3600000PW6mr", :selected => "EMEA")
    puts "Client Region field with default value Emea"
  else
    writeFailure "Client Region field is not visible"
  end
end

Then(/^I should verify Country field with default value$/) do
  if page.has_select?("00N3600000PW6my", :selected => "United Kingdom")
    puts "Country field with default value United Kingdom"
  else
    writeFailure "Country field is not visible"
  end
end

Then(/^I should verify Engagement Type field with default value$/) do
  if page.has_select?("00N3600000PW6n2", :selected => "SREV")
    puts "Engagement Type field with default value SREV"
  else
    writeFailure "Engagement Type field is not visible"
  end
end

Then(/^I should verify Opportunity Type field with default value$/) do
  if page.has_select?("00N41000009vTdG", :selected => "Volume")
    puts "Opportunity Type field with default value Volume"
  else
    writeFailure "Opportunity Type field is not visible"
  end
end

Then(/^I should verify SSI Threatre field with default value$/) do
  if page.has_select?("00N41000009vTdR", :selected => "EMEA")
    puts "SSI Threatre field with default value ods"
  else
    writeFailure "SSI Threatre field is not visible"
  end
end

Then(/^I should verify Opportunity Currency field with default value$/) do
  if page.has_select?("Opportunity Currency", :selected => "GBP")
    puts "Opportunity Currency field with default value ods"
  else
    writeFailure "Opportunity Currency field is not visible"
  end
end


Then(/^I should see Solution Provider field$/) do
  if page.has_field?("00N3600000PW6nz")
    puts "Solution Provider field is visible"
  else
    writeFailure "Solution Provider field is not visible"
  end
end

Then(/^I should see DealID field with read only permission$/) do
  if page.has_field?("00N41000009vTcy")
    writeFailure "DealID field with read write permission"
  elsif page.has_content?("Deal ID")
    puts "DealID field with read only permission"
  else
    writeFailure "DealID field is not visible"
  end
end

Then(/^I should see Expected Product Amount field with read write permission$/) do
  if page.has_field?("Expected Product Amount")
    puts "Expected Product Amount field is visible with read write permission"
  else
    writeFailure "Expected Product Amount field is not visible"
  end
end

Then(/^I should see Expected Service Amount field with read only permission$/) do
  if page.has_field?("00N3C000000L0pa")
    writeFailure "Expected Service Amount field with read write permission"
  elsif page.has_content?("Expected Service Amount")
    puts "Expected Service Amount field with read only permission"
  else
    writeFailure "Expected Service Amount field is not visible"
  end
end

Then(/^I should see Fiscal Period field with read only permission$/) do
  if page.has_field?("00N41000009vTcz")
    writeFailure "Fiscal Period field with read write permission"
  elsif page.has_content?("Fiscal Period")
    puts "Fiscal Period field with read only permission"
  else
    writeFailure "Fiscal Period field is not visible"
  end
end

Then(/^I should see Fiscal Month field with read only permission$/) do
  if page.has_field?("00N41000009vTd1")
    writeFailure "Fiscal Month field with read write permission"
  elsif page.has_content?("Fiscal Month")
    puts "Fiscal Month field with read only permission"
  else
    writeFailure "Fiscal Month field is not visible"
  end
end

Then(/^I should see Fiscal Year field with read only permission$/) do
  if page.has_field?("00N41000009vTd0")
    writeFailure "Expected Service Amount field with read write permission"
  elsif page.has_content?("Fiscal Year")
    puts "Fiscal Year field with read only permission"
  else
    writeFailure "Fiscal Year field is not visible"
  end
end

Then(/^I should see Contract Number field with read write permission$/) do
  if page.has_field?("00N41000009vTdB")
    puts "Contract Number field is visible with read write permission"
  else
    writeFailure "Contract Number field is not visible"
  end
end

Then(/^I should see Client Sales Stage field with read write permission$/) do
  if page.has_field?("00N41000009vTc6")
    puts "Client Sales Stage field is visible with read write permission"
  else
    writeFailure "Expected Product Amount field is not visible"
  end
end

Then(/^I should verify Client Sales Stage picklist value$/) do

end

Then(/^I should see Client Created Date field with read only permission$/) do
  if page.has_field?("00N3C000000L0pk")
    writeFailure "Client Created Date field with read write permission"
  elsif page.has_content?("Client Created Date")
    puts "Client Created Date field with read only permission"
  else
    writeFailure "Client Created Date field is not visible"
  end
end

Then(/^I should see Partner Account field with read write permission$/) do
  if page.has_field?("Expected Product Amount")
    puts "Partner Account field is visible with read write permission"
  else
    writeFailure "Partner Account field is not visible"
  end
end

Then(/^I should see Promo Available field with read write permission$/) do
  if page.has_field?("00N41000009vTcT")
    puts "Promo Available field is visible with read write permission"
  else
    writeFailure "Promo Available field is not visible"
  end
end

Then(/^I should see Level (\d+) Territory field with read write permission$/) do |value|
  puts value
  if "01" == value
    if page.has_field?("CF00N3C000000LBma")
      puts "Level 01 Territory field is visible with read write permission"
    else
      writeFailure "Level 01 Territory field is not visible"
    end
  elsif value == "02"
    if page.has_field?("CF00N3C000000LBmX")
      puts "Level 02 Territory field is visible with read write permission"
    else
      writeFailure "Level 02 Territory field is not visible"
    end
  elsif value == "03"
    if page.has_field?("CF00N3C000000LBmZ")
      puts "Level 03 Territory field is visible with read write permission"
    else
      writeFailure "Level 03 Territory field is not visible"
    end
  elsif value == "04"
    if page.has_field?("CF00N3C000000LBmV")
      puts "Level 04 Territory field is visible with read write permission"
    else
      writeFailure "Level 04 Territory field is not visible"
    end
  elsif value == "05"
    if page.has_field?("CF00N3C000000LBmW")
      puts "Level 05 Territory field is visible with read write permission"
    else
      writeFailure "Level 05 Territory field is not visible"
    end
  elsif value == "06"
    if page.has_field?("CF00N3C000000LBmY")
      puts "Level 06 Territory field is visible with read write permission"
    else
      writeFailure "Level 06 Territory field is not visible"
    end
  else
    writeFailure "Level Territory field is not visible"
  end
end

Then(/^I should see Offer Type field with read write permission$/) do
  if page.has_field?("Expected Product Amount")
    puts "Expected Product Amount field is visible with read write permission"
  else
    writeFailure "Expected Product Amount field is not visible"
  end
end

Then(/^I should verify Offer Type picklist value$/) do
  if page.has_field?("00N41000009vTcq")
    puts "Offer Type field is visible"
    actualvalues =find(:xpath,".//*[@id='00N41000009vTcq']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","APIC","Network Security","DCI","Big Data","Contact Center","SP Wireless & Mobility","IWAN","SAP HANA","HCS","Stadium Vision","RE","vMS"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Offer Type picklist"
    else
      writeFailure "expected values are not visible in Offer Type picklist"
    end
  else
    writeFailure "Offer Type field is not visible"
  end
end

Then(/^I should verify Business Line picklist value$/) do
  if page.has_field?("00N41000009vTc2")
    puts "Business Line field is visible"
    actualvalues =find(:xpath,".//*[@id='00N41000009vTc2']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","SSPT","TSA","Cisco 1"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Business Line picklist"
    else
      writeFailure "expected values are not visible in Business Line picklist"
    end
  else
    writeFailure "Business Line field is not visible"
  end
end

Then(/^I should verify SSI Theatre picklist value$/) do
  if page.has_field?("00N41000009vTdR")
    puts "SSI Theatre field is visible"
    actualvalues =find(:xpath,".//*[@id='00N41000009vTdR']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["NALA"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in SSI Theatre picklist"
    else
      writeFailure "expected values are not visible in SSI Theatre picklist"
    end
  else
    writeFailure "SSI Theatre field is not visible"
  end
end