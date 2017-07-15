Then(/^I should see direct channel picklist under opportunity information$/) do
  if page.has_field?("Direct/Channel")
    writeFailure "Direct/Channel picklist field is editable"
  elsif page.has_content?('Direct/Channel')
    puts "Direct/Channel picklist field is visible with read only permission"
  else
    writeFailure "Direct/Channel picklist field is not visible"
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

Then(/^I should not see "([^"]*)" field$/) do |value|
  if page.has_field?(value)
    writeFailure "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    puts "#{value} field is not visible"
  end
end

When(/^I click on existing relationship id under renewable line item$/) do
  find(:xpath,".//a[@href='/a0fK0000004Ce1z']").click
  sleep 15
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "smoke-test-opportunity-2-222")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 10
  click_on "smoke-test-opportunity-2-222"
  sleep 20
end

Then(/^I enter data to all mandatory fields under renewable line item$/) do
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Existing Product Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 15
  find_button('Go!').click
  sleep 15
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

#  page.driver.browser.window_handles.first
#  main = page.driver.browser.window_handles.first
#  find("img[alt='Owner Lookup (New Window)']").click
#  sleep 25
#  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
#  lookup = page.driver.browser.window_handles.last
#  page.driver.browser.switch_to.frame("searchFrame")
#  sleep 15
#  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit")
#    fill_in("lksrch",:with=> "Operations")
#  else
#    if (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesOperationSit")
#      fill_in("lksrch",:with=> "Sales")
#    else
#      if (ENV['UserRole'] == "Admin")
#        fill_in("lksrch",:with=> "DSIntegration")
#      end
#    end
#  end
#  sleep 5
#  find_button('Go!').click
#  sleep 4
#  page.driver.browser.switch_to.window(lookup)
#  page.driver.browser.switch_to.frame("resultsFrame")
#  within('.pbBody') do
#    sleep 2
#    if (ENV['UserRole'] == "OperationManagerSit")
#      click_on "Operations Manager 1PF5"
#      puts "assigned to Operations Manager 1PF5"
#      sleep 2
#    else if (ENV['UserRole'] == "OperationRepSit")
#        click_on "Operations Rep 1PF5"
#        puts "assigned to Operations Rep 1PF5"
#        sleep 2
#      else if (ENV['UserRole'] == "SalesManagerSit")
#          click_on "Sales Manager 1PF5"
#          puts "assigned to Sales Manager 1PF5"
#          sleep 2
#        else if (ENV['UserRole'] == "SalesRepSit")
#            click_on "Sales Rep 1PF5"
#            puts "assigned to Sales Rep 1PF5"
#            sleep 2
#          else if (ENV['UserRole'] == "Admin")
#              click_on "DSIntegration Admin"
#              puts "assigned to DSIntegration Admin"
#              sleep 2
#            else if (ENV['UserRole'] == "SalesOperationSit")
#                click_on "Sales Ops 1PF5"
#                puts "assigned to Sales Ops 1PF5"
#                sleep 2
#              end
#            end
#          end
#        end
#      end
#    end
#  end
#  page.driver.browser.switch_to.window(main)
#  sleep 10

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
    if page.has_field?("Batch Type")
      select('Renewal', :from => 'Batch Type')
      puts "value for Batch Type field is entered"
    else
      puts "Batch Type field is not available"
    end
  end
end

Then(/^I should see Client Territory field as non mandantory field$/) do
  if page.has_xpath?("//tr[td[div[div[@class='requiredBlock']]]]/*[contains(.,'Client Territory')]")
    writeFailure "Client Territory field is a mandantory field"
  else
    puts "Client Territory field is not a mandantory field"
  end
end

When(/^I select "([^"]*)" from expected reason code$/) do |value|
  select(value, :from => 'Expected Reason Code')
  sleep 5
end

