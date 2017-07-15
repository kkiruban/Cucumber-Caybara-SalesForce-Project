#cases
When(/^I select "([^"]*)" from status field under case information row$/) do |value|
  select(value, :from => 'cas7')
end

When(/^I select "([^"]*)" from priority field under case information row$/) do |value|
  select(value, :from => 'Priority')
end

When(/^I fill in description with "([^"]*)" under description information row$/) do |value|
  fill_in "Description",:with => value
end

When(/^I select "([^"]*)" from quote type picklist under quote request details$/) do |value|
  select(value, :from => '00N3600000DtLmB')
end

Then(/^I should see "([^"]*)" value in sub caste type picklist$/) do |value|
  if page.has_xpath?("//*[@id='00N3600000DtLmN']/option[@value='#{value}']")
      puts "#{value} value is added successfully under sub caste picklist"
  else
      writeFailure "#{value} value is not added in sub caste type picklist"
  end
end

When(/^I select "([^"]*)" from WebEx Reason Code$/) do |value|
  if page.has_field?("WebEx Reason Code")
  select(value, :from => 'WebEx Reason Code')
  else
    writeFailure "WebEx Reason Code is not visible"
  end
end

When(/^I select "([^"]*)" from ssi result reason picklist$/) do |value|
  if page.has_field?("Renewal Status")
    puts "Renewal Status picklist is visible"
    select(value, :from => 'Renewal Status')
  else
    writeFailure "Renewal Status picklist is not visible"
  end
end

Then(/^I should see previous contract id under data update details row$/) do
  if page.has_field?("Previous Contract ID")
    puts "Previous Contract ID field is visible"
    if page.has_xpath?("//*[@id='00N3600000ICb6Y'] | *[@type='text']")
      puts "Previous Contract ID field is text field"
    else
      writeFailure "Previous Contract ID field is not text field"
    end
  else
    writeFailure "Previous Contract ID field is not visible"
  end
end

Then(/^I should see new contract id under data update details row$/) do
  if page.has_field?("New Contract ID")
    puts "New Contract ID field is visible"
    if page.has_xpath?(".//*[@id='00N3600000ICb6Z']  | *[@type='text']")
      puts "New Contract ID field is text field"
    else
      writeFailure "New Contract ID field is not text field"
    end
  else
    writeFailure "New Contract ID field is not visible"
  end
end

When(/^I fill "([^"]*)" in previous contract id under data update details row$/) do |value|
  fill_in "Previous Contract ID",:with => value
end

When(/^I fill "([^"]*)" in new contract id under data update details row$/) do |value|
  fill_in "New Contract ID",:with => value
end

