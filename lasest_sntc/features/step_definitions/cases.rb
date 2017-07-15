#cases
When(/^I select "([^"]*)" from status field under case information row$/) do |value|
  select(value, :from => 'cas7')
end

When(/^I select "([^"]*)" from priority field under case information row$/) do |value|
  select(value, :from => 'Priority')
end

When(/^I should get recently created case$/) do
  $newlycreatedcase = find(:xpath,"//div[@class='content']/h2").text
  puts $newlycreatedcase
end

Given(/^I should login as a "([^"]*)"$/) do |user_role|
  visit env
  sleep 10
  if user_role == "OpsManager"
    fill_in "Username",:with => "ciscoadopt.opsmgr@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "OpsRep"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesManager"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesRep"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesOps"
    fill_in "Username",:with => "ciscoadopt.salesops@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "apacOpsMgr"
    fill_in "Username",:with => "ciscoadopt.opsmgrapac@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "apacSalesMgr"
    fill_in "Username",:with => "ciscoadopt.salesmgrapac@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  else
    puts "user role does not matched"
  end
end

Then(/^I should see case no under items to approve section$/) do
  if find_link($newlycreatedcase).visible?
    puts "#{$newlycreatedcase} case no is visible under approve sections"
  else
    fail(ArgumentError.new('case no is not visible'))
  end
end

When(/^I check request escalation$/) do
  check('Request Escalation')
  sleep 2
end

When(/^I enter escalation reason$/) do
  fill_in "Escalation Reason",:with => "Smoke testing"
end

When(/^I search recently created case in search field$/) do
  fill_in "phSearchInput",:with => $newlycreatedcase
  sleep 5
  find(:xpath,"//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I click on underlined case name$/) do
  find_link($newlycreatedcase).click
  sleep 5
end

When(/^I search case "([^"]*)" number in search field$/) do |value|
  fill_in "phSearchInput",:with => value
  sleep 5
  find(:xpath,"//*[@id='phSearchButton']").click
  sleep 5
end


When(/^I fill in description with "([^"]*)" under description information row$/) do |value|
  fill_in "Description",:with => value
end

When(/^I fill in opportunity with "([^"]*)" under description information row$/) do |value|
  fill_in "Opportunity",:with => value
end

When(/^I fill in contact name with "([^"]*)" under description information row$/) do |value|
  fill_in "Contact Name",:with => value
end

When(/^I select "([^"]*)" from product picklist under description information$/) do |value|
  select(value, :from => '00N3600000IS7aw')
end

Then(/^I should verify sub case type picklist values with record type data update request$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","House Account","No Service", "Research","Account","Service Contract","Documentation","Research- Leads","Research- Other"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in sub case type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in sub case type picklist'))
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
 
When(/^I select "([^"]*)" from sub case type picklist under case information$/) do |value|
  select(value, :from => '00N3600000D0q5n')
end

When(/^I fill in contract amount with "([^"]*)" under booking request details$/) do |value|
  fill_in "00N3600000D0q4Z",:with => value
end

Given(/^I should navigate to Cases tab in saleforce application$/) do
  sleep 5
  step 'I enter the credentials to the Zenith application'  
  sleep 5
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,".//a[@class='listRelatedObject caseBlock title']").click
#  click_on "Cases"
  sleep 10
end

When(/^I choose contact name through look up field$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='cas3_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco")
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

Then(/^I should see sub caste type picklist values for record type reporting request$/) do
  if page.has_select?("00N3600000D0q5n", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--", "QBR", "Campaign", "Dailies", "Data Processing", "Ad Hoc", "Beta Reporting", "Ops Reviews", "Commit Call"]
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

#Then(/^I should see sub caste type picklist values for record type data update request$/) do
#  if page.has_select?("00N3600000D0q5n", :selected => "--None--")
#    actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
#    puts "actual values = #{actualvalues}"
#    expectedvalues = ["--None--","House Account", "No Service","Research","Account","Service Contract","Documentation","Research- Leads","Research- Other"]
#    puts "expectedvalues =  #{expectedvalues}"
#    if actualvalues == expectedvalues
#      puts "expected values are visible in new record picklist"
#    else
#      writeFailure "expected values are not visible in sub caste type picklist"
#    end
#  else
#    writeFailure "sub caste type picklist is not visible"
#  end
#end

Then(/^I should see sub caste type picklist values for record type data update request$/) do
  if page.has_select?("00N3600000D0q5n", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00N3600000D0q5n']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","House Account", "No Service","Research","Account","Service Contract","Documentation","Research- Leads","Research- Other"]
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

When(/^I choose opportunity name through look up field$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000D0q5I_lkwgt']/img").click
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


When(/^I choose product value from look field icon$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='Product_lkwgt']/img").click
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
    writeFailure "Go! button is not visible"
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

When(/^I click on Home tab$/) do
  find(:xpath,".//*[@id='home_Tab']/a").click
  sleep 5
end

When(/^I double click on request escalation under case information$/) do
  sleep 3
  element = page.find(:xpath,".//*[@id='00N3600000D0q5g_chkbox']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  check('00N3600000D0q5g')
end


Then(/^I get the case no value$/) do
  $getvalue=find(:xpath,"//h2[@class='pageDescription']").text
  puts $getvalue
end


When(/^I double click on escalation reason and enter proper reason$/) do
  sleep 3
  element = page.find(:xpath,".//*[@id='00N3600000D0q4w_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 2
  fill_in "00N3600000D0q4w",:with => "testing"
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
    writeFailure "not visible"
  end
end

When(/^I click on approve link$/) do
  find(xpath,'//tr[th[a[contains(text(),"'"#{$getvalue}"'")]]]/td/a[2]').click
end

When(/^I should click on approve button$/) do
  find_button('Approve').click
end

Then(/^I should not see "([^"]*)" value in sub case type picklist field$/) do |value|
  if page.has_xpath?("//*[@id='00N3600000D0q5n']/option[@value='Documentation']")
      writeFailure "#{value} value is visible under sub caste type picklist"
  else
      puts "#{value} value is not visible"
  end
end

#----------------------------------------------------------------------------

Then(/^I check the removal of "([^"]*)" from Sub Case type$/) do |arg1|
  if page.has_select?("00N3600000D0q5n")
    puts "Sub Case type picklist is available"
    if page.has_xpath?("//select[@id='00N3600000D0q5n']/option[@value='Research-Other']")
      writeFailure "Sub Case type contains #{arg1} option"
    else
      puts "Sub Case type does not contains #{arg1} option"
    end
  else
    writeFailure "Sub Case type picklist is not available"
  end
end

When(/^I click on "([^"]*)" button under select case record type$/) do |arg1|
  within('#bottomButtonRow') do
    find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click
  end
end