Then(/^I double click on stage and update to closed sale under opportunity detail$/) do
  sleep 5
  element = page.find(:xpath,"//*[@id='opp11_ilecell']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 5
  select "Closed Sale", :from => "opp11"
  sleep 5
  find(:xpath,".//*[@id='InlineEditDialog_buttons']/input[1]").click
  sleep 5
end

Then(/^I should verify Actual ARR Loss Amount field type should be editable for opsmanager and opsrep$/) do
  if ENV['UserRole'] == "opsmgrsit" || ENV['UserRole'] == "opsrepsit"
    if page.has_field?("Actual ARR Loss Amount")
      puts "Actual ARR Loss Amount field is visible with editable option"
    else
      writeFailure "Actual ARR Loss Amount field is not visible"
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual ARR Loss field type should be editable for opsmanager and opsrep$/) do
  if ENV['UserRole'] == "opsmgrsit" || ENV['UserRole'] == "opsrepsit"
    if page.has_field?("Actual ARR Loss")
      puts "Actual ARR Loss field is visible with editable option"
    else
      writeFailure "Actual ARR Loss field is not visible"
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual Loss Type field type should be editable for opsmanager and opsrep$/) do
  if ENV['UserRole'] == "opsmgrsit" || ENV['UserRole'] == "opsrepsit"
    if page.has_field?("Actual Loss Type")
      puts "Actual Loss Type field is visible with editable option"
    else
      writeFailure "Actual Loss Type field is not visible"
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual Reason Code field type should be editable for opsmanager and opsrep$/) do
  if ENV['UserRole'] == "opsmgrsit" || ENV['UserRole'] == "opsrepsit"
    if page.has_field?("Actual Reason Code")
      puts "Actual Reason Code field is visible with editable option"
    else
      writeFailure "Actual Reason Code field is not visible"
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Cancel Process Effective Date field type should be editable for opsmanager and opsrep$/) do
  if ENV['UserRole'] == "opsmgrsit" || ENV['UserRole'] == "opsrepsit"
    if page.has_field?("Cancel Process Effective Date")
      puts "Cancel Process Effective Date field is visible with editable option"
    else
      writeFailure "Cancel Process Effective Date field is not visible"
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual ARR Loss Amount field type should be read only for salesmanager salesrep and salesops$/) do
  if ENV['UserRole'] == "salesrepsit" || ENV['UserRole'] == "salesmgrsit" || ENV['UserRole'] == "salesopssit"
    if page.has_field?("Actual ARR Loss Amount")
      writeFailure "Actual ARR Loss Amount field is visible with editable option"
    elsif page.has_content?("Actual ARR Loss Amount")
      puts "Actual ARR Loss Amount field is visible with read only permission"
    else
      writeFailure "Actual ARR Loss Amount field is not visible "
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual Loss Type field type should be read only for salesmanager salesrep and salesops$/) do
  if ENV['UserRole'] == "salesrepsit" || ENV['UserRole'] == "salesmgrsit" || ENV['UserRole'] == "salesopssit"
    if page.has_field?("Actual Loss Type")
      writeFailure "Actual Loss Type field is visible with editable option"
    elsif page.has_content?("Actual Loss Type")
      puts "Actual Loss Type field is visible with read only permission"
    else
      writeFailure "Actual Loss Type field is not visible "
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Actual Reason Code field type should be read only for salesmanager salesrep and salesops$/) do
  if ENV['UserRole'] == "salesrepsit" || ENV['UserRole'] == "salesmgrsit" || ENV['UserRole'] == "salesopssit"
    if page.has_field?("Actual Reason Code")
      writeFailure "Actual Reason Code field is visible with editable option"
    elsif page.has_content?("Actual Reason Code")
      puts "Actual Reason Code field is visible with read only permission"
    else
      writeFailure "Actual Reason Code field is not visible "
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should verify Renewal Extension field visibility and type should be editable$/) do
  if ENV['UserRole'] == "salesopssit"
    if page.has_field?("Renewal Extension")
      writeFailure "Renewal Extension field is visible with editable option"
    elsif page.has_content?("Renewal Extension")
      puts "Renewal Extension field is visible with read only permission"
    else
      writeFailure "Renewal Extension field is not visible "
    end
  else
    if page.has_field?("Renewal Extension")
      puts "Renewal Extension field is visible with editable option"
    else
      writeFailure "Renewal Extension field is not visible "
    end
  end