Then(/^I should verify sub case type picklist values with record type data update request$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","House Account","No Service", "Research","Account","Service Contract","Documentation"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in sub case type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in sub case type picklist'))
  end
end

When(/^I should see WebEx Reason Code field$/) do
  if page.has_field?("WebEx Reason Code")
    puts "WebEx Reason Code field is visible"
  else
    writeFailure "WebEx Reason Code field is not visible"
  end
end

When(/^I should verify WebEx Reason Code field type should be editable$/) do
  if page.has_select?("WebEx Reason Code", :selected => "--None--")
    puts "WebEx Reason Code field is editable"
  else
    writeFailure "WebEx Reason Code field is not visible"
  end
end

When(/^I should verify WebEx Reason Code field picklist values$/) do
  if page.has_field?("WebEx Reason Code")
    actualvalues =find_field("WebEx Reason Code").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--", "Adoption: Lack of Adoption", "Adoption: Lack of Adoption Due to End User Request No Contact", "Adoption: Lack of Adoption Due to High Ratios", "Adoption: Lack of Adoption Due to No Contact Per Request by End Users", "Adoption: Lack of Documentation", "Adoption: Lack of Internal Support / Lost Sponsor", "Adoption: Lack of Training Programs Available", "Adoption: One-Time Project Related or Seasonal Use", "Channel: Direct to Indirect - Audio Pricing", "Channel: Direct to Indirect - Audio Quality", "Channel: Direct to Indirect - Billing", "Channel: Direct to Indirect - Other", "Channel: Indirect to Direct", "Channel: Indirect to Indirect", "Competitor: Pricing - Adobe", "Competitor: Pricing - Blackboard", "Competitor: Pricing - Blue Jeans", "Competitor: Pricing - Citrix", "Competitor: Pricing - Free Service", "Competitor: Pricing - FuzeBox", "Competitor: Pricing - IBM", "Competitor: Pricing - In House Service", "Competitor: Pricing - LogMeIn", "Competitor: Pricing - Microsoft", "Competitor: Pricing - Microsoft/Skype", "Competitor: Pricing - Move to Partner Product", "Competitor: Pricing - NTT-IT", "Competitor: Pricing - On24", "Competitor: Pricing - Other", "Competitor: Pricing - Quanshi", "Competitor: Pricing - Ready Talk", "Competitor: Pricing - Saba", "Competitor: Pricing - Skype", "Competitor: Pricing - Tencent", "Competitor: Pricing - V-Cube", "Competitor: Pricing - Zoom", "Competitor: Product Usability/Lack Features - Adobe", "Competitor: Product Usability/Lack Features - Blackboard", "Competitor: Product Usability/Lack Features - Blue Jeans", "Competitor: Product Usability/Lack Features - Citrix", "Competitor: Product Usability/Lack Features - Free Service", "Competitor: Product Usability/Lack Features - FuzeBox", "Competitor: Product Usability/Lack Features - IBM", "Competitor: Product Usability/Lack Features - In House Service", "Competitor: Product Usability/Lack Features - LogMeIn", "Competitor: Product Usability/Lack Features - Microsoft", "Competitor: Product Usability/Lack Features - Microsoft/Skype", "Competitor: Product Usability/Lack Features - Move to PartnerProduct", "Competitor: Product Usability/Lack Features - NTT-IT", "Competitor: Product Usability/Lack Features - On24", "Competitor: Product Usability/Lack Features - Other", "Competitor: Product Usability/Lack Features - Quanshi", "Competitor: Product Usability/Lack Features - Ready Talk", "Competitor: Product Usability/Lack Features - Saba", "Competitor: Product Usability/Lack Features - Tencent", "Competitor: Product Usability/Lack Features - V-Cube", "Competitor: Product Usability/Lack Features - Zoom", "Customer: Corporate Standards", "Customer: Lack of Internal Support / Lost Sponsor", "Customer: One-Time Project Related or Seasonal Use", "Customer: Policy - No Auto Renewing", "Economic: Downsizing / Workforce Reduction", "Economic: Loss of Budget", "Economic: Merger & Acquisition", "Economic: Out-of-Business", "Economic: Policy - No Auto Renewing", "Internal: BOL Migration", "Internal: Contract Change - Upsell / Neutral Revenue Impact", "Internal: Conversion to Cisco Product", "Internal: Currency Conversion", "Internal: End-of-Life", "Internal: Fraud", "Internal: Move to Buy Online", "Internal: Movement to CUWL", "Internal: Movement to GPL", "Internal: Moving from GPL to Direct (Non-Partner)", "Internal: Moving from GPL to Direct (Partner)", "Internal: Non-Transparent Pricing", "Internal: Order Correction - Entry", "Internal: Order Correction - Expectations", "Internal: Provisioning SLA Experience", "Internal: System Migration", "Internal: WebEx Break/Fix Experience", "Internal: WebEx Customer Service/Support", "Internal: Webex Sales Experience", "Internal: WebEx Support Experience", "Offset - Contract Change, Upsell / Neutral Revenue Impact", "Other: Not Determined", "Other: Partner Did Not Disclose", "Other: Partner Requested Cancel Due to Non Paying Customer", "Other: Partner Requested Due to Non Paying Customer", "Other: To Be Determined", "Pricing: Account Consolidation", "Pricing: Adjustment", "Pricing: Adobe", "Pricing: Citrix", "Pricing: IBM", "Pricing: Microsoft", "Pricing: Move to Buy Online Process", "Pricing: Non-Transparent", "Pricing: Other", "Pricing: Strategic Discount", "Product: Billing", "Product: Ease of Use / Insufficient Training", "Product: Ease of Use / Usability - Adobe", "Product: Ease of Use / Usability - Citrix", "Product: Ease of Use / Usability - IBM", "Product: Ease of Use / Usability - Microsoft", "Product: Ease of Use / Usability - Other", "Product: Lack of Feature / Functionality", "Product: Technical - (Data Portion)", "Product: Technical - (Telephony/ Audio Portion)", "Strategic: Account Consolidation", "Strategic: End-of-Life", "Strategic: Loss of Audio to Arkadin Due to Pricing", "Strategic: Loss of Audio to Arkadin Due to Quality", "Strategic: Loss of Audio to Intercall Due to Pricing", "Strategic: Loss of Audio to Intercall Due to Quality", "Strategic: Loss of Audio to Other Due to Pricing", "Strategic: Loss of Audio to Other Due to Quality", "Strategic: Loss of Audio to PGi Due to Pricing", "Strategic: Loss of Audio to PGi Due to Quality", "Strategic: Offset - Contract Change, Upsell / Neutral Revenue Impact", "Strategic: Offset - Conversion to Cisco Product", "Strategic: Offset - Direct to Partner - Audio Pricing", "Strategic: Offset - Direct to Partner - Audio Quality", "Strategic: Offset - Direct to Partner – End of Life of Add on Service", "Strategic: Offset - Direct to Partner – Inadequate Billing", "Strategic: Offset - Direct to Partner - Other", "Strategic: Offset - Marketing/Donation Accounts", "Strategic: Offset - Migration to SaaS Platform", "Strategic: Offset - Movement to CUWL", "Strategic: Offset - Movement to GPL", "Strategic: Offset - Moving from GPL to Direct (Non-Partner)", "Strategic: Offset - Moving from GPL to Direct (Partner)", "Strategic: Offset - Partner to Direct - Other", "Strategic: Offset - Partner to Partner - Other", "Strategic: Pricing Reduction to Retain Customer", "Strategic: Right Size Customer - Downsell Services"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in WebEx Reason Code picklist"
    else
      writeFailure "expected values are not visible in WebEx Reason Code picklist"
    end
  else
    writeFailure "WebEx Reason Code field is not visible "
  end
end


Then(/^I should verify sub case type picklist values with record type data reporting request$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","QBR","Campaign","Dailies","Data Processing", "Ad Hoc","Beta Reporting","Ops Reviews","Commit Call"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in sub case type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in sub case type picklist'))
  end
end

Then(/^I should verify SSI Result Reason Type picklist values with record type booking request$/) do
  if page.has_field?("SSI Result Reason Type")
    actualvalues =find(:xpath,"//*[contains(text(),'SSI Result Reason Type')]").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Terminated","Do Not Contact","Sales Pullback","Unresponsive"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in sub case type picklist"
    else
      fail(ArgumentError.new('expected values are not visible in SSI result reason type picklist'))
    end
  else
    fail(ArgumentError.new('SSI result reason type picklist is not picklist'))
  end
end

When(/^I fill in contract amount with "([^"]*)" under booking request details$/) do |value|
  fill_in "00N3600000DtLl9",:with => value
end

Given(/^I should navigate to Cases tab in saleforce application$/) do
  sleep 5
  step 'I enter the credentials to the Zenith application'
  sleep 5
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 2
  find(:xpath,"//a[@class='listRelatedObject caseBlock title']").click
  sleep 2
end

Then(/^I should see sub caste type picklist values for record type reporting request$/) do
  if page.has_select?("00N3600000D0q5n", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","QBR", "Campaign","Dailies","Data Processing","Ad Hoc","Beta Reporting","Ops Reviews","Commit Call"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in new record picklist"
    else
      writeFailure "expected values are not visible in sub caste type picklist"
    end
  else
    writeFailure "sub caste type picklist is not visible"
  end
end

Then(/^I should see sub caste type picklist values for record type data update request$/) do
  if page.has_select?("00N3600000D0q5n", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","New", "Revision"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in sub caste type picklist"
    else
      writeFailure "expected values are not visible in sub caste type picklist"
    end
  else
    writeFailure "sub caste type picklist is not visible"
  end
end


When(/^I click on request escalation check box$/) do
  #  find(:xapth,"//*[@id='00N3600000D0q5g']").click
  check('00N3600000D0q5g')
  sleep 5
end

When(/^I select "([^"]*)" from  sub case type picklist field under case information row$/) do |value|
  select(value, :from => '00N3600000D0q5n')
end

When(/^I enter escalation reason as "([^"]*)"$/) do |value|
  fill_in "00N3600000D0q4w",:with => value
end

When(/^I choose account name from the lookup field under description information row$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='cas4_lkwgt']/img").click
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

When(/^I choose opportunity name from the lookup field under description information row$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='CF00N3600000D0q5I_lkwgt']/img").click
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

When(/^I choose contact name from the lookup field under description information row$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='cas3_lkwgt']/img").click
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

Then(/^I should see product field picklist under case information$/) do
  if page.has_select?("Product", :selected => "--None--")
    puts "product type picklist is visible"
  else
    fail(ArgumentError.new('product type pick list not visible under contact information'))
  end
end

Then(/^I should verify product field picklist values as per requirements$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000IS7aw']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","SNTC", "NOS", "AMP", "Collab ELA"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in product type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in product type picklist'))
  end
