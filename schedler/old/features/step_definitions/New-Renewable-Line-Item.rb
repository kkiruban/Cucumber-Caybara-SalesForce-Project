
Then(/^I should see batch type field$/) do
  sleep 3
  element = page.find(:xpath,"//*[@id='00N3600000PW6qq_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  if page.has_field?("00N3600000PW6qq")
    puts "batch type field is visible"
  else
    writeFailure "batch type field is not visible"
  end
end


Then(/^I should see batch type picklist values$/) do
  #  sleep 3
  #  element = page.find(:xpath,"//*[@id='00N3600000PW6qq_ileinner']")
  #  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N3600000PW6qq']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--", "Renewal", "ODS", "Warranty", "IBOW", "Battery", "Break/Fix", "Expired", "Adds/Recovery Expired", "Adds/Recovery Renewal", "Adds/Recovery Uncovered", "Campaign"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Batch Type picklist"
  else
    writeFailure "expected values are not visible in Batch Type picklist"
  end
end

Then(/^I should see Break fix option in batch type field$/) do
  select("Break/Fix", :from => "00N3600000PW6qq")
  puts "break fix option is visible in batch type field"
  sleep 5
end

Then(/^I should see SSI Result Reason field$/) do
  sleep 3
  element = page.find(:xpath,".//*[@id='00N3600000PW6eh_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  if page.has_field?("00N3600000PW6eh")
    puts "SSI Result Reason field is visible"
  else
    writeFailure "SSI Result Reason field is not visible"
  end
end

Then(/^I should see SSI Result Reason picklist values$/) do
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N3600000PW6eh']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--", "Open", "CS - Co-term Long - CTL", "CS - Co-term Short - CTS", "CS - Add-On - ADO", "CS - Discount - DIS", "CS - Multi-year Advance - MYA","CS - Pricing Change - PRC", "CS - Re-Cert Fee Included - RCT", "CS - Renewed at Par - R@P", "CS - Service Downgrade - DNG", "CS - Service Upgrade - UPG","CS - Uncovered - UNC", "NS - Client Product Replacement - PTR", "NS - Competitive DVAR - SCV", "NS - Competitive Product Replacement - PCP","NS - Competitive Service Loss Other - SCS", "NS - Customer Cost-Benefit Decision - SCB", "NS - Customer No Longer Exists - RNE","NS - Customer Satisfaction Driven - SSD", "NS - End of Service Life - PEL", "NS - Other Data Management - RDM", "NS - Product Decommissioned - PPD","NS - Third Party Maintenance - SPM", "NS - Unresponsive End User - REU", "NS - Unresponsive VAR - RUV", "NS - VAR No Service -RVN","HA - Bad Data - BDT", "HA - Cancelled - CNL", "HA - Covered - COV", "HA - Duplicate - DUP", "HA - End Of Support - EOL", "HA - Evergreen Billing - EVG","HA - International - INT", "HA - Lease - LEA", "HA - OEM Customer - OEM", "HA - Other - OTH", "HA - Product Return - PRT", "HA - Sales Pull Back - SPB"]
  puts "expected values =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in SSI Result Reason picklist"
  else
    writeFailure "expected values are not visible in SSI Result Reason picklist"
  end
end

When(/^I select "([^"]*)" from ssi result reason picklist$/) do |value|
  select(value, :from => "00N3600000PW6eh")
  sleep 5
  find(:xpath,"//*[@id='InlineEditDialog_buttons']/input[1]").click
  sleep 10
end

When(/^I click on Renewal Opportunity$/) do
  click_on "smoke-test-opportunity-1-111"
  sleep 5
end

When(/^I fill previous price as "([^"]*)"$/) do |value|
  fill_in("00N3600000PW6ec",:with=> value)
  sleep 5
end

When(/^I click on renewal opportunity under renewable line item detail section$/) do
  find(:xpath,"//*[@id='CF00N3600000PW6ek_ileinner']/a").click
  sleep 5
end

When(/^I click on manage renewals button under renewable line item$/) do
  find(:xpath,"//input[@value='Manage Renewals']").click
  sleep 5
end

When(/^I check existinig product in renewal relationship page$/) do
  find(:xpath,".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
  sleep 5
end

When(/^I click on rebuild opportunity link$/) do
  find(:xpath,".//*[@id='rebuildRRtoOLI']").click
  sleep 10
end