end

Then(/^I should verify Renewal Extension picklist values$/) do
  if ENV['UserRole'] == "salesopssit"
    puts "Renewal Extension is readable"
  else
    if page.has_field?("Renewal Extension")
      actualvalues =find_field("Renewal Extension").all('option').collect(&:text)
      puts "actual values = #{actualvalues}"
      expectedvalues = ["--None--","14 Days","30 Days"]
      puts "expectedvalues =  #{expectedvalues}"
      if actualvalues == expectedvalues
        puts "expected values are visible in Renewal Status picklist"
      else
        writeFailure "expected values are not visible in Renewal Status picklist"
      end
    else
      writeFailure "Renewal Extension field is not visible "
    end
  end
end

Then(/^I should verify Cancel Process Effective Date field type should be read only for salesmanager salesrep and salesops$/) do
  if ENV['UserRole'] == "salesrepsit" || ENV['UserRole'] == "salesmgrsit" || ENV['UserRole'] == "salesopssit"
    if page.has_field?("Cancel Process Effective Date")
      writeFailure "Cancel Process Effective Date field is visible with editable option"
    elsif page.has_content?("Cancel Process Effective Date")
      puts "Cancel Process Effective Date field is visible with read only permission"
    else
      writeFailure "Cancel Process Effective Date field is not visible "
    end
  else
    puts "user role not matched"
  end
end

Then(/^I should see error as "([^"]*)"$/) do |value|
  page.has_content?(value)
  sleep 2
end

Then(/^I should see sub expected reason code picklist under churn information$/) do
  #  if page.has_select?("00N3600000Ea25q", :selected => "--None--")
  #    puts "sub expected reason code picklist is visible"
  #  else
  #    writeFailure "sub expected reason code picklist is not visible"
  #  end
  if page.has_field?("00N3600000Ea25q")
    puts "sub expected reason code picklist is visible"
  else
    writeFailure "sub expected reason code picklist is not visible"
  end
end

When(/^I enter opportunity in search field and click on validation rules$/) do
  fill_in('setupSearch', :with => 'opportunity')
  sleep 5
  find(:xpath,"//*[@id='OpportunityLineItemValidations_font']").click
  sleep 5
end

When(/^I select "([^"]*)" from view picklist under opportunity tab$/) do |value|
  if page.has_select?("fcf", :selected => "All Open Opportunities")
    click_on "Go!"
    sleep 5
  else
    select value, :from => "View:"
  end
end

Then(/^I should not see type coloumn$/) do
  puts "type coloumn not visible"
end