end

Given(/^I select "([^"]*)" from view picklist$/) do |value|
  sleep 5
  select value, :from => "View:"
  if find(:button,"Go!").visible? == true
    click_on "Go!"
    sleep 5
  else
    puts "Go! button is not visible"
  end
end

Given(/^I click on underlying case name$/) do
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[3].all('div')[0].all('a')[0].click
  end
end

Then(/^I should see product field with read only permission$/) do
  if page.has_select?('Product Type')
    fail(ArgumentError.new('Product Type field is not write protected'))
  else
    puts "Country field is write protected"
  end
end

When(/^I search case "([^"]*)" number in search field$/) do |value|
  fill_in "phSearchInput",:with => value
  sleep 5
  find(:xpath,"//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I click on underlined case name$/) do
  find(:xpath,"//a[contains(text(),'00001228')]").click
  sleep 5
end

When(/^I click on Home tab$/) do
  find(:xpath,".//*[@id='home_Tab']/a").click
  sleep 5
end

When(/^I double click on request escalation under case information$/) do
  sleep 3
  element = page.find(:xpath,"//*[@id='00N3600000DtLmG_chkbox']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  check('00N3600000DtLmG')
end


Then(/^I get the case no value$/) do
  $getcaseno=find(:xpath,"//h2[@class='pageDescription']").text
  puts $getcaseno
end

When(/^I search case just created through search field$/) do
  $getcaseno
  fill_in "phSearchInput",:with => $getcaseno
  sleep 2
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I click on case just created$/) do
  puts $getcaseno
  click_link($getcaseno)
  sleep 5
end


When(/^I double click on escalation reason and enter proper reason$/) do
  sleep 3
  element = page.find(:xpath,"//*[@id='00N3600000DtLlW_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 2
  fill_in "00N3600000DtLlW",:with => "testing"
  sleep 2
  find(:xpath,".//*[@id='InlineEditDialog_buttons']/input[1]").click
  sleep 2
end

Then(/^I should see caseno just created$/) do
  if page.has_link?($getvalue)
    sleep 3
    puts "visible"
    puts $getvalue
  else
    puts "not visible"
  end
end

When(/^I click on approve link$/) do
  find(xpath,'//tr[th[a[contains(text(),"'"#{$getvalue}"'")]]]/td/a[2]').click
end

When(/^I should click on approve button$/) do
  find_button('Approve').click
end

When(/^I choose contact name through look up field under description information row$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='cas3_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I choose opportunity name through look up field under description information row$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='CF00N3600000DtLls_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "test")
  sleep 5
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I select "([^"]*)" from sub case type picklist under case information row$/) do |value|
  select(value, :from => '00N3600000DtLmN')
end
