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

When(/^I click on manage renewals button under renewable line item$/) do
  find(:xpath,"//input[@title='Manage Renewals']").click
  sleep 10
end

When(/^I click on rebuild opportunity link$/) do
  find(:xpath,".//*[@id='rebuildRRtoOLI']").click
  sleep 10
end

When(/^I click on edit product under products list$/) do
  find(:xpath,"//a[@title='Edit - Record 1 - Smoke Test Product']").click
  sleep 15
end

Then(/^I should see business line picklist values$/) do
  if page.has_field?('Business Line')
    actualvalues =find(:xpath,".//*[@id='00N4100000E1rEO']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Core","NAMED","Core (Non-billable)","NAMED (Non-billable)"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in business line picklist"
    else
      writeFailure "expected values are not visible in business line picklist"
    end
  else
    writeFailure 'business line field is not visible'
  end
end

Then(/^I should see Opportunity Type picklist values$/) do
  if page.has_field?('Opportunity Type')
    actualvalues =find(:xpath,".//*[@id='00N4100000E1rFc']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Enterprise","Enterprise Parent","Tech Refresh","Tech Refresh (Recovered)","Volume Parent","Volume"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Opportunity Type picklist"
    else
      writeFailure "expected values are not visible in Opportunity Type picklist"
    end
  else
    writeFailure 'Opportunity Type field is not visible'
  end
end


When(/^I should verify Batch Type picklist values$/) do
  if page.has_field?('Batch Type')
    actualvalues =find(:xpath,".//*[@id='00N4100000E1rFx']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Renewal","New","Expired","Adds/Recovery Expired","Adds/Recovery Renewal","Adds/Recovery Uncovered","Adds/Recovery Warranty","Renewals - Late Data","IBOW","Campaign"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Batch Type picklist"
    else
      writeFailure "expected values are not visible in Batch Type picklist"
    end
  else
    writeFailure 'Batch Type field is not visible'
  end
end

Then(/^I should see Renewal Status picklist values$/) do
  if page.has_field?('Renewal Status')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:7:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","CS - Renewed at Par - R@P","CS - Backdated - BKD","CS - Co-term Long - CTL","CS - Co-term Short - CTS","CS - Discount - DIS","CS - Multi-year Advance - MYA","CS - Pricing Change - PRC","CS - Re-Cert Fee Included - RCT","CS - Service Downgrade - DNG","CS - Service Upgrade - UPG","CS - Uncovered - UNC","NS - Client Product Replacement - PTR","NS - Competitive DVAR - SCV","NS - Competitive Product Replacement - PCP","NS - Competitive Service Loss Other - SCS","NS - Customer Cost-Benefit Decision - SCB","NS - Customer No Longer Exists - RNE","NS - Customer Satisfaction Driven - SSD","NS - End of Service Life - PEL","NS - End User Unkown - UEU","NS - Other Data Management - RDM","NS - Product Decommissioned - PPD","NS - Third Party Maintenance - SPM","NS - Unresponsive End User - REU","NS - Unresponsive VAR - RUV","NS - VAR No Service - RVN","NS - VAR No Service - DVN","HA - Bad Data - BDT","HA - Cancelled - CNL","HA - Covered - COV","HA - Duplicate - DUP","HA - End Of Support - EOL","HA - Evergreen Billing - EVG","HA - International - INT","HA - International APAC","HA - International EMEA","HA - International NALA","HA - Lease - LEA","HA - OEM Customer - OEM","HA - Other - OTH","HA - Product Return - PRT","HA - Sales Pull Back - SPB","Open"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Renewal Status picklist"
    else
      writeFailure "expected values are not visible in Renewal Status picklist"
    end
  else
    writeFailure 'Renewal Status field is not visible'
  end
end

Then(/^I should see Renewal Type picklist values$/) do
  if page.has_field?('Renewal Type')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:17:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Renewal","Initial"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Renewal Type picklist"
    else
      writeFailure "expected values are not visible in Renewal Type picklist"
    end
  else
    writeFailure 'Renewal Type field is not visible'
  end
end

Then(/^I should see Discount Status picklist values$/) do
  if page.has_field?('Discount Status')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:16:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Non-Standard Pricing","Unity Pricing"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Discount Status picklist"
    else
      writeFailure "expected values are not visible in Discount Status picklist"
    end
  else
    writeFailure 'Discount Status field is not visible'
  end
end

Then(/^I should see Country picklist values$/) do
  if page.has_field?('Country')
    actualvalues =find(:xpath,".//*[@id='00N4100000E1rEY']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Country picklist"
    else
      writeFailure "expected values are not visible in Country picklist"
    end
  else
    writeFailure 'Country field is not visible'
  end
end

Then(/^I should see Licenses field or coloumn under product related list$/) do
  if page.has_xpath?(".//*[@id='0064B000004rsT4_RelatedLineItemList_body']/table/tbody/tr[1]/th[contains(text(),'Licenses')]")
      puts "Licenses field or coloumn is visible"
  else
    writeFailure "Licenses field or coloumn is not visible"
  end
end

Then(/^I should see "([^"]*)" field or coloumn under Renewable Line Items related list$/) do |value|
  if page.has_xpath?(".//*[@id='0064B000004rsT4_00N4100000IudXz_body']/table/tbody/tr[1]/th[contains(text(),'BJN Discount')]")
      puts "BJN Discount field or coloumn is visible"
  else
    writeFailure "BJN Discount field or coloumn is not visible"
  end
end


Then(/^I should not see "([^"]*)" field or coloumn under product related list$/) do |value|
  if page.has_xpath?(".//*[@id='0064B000004rsT4_RelatedLineItemList_body']/table/tbody/tr[1]/th[contains(text(),'Quantity')]")
      writeFailure "Quantity field or coloumn is visible"
  else
    puts "Quantity field or coloumn is not visible"
  end
end

When(/^I click on existing opportunity product edit button$/) do
  find(:xpath,".//a[@title='Edit - Record 1 - smoke-test-product-123']").click
  sleep 10
end

When(/^I fill discount as "([^"]*)"$/) do |value|
  fill_in("Discount", :with=> "100")
end

Then(/^I should see Model picklist values$/) do
  if page.has_field?('Model')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:16:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Annual","Month","Specific Months","Subscription Term"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Model picklist"
    else
      writeFailure "expected values are not visible in Model picklist"
    end
  else
    writeFailure 'model field is not visible'
  end
end

Then(/^I should see period picklist values$/) do
  if page.has_field?('Period')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:15:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Annual","Month","Specific Months","Subscription Term"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in period picklist"
    else
      writeFailure "expected values are not visible in period picklist"
    end
  else
    writeFailure 'period field is not visible'
  end
end

Then(/^I should see Type picklist values$/) do
  if page.has_field?('Type')
    actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:14:j_id32']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","One-Time","Recurring","Usage"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Type picklist"
    else
      writeFailure "expected values are not visible in Type picklist"
    end
  else
    writeFailure 'Type field is not visible'
  end
end

Then(/^I should see UOM picklist values$/) do
  if page.has_field?('UOM')
  actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:13:j_id32']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","AttendeeHour","Attendees","ConcurrentAryakaPorts","ConcurrentPorts","Dialout-Minutes","EventAssistHours","Events","ExtendedCapacityMeeting","ExtraAryakaPorts","ExtraParticipantMinutes","ExtraPorts","HuddleRoom","MeetingAssistHours","Minutes","NoOfEmployees","ParticipantHour","PSTN-Australia","PSTN-Brazil","PSTN-China","PSTN-Columbia","PSTN-Egypt","PSTN-France","PSTN-Germany","PSTN-Hungary","PSTN-India","PSTN-India-Domestic","PSTN-Indonesia","PSTN-Israel","PSTN-Jordan","PSTN-Malaysia","PSTN-Philippines","PSTN-Qatar","PSTN-Russia","PSTN-SaudiArabia","PSTN-SouthKorea","PSTN-Taiwan","PSTN-Thailand","PSTN-TOLL","PSTN-Turkey","PSTN-UAE","PSTN-UK","PSTN-Ukraine","PSTN-US","PSTN-US-Test","PSTN-Vietnam","Users"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in UOM picklist"
  else
    writeFailure "expected values are not visible in UOM picklist"
  end
  else
    writeFailure 'UOM field is not visible'
  end
end

Then(/^I should see Client Region picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000E1rER']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","ANZ","ASKI","BENELUX","CENTRAL","EASTERN","GRC","ISRAEL","MEA","NON-EMEA","NORDIC","PRC","SOUTH EUROPE","STRATEGIC","UK & IRELAND","USA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Region picklist"
  else
    writeFailure "expected values are not visible in Client Region picklist"
  end
end

Then(/^I should see Client sales stage picklist values$/) do
   actualvalues =find(:xpath,".//*[@id='00N4100000E1rES']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Not Contacted","Contacted","Quote Delivered","Quote Request","Quote Completed","Commitment","PO Received","Credit Hold","Revised PO","Closed","No Service","House Account"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client sales stage picklist"
  else
    writeFailure "expected values are not visible in Client sales stage picklist"
  end
end

Then(/^I should see Forecast picklist values$/) do
actualvalues =find(:xpath,".//*[@id='00N4100000E1rFC']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Yes","Upside","Not Forecasted","End User","Reseller","Distributor","Client","Third Party","SSI","Top Deal","Recertification Fee"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Forecast picklist"
  else
    writeFailure "expected values are not visible in Forecast picklist"
  end
end

Then(/^I should see Direct\/Channel picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N4100000E1rEb']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Direct","Channel Tier 1","Channel Tier 2"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in direct channel picklist"
  else
    writeFailure "expected values are not visible in direct channel picklist"
  end
end

When(/^I enter data to required fields under new opportunity section for sales ops$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "Smoke-test-opportinity-"+ Random.new.rand(1..20000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "opportunity name is: #{$opp_name}"
    sleep 2
    if page.has_field?("opp11")
      select("Contacted", :from => "opp11")
      puts "value for stage field is selected"
    else
      puts "stage field is not available"
    end
    sleep 2
    if page.has_field?("opp9")
      fill_in("opp9",:with => "5/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-accounts-")
  sleep 5
  find_button('Go!').click
  sleep 5
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 5
end

Then(/^I should see forcasting status as "([^"]*)"$/) do |value|
  if page.has_xpath?('//*[*[contains(text(),"Forecasting Status")]]/td[4]/div[contains(text(),"'"#{value}"'")]')
    puts "Forecasting Status = #{value}"
  else
    writeFailure "Forecasting Status not contains #{value}"
  end
end

Then(/^I should see Contacted Status as "([^"]*)"$/) do |value|
  if page.has_xpath?('//*[*[contains(text(),"Contacted Status")]]/td[4]/div[contains(text(),"'"#{value}"'")]')
    puts "Contacted Status = #{value}"
  else
    writeFailure "Contacted Status not contains #{value}"
  end
end

Then(/^I should see Quoting Status as "([^"]*)"$/) do |value|
  if page.has_xpath?('//*[*[contains(text(),"Quoting Status")]]/td[4]/div[contains(text(),"'"#{value}"'")]')
    puts "Quoting Status = #{value}"
  else
    writeFailure "Quoting Status not contains #{value}"
  end
end


When(/^I click on edit button on opportunity product$/) do
  within all('.pbBody')[1] do
    table=all("tbody")[0]
    all('tr')[1].all('td')[0].all('a')[0].click
    sleep 5
  end
end

Then(/^I should see Local Currency Code field with default value as "([^"]*)"$/) do |value|
  if page.has_select?("00N3600000PW6oP", :selected => value)
    puts "Local Currency Code field with default value #{value}"
  else
    writeFailure "Lead Source field is visible with different value"
  end
end

Then(/^I should see Upsell Cross sell field$/) do
  if page.has_field?("00N3600000PW6oY")
    puts "Upsell Cross sell field is visible"
  else
    writeFailure "Upsell Cross sell field is not available"
  end
end

Then(/^I should verify Upsell Cross sell field picklist values$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000PW6oY']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Upsell","Cross-Sell"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Upsell Cross sell picklist"
  else
    writeFailure "expected values are not visible in Upsell Cross sell picklist"
  end
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "smoke-test-opportunity-2-222"
  sleep 10
end

Then(/^I click on new quote button under quotes section$/) do
  sleep 2
  click_on "New Quote"
end

Then(/^I enter value to mandatory fields under new quote section$/) do
  sleep 2
  if page.has_field?("Quote Name")
    randomvalue=('0001'..'9999').to_a.sample
    fill_in("Quote Name", :with=> "Smoke_test_quotes-#{randomvalue}")
  else
    writeFailure "Quote Name field is not available"
  end
  if page.has_field?("00N4100000Iuh6i")
    select("Direct", :from => "00N4100000Iuh6i")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N4100000Iuh6h")
    select("1", :from => "00N4100000Iuh6h")
  else
    writeFailure "Quote Type Year field is not available"
  end
end

Then(/^I click on add line items button under quote line items section$/) do
  sleep 3
  click_on "Add Line Item"
  sleep 5
end

Then(/^I select existing product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("smoke-test-product")
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
  if page.has_field?("Quantity01u360000055wwq")
    fill_in("Quantity01u360000055wwq", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
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
  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesOperationSit")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Admin")
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
    if (ENV['UserRole'] == "OperationManagerSit")
      click_on "Operations Manager EMEA Extreme"
      puts "Operations Manager EMEA Extreme"
      sleep 2
    else if (ENV['UserRole'] == "OperationRepSit")
        click_on "Operations Manager EMEA Extreme"
        puts "assigned to Operations Manager EMEA Extreme"
        sleep 2
      else if (ENV['UserRole'] == "SalesManagerSit")
          click_on "Sales Manager APAC Extreme Networks"
          puts "assigned to Sales Manager APAC Extreme Networks"
          sleep 2
        else if (ENV['UserRole'] == "SalesRepSit")
            click_on "Sales Manager APAC Extreme Networks"
            puts "assigned to Sales Manager APAC Extreme Networks"
            sleep 2
          else if (ENV['UserRole'] == "Admin")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "SalesOperationSit")
                click_on "Sales Manager APAC Extreme Networks"
                puts "assigned to Sales Ops 1PF5"
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
    if page.has_field?("j_id0:theFrm:pageBlockId:j_id29:j_id31:1:j_id32")
      fill_in("j_id0:theFrm:pageBlockId:j_id29:j_id31:1:j_id32",:with => "10")
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
  find(:xpath,"//input[@title='New Renewable Line Item']").click
  sleep 15
end

Then(/^I click on renewal opportunity link$/) do
  sleep 3
  page.find(:xpath, ".//*[@id='lookup006n0000003sVXu00N4100000PEZCQ']/a").click
  sleep 5
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
  sleep 30
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 30
  find(:xpath,".//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 30
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
  actualvalues =find(:xpath,".//*[@id='00N4100000E1rET']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","ANHUI","ASEAN","BEIJING","BENELUX","CENTRAL","CHONGQING","EASTERN","FUJIAN","GANSU","GRC/CYP","GUANGXI","GUIZHOU","HAINAN","HEBEI","HEILONGJIANG","HENAN","HONG KONG","HUBEI","HUNAN","ISRAEL","ITALY","JIANGSU","JIANGXI","JILIN","LIAONING","MACAU","MAGHREB","MEA","NEIMONGOL","NINGXIA","NORDIC","NORTHERN AUSTRALIA","QINGHAI","SAARC","SHAANXI","SHANDONG","SHANGHAI","SHANXI","SICHUAN","SOUTH AFRICA","SOUTH EUROPE","SOUTH PACIFIC","SOUTHERN AUSTRALIA","STRATEGIC","SUB SAHARAN AFRICA","TIANJIN","TIBET","TURKEY","UK & IRELAND","XINJIANG","YUNNAN","ZHEJIANG"]
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
  if page.has_field?("00N3600000PW6nI")
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
  if page.has_select?("00N3600000PW6o1", :selected => "Volume")
    puts "Opportunity Type field with default value Volume"
  else
    writeFailure "Opportunity Type field is not visible"
  end
end

Then(/^I should verify SSI Threatre field with default value$/) do
  if page.has_select?("00N3600000PW6oC", :selected => "EMEA")
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
  if page.has_field?("Solutions Provider")
    puts "Solution Provider field is visible"
  else
    writeFailure "Solution Provider field is not visible"
  end
end

Then(/^I should see Client Sales Stage field under insight reason field$/) do
  if page.has_select?("Client Sales Stage", :selected => "--None--")
    puts "Client Sales Stage field is visible"
  else
    writeFailure "Client Sales Stage field is not visible"
  end
end

Then(/^I should see "([^"]*)" field permission editable for all users except salesOPs$/) do |value|
  if page.has_field?(value)
    puts "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end