Then(/^I should see direct channel picklist values under opportunity information$/) do
  if page.has_select?("Direct/Channel", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00NR0000001RKyJ']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Direct","Channel Tier 1"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in direct channel picklist"
    else
      writeFailure "expected values are not visible in direct channel picklist"
    end
  else
    writeFailure "direct channel picklist is not visible"
  end
end

When(/^I click on underlined existing opportunity name$/) do
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[3].all('div')[0].all('a')[0].click
  end
end

When(/^I click on new quote button under quote section$/) do
  find(:xpath,"//input[@value='New Quote']").click
  sleep 5
end

When(/^I enter all mandatory fields to create new quote$/) do
  $newquote="cisco-webex-new-quote" + Random.new.rand(0001..10000).to_s
  puts $newquote
  fill_in('Quote Name', :with => $newquote)
  sleep 2
  select "Direct", :from => "00N3600000DtLp4"
  sleep 2
  select "2", :from => "00N3600000DtLp3"
  sleep 2
end

When(/^I click on opporunities then fields under customize app setup$/) do
  fill_in('setupSearch', :with => 'opportunity')
  sleep 5
  find(:xpath,"//*[@id='OpportunityLineItemFields_font']").click
  sleep 5
end

Then(/^I should see opportunity custom fields & relationships table$/) do
  if page.has_xpath?(".//*[@id='CustomFieldRelatedList']")
    puts "opportunity custom fields & relationships table is visible"
  else
    writeFailure "opportunity custom fields & relationships table is not visible"
  end
end
 
When(/^I click on new renewableline item field under renewable line items section$/) do
  find(:xpath,"//input[@value='New Renewable Line Item']").click
  sleep 5
end

When(/^I enter all mandatory fields to create new renewable item$/) do
  find_field("Existing Start Date").set("9/11/2016")
  sleep 5
  find_field("Existing End Date").set("9/11/2016")
  sleep 5
  find_field("New End Date").set("9/11/2016")
  sleep 2
  find_field("New Start Date").set("9/11/2016")
  select "Renewal", :from => "Batch Type"
  sleep 2
  fill_in('Previous Price', :with => "500" )
  sleep 2
  fill_in('Quantity', :with => "121" )
  sleep 2
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id30:0:j_id31_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

Then(/^I should not see content "([^"]*)"$/) do |value|
  page.should have_no_content(value)
end


Then(/^I should see renewal status picklist with values under information row$/) do
  sleep 3
#  element = page.find(:xpath,"//*[@id='00N3600000DtHpT']")
#  page.driver.browser.mouse.double_click(element.native)
#  sleep 3
  actualvalues =find(:xpath,"//*[@id='00N3600000DtHpT']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--", "CS - Administrative - Neutral Impact - CNI", "CS - Adoption - CSA", "CS - Company Merge or Acquisition: Moving off platform - CMA", "CS - Competitive Pricing Loss - CPL", "CS - Competitive Product Replacement - CPT", "CS - Competitive Service Loss - CSL", "CS - Consolidated Child - CDC", "CS - Consolidated Parent - CDP", "CS - Contract Term Extension - CTE", "CS - Customer Cost-Benefit Decision - Budget - CBT", "CS - Customer Cost-Benefit Decision - New Sponsor - CNS", "CS - Customer Cost-Benefit Decision - Product - CPP", "CS - Customer Policy Driven - CPD", "CS - Customer Satisfaction Driven - Billing Issues - CBI", "CS - Customer Satisfaction Driven - Internal Processes - CIP", "CS - Customer Satisfaction Driven - Sales - CDS", "CS - Customer Satisfaction Driven - SSD", "CS - Customer Satisfaction Driven - Support - CDT", "CS - Direct to Indirect - DTI", "CS - Internal Product Replacement - CPR", "CS - Not Determined - CND", "CS - One Time Use or Seasonal Project - OTP", "CS - Partial Loss - Loss", "CS - Pricing Change - PRC", "CS - Renewed at Par - R@P", "CS - Service Downgrade - DNG", "CS - Service Upgrade - UPG", "CS - Uncovered - UNC", "HA - Bad Contract Info - Cancelled - BCC", "HA - Client Downsell Business Unit - DBU", "HA - Client Sales Pullback - CSP", "HA - Client Upsell Business Unit - CBU", "HA - Duplicate - DUP", "HA - Failed Contract Upsell - FCU", "HA - Filtering - HAF", "NS - Administrative - Neutral Impact - ANI", "NS - Adoption - NSA", "NS - Company Merge or Acquisition: Moving off platform - MAP", "NS - Competitive Pricing Loss - PLA", "NS - Competitive Product Replacement - PCP", "NS - Competitive Service Loss - CSL", "NS - Consolidated Child - CDC", "NS - Customer Cost-Benefit Decision - Budget - CBB", "NS - Customer Cost-Benefit Decision - New Sponsor - CBN", "NS - Customer Cost-Benefit Decision - Product - CBP", "NS - Customer Cost-Benefit Decision - SCB", "NS - Customer No Longer Exists - RNE", "NS - Customer Policy Driven - NPD", "NS - Customer Satisfaction Driven - Billing Issues - CSB", "NS - Customer Satisfaction Driven - Internal Processes - CSI", "NS - Customer Satisfaction Driven - Sales - CSD", "NS - Customer Satisfaction Driven - SSD", "NS - Customer Satisfaction Driven - Support - CSS", "NS - Direct to Indirect - NDI", "NS - End of Life - NEL", "NS - Fraudulent Activity - NFA", "NS - Internal Product Replacement - IPR", "NS - Not Determined - NND", "NS - One Time Use or Seasonal Project - NSP", "Open"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Renewal Status picklist"
  else
    writeFailure "expected values are not visible in Renewal Status picklist"
  end
end

Then(/^I should see secondary rep field under additional opportunity detail row$/) do
  if page.has_field?("Secondary Rep")
    puts "secondary rep text field is visible"
  else
    writeFailure "secondary rep text field is not visible"
  end
end

Then(/^I should see initial term field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26Q")
    puts "initial term text field is visible"
  else
    writeFailure "initial term text field is not visible"
  end
end

Then(/^I should see current term field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26S")
    puts "current term text field is visible"
  else
    writeFailure "current term text field is not visible"
  end
end

Then(/^I should see renewal term field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26R")
    puts "renewal term field is visible"
  else
    writeFailure "renewal term field field is not visible"
  end
end

Then(/^I should see client batch field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26h")
    puts "client batch field is visible"
  else
    writeFailure "client batch field is not visible"
  end
end

Then(/^I should see srev batch field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26i")
    puts "srev batch field is visible"
  else
    writeFailure "srev batch field is not visible"
  end
end

Then(/^I should see estimated close date field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea25X")
    puts "estimated close date field is visible"
  else
    writeFailure "estimated close date field is not visible"
  end
end

Then(/^I should see renewal lead picklist field under additional opportunity detail row$/) do
  if page.has_field?("Renewal Lead")
    puts "renewal lead field is visible"
    if page.has_select?("Renewal Lead", :selected => "--None--")
      puts "renewal lead is a picklist"
    else
      writeFailure "renewal lead not a picklist"
    end
  else
    writeFailure "renewal lead field is not visible"
  end
end

Then(/^I should see GPL owner field under additional opportunity detail row$/) do
  if page.has_field?("GPL Owner")
    puts "GPL owner field is visible"
  else
    writeFailure "GPL owner field is not visible"
  end
end

Then(/^I should see new contract number field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26f")
    puts "new contract number field is visible"
  else
    writeFailure "new contract number field is not visible"
  end
end

Then(/^I should see invoice date field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea25M")
    puts "invoice date field is visible"
  else
    writeFailure "invoice date field is not visible"
  end
end

Then(/^I should see possible saas migration chechbox field under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea24m")
    puts "saas migration chechbox field is visible"
  else
    writeFailure "saas migration chechbox field is not visible"
  end
end

Then(/^I should see recurring picklist field under additional opportunity detail row$/) do
  if page.has_select?("00N3600000DtLnH", :selected => "North America")
    puts "client region picklist is visible"
  else
    writeFailure "client region picklist not visible"
  end
end

Then(/^I should see Upsell Downsell field under additional opportunity detail row$/) do
  if page.has_field?("Upsell / Downsell")
    puts "Upsell / Downsell field is visible"
    if page.has_select?("Upsell / Downsell", :selected => "--None--")
      puts "Upsell Downsell is a picklist"
    else
      writeFailure "Upsell Downsell field not a picklist "
    end
  else
    writeFailure "Upsell Downsell field not visible"
  end
end

Then(/^I should see expected ARR loss amount text field under churn information row$/) do
  if page.has_field?("Expected ARR Loss Amount")
    puts "expected ARR loss amount text field is visible"
  else
    writeFailure "expected ARR loss amount text field is not visible"
  end
end

Then(/^I should see expected loss type picklist field under churn information row$/) do
  if page.has_select?("00N3600000Ea261", :selected => "--None--")
    puts "expected loss type picklist field is visible"
  else
    writeFailure "expected loss type picklist field is not visible"
  end
end

Then(/^I should see expected offset status picklist field under churn information row$/) do
  if page.has_select?("00N3600000Ea262", :selected => "--None--")
    puts "expected offset status picklist is visible"
  else
    writeFailure "expected offset status picklist not visible"
  end
end

Then(/^I should see expected offset amount text field under churn information row$/) do
  if page.has_field?("Expected Offset Amount")
    puts "expected offset amount field is visible"
  else
    writeFailure "expected offset amount field is not visible"
  end
end

Then(/^I should see expected reason code picklist field under churn information row$/) do
  if page.has_select?("00N3600000Ea263", :selected => "--None--")
    puts "expected reason code is visible"
  else
    writeFailure "expected reason code not visible"
  end
end

Then(/^I should see sub expected reason code field under churn information row$/) do
  if page.has_field?("00N3600000Ea25q")
    puts "sub expected reason code field is visible"
  else
    writeFailure "sub expected reason code field is not visible"
  end
end

Then(/^I should see expected loss date field under churn information row$/) do
  if page.has_field?("00N3600000Ea25L")
    puts "expected loss date is visible"
  else
    writeFailure "expected loss date is not visible"
  end
end

Then(/^I should see opportunity type picklist field$/) do
  if page.has_select?("00N3600000DtLnm", :selected => "--None--")
    puts "opportunity type picklist is visible"
  else
    writeFailure "opportunity type picklist not visible"
  end
end

Then(/^I should see engagement type picklist field$/) do
  if page.has_select?("00N3600000DtLnW", :selected => "--None--")
    puts "engagement type picklist is visible"
  else
    writeFailure "engagement type picklist not visible"
  end
end

Then(/^I should see business line picklist field$/) do
  if page.has_select?("00N3600000DtLnE", :selected => "--None--")
    puts "business line picklist is visible"
  else
    writeFailure "business line picklist not visible"
  end
end

Then(/^I should see client territory picklist field$/) do
  if page.has_select?("00N3600000DtLnJ", :selected => "--None--")
    puts "client territory picklist is visible"
  else
    writeFailure "client territory picklist not visible"
  end
end

Then(/^I should see client region picklist field$/) do
  if page.has_select?("00N3600000DtLnH", :selected => "North America")
    puts "client region picklist is visible"
  else
    writeFailure "client region picklist not visible"
  end
end

Then(/^I should see Country picklist field$/) do
  if page.has_select?("00N3600000DtLnT", :selected => "--None--")
    puts "Country picklist is visible"
  else
    writeFailure "Country picklist not visible"
  end
end

Then(/^I should see SSI Theatre picklist field$/) do
  if page.has_select?("00N3600000DtLnx", :selected => "--None--")
    puts "SSI Theatre picklist is visible"
  else
    writeFailure "SSI Theatre picklist not visible"
  end
end

Then(/^I should see srev batch\tfield under additional opportunity detail row$/) do
  if page.has_field?("00N3600000Ea26i")
    puts "srev batch field is visible"
  else
    writeFailure "srev batch field is not visible"
  end
end

Then(/^I should see expected loss type\tpicklist field under churn information row$/) do
  if page.has_select?("00N3600000Ea261", :selected => "--None--")
    puts "expected loss type picklist field is visible"
  else
    writeFailure "expected loss type picklist field is not visible"
  end
end
