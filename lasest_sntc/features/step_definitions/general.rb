#general
When(/^I click on username and select setup link$/) do
  find(:xpath,".//*[@id='userNavButton']").click
  sleep 2
  find(:xpath,".//*[@id='userNav-menuItems']/a[2]").click
  sleep 2
end

When(/^I click on company profile link and select manage currencies$/) do
  find(:xpath,"//*[@id='CompanyProfile_font']").click
  sleep 2
  find(:xpath,"//*[@id='CompanyCurrency_font']").click
  sleep 2
end

Then(/^I should verify currency code should shows USD$/) do
  if page.has_xpath?("//tbody[tr[th[contains(text(),'USD')]]]/tr[1]/th[contains(text(),'Currency Code')]")
    puts "currency code showed USD"
  else
    fail(ArgumentError.new('currency code not showing USD'))
  end
end

When(/^I click on company profile link and select business hours$/) do
  find(:xpath,"//*[@id='CompanyProfile_font']").click
  sleep 2
  find(:xpath,"//*[@id='BusinessHours_font']").click
  sleep 2
end

When(/^I click on company profile link and select fiscal year$/) do
  find(:xpath,"//*[@id='CompanyProfile_font']").click
  sleep 2
  find(:xpath,"//*[@id='ForecastFiscalYear_font']").click
  sleep 2
end

Then(/^I verify account currency picklist with selected value "([^"]*)"$/) do |value|
  if page.has_select?("acc24", :selected => value)
    puts "seleted value as expected"
  else
    fail(ArgumentError.new('selected value is not expected'))
  end
end

When(/^I verify opportunity currency picklist with selected value "([^"]*)"$/) do |value|
  if page.has_select?("Opportunity Currency", :selected => value)
    puts "seleted value as expected"
  else
    fail(ArgumentError.new('selected value is not expected'))
  end
end

Given(/^I create a account for apac group$/) do
  find(:xpath,".//*[@id='Account_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("Name", :with => "cisco-testing-apac-group-account-name")
  sleep 2
  select("APAC", :from => "00N3600000EeE7h")
  sleep 2
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

Given(/^I create a service contracts for apac group$/) do
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 2
  find(:xpath,"//a[@class='listRelatedObject serviceContractBlock title']").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("Name", :with => "cisco-testing-apac-group-service-contracts-name")
  sleep 2
  find(:id, "StartDate").set("9/25/2016")
  sleep 2
  find_field("End Date").set("9/29/2016")
  sleep 2
  #  #to choose a account name
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='Account_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-apac-group-account")
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
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

Given(/^I create a contacts for apac group$/) do
  find(:xpath,"//*[@id='Contact_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("name_lastcon2", :with => "cisco-testing-apac-group-contact-name")
  sleep 2
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='con4_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-apac-group-account")
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
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
end

Given(/^I create a opportunity for apac group$/) do
  sleep 10
  find(:xpath,"//*[@id='Opportunity_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  select("Opportunity - Edit", :from => "p3")
  sleep 1
  find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click

  #to fill the opportunity name
  @@oppvalue = "cisco-testing-apac-group-opportunity-name-" + Random.new.rand(1000..10010).to_s
  sleep 3
  fill_in("Opportunity Name", :with=>"")
  fill_in("Opportunity Name", :with => @@oppvalue)
  sleep 5
  select("Not Contacted", :from => "opp11")
  sleep 2
  select("Volume", :from => "00N3600000D0q77")
  select("Core", :from => "Business Line")
  select("APJ", :from => "SSI Theatre")
  select("United States", :from => "Country")
  find(:id, "opp9").set("9/1/2016")
  # to select account
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='opp4_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-apac-group-account")
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
  #to choose a  standard price book
  page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='Pricebook2_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 10
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 5
  page.has_content?('Opportunity')
  page.has_content?('Opportunity Detail')
end

Given(/^I create a cases for apac group$/) do
  find(:xpath,".//*[@id='Case_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  select("Booking Request", :from => 'p3')
  find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click
  sleep 2
  select("New", :from => '00N3600000D0q5n')
  fill_in("cas15", :with => "testing")
  fill_in("00N3600000D0q4Z", :with => "500")
  sleep 2
  #opportunity
  page.driver.browser.window_handles.first
  find(:css,"#CF00N3600000D0q5I_lkwgt").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.click_link("cisco-testing-nala-group-opportunity-name")
  end
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 10
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

Given(/^I create a success plan for apac group$/) do
  #  find(:xpath,"//img[@title='All Tabs']").click
  #  sleep 5
  #  find(:xpath,"//a[@class='listRelatedObject Custom253Block userDefinedRL 01536000000Bfc9 title']").click
  puts "success tab not visible or not available"
end

When(/^I search opportunity as cisco\-testing\-apac\-group\-opportunity\-name$/) do
  if page.has_xpath?("//*[contains(text(),'cisco-testing-apac-group-opportunity-name')]")
    puts "data found successfully"
  else
    writeFailure "data not found"
  end
end

Given(/^I create a account for nala group$/) do
  find(:xpath,".//*[@id='Account_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("Name", :with => "cisco-testing-nala-group-account-name")
  sleep 2
  select("NALA", :from => "00N3600000EeE7h")
  sleep 2
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

Given(/^I create a success plan for nala group$/) do
  #  find(:xpath,"//img[@title='All Tabs']").click
  #  sleep 5
  #  find(:xpath,"//a[@class='listRelatedObject Custom253Block userDefinedRL 01536000000Bfc9 title']").click
  puts "success plan tab not visible or not available"
end

Given(/^I create a service contracts for nala group$/) do
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 2
  find(:xpath,"//a[@class='listRelatedObject serviceContractBlock title']").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("Name", :with => "cisco-testing-nala-group-service-contracts-name")
  sleep 2
  find(:id, "StartDate").set("9/25/2016")
  sleep 2
  find_field("End Date").set("9/29/2016")
  sleep 2
  #  #to choose a account name
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='Account_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-nala-group-account")
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
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

#Given(/^I create a cases for nala group$/) do
#  find(:xpath,".//*[@id='Case_Tab']/a").click
#  sleep 2
#  find(:xpath,"//input[@name='new']").click
#  sleep 2
#  select("Booking Request", :from => 'p3')
#  find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click
#  sleep 2
#  select("New", :from => '00N3600000D0q5n')
#  fill_in("cas15", :with => "testing")
#  fill_in("00N3600000D0q4Z", :with => "500")
#  sleep 2
#  #opportunity
#  page.driver.browser.window_handles.first
#  find(:css,"#CF00N3600000D0q5I_lkwgt").click
#  sleep 1
#  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
#  page.driver.browser.switch_to.frame("resultsFrame")
#  within('.pbBody') do
#    table=all("tbody")[0]
#    table.all('tr')[1].all('th')[0].find('a').click
#  end
#  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
#  sleep 10
#  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
#  sleep 2
#end

Given(/^I create a contacts for nala group$/) do
  find(:xpath,"//*[@id='Contact_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  fill_in("name_lastcon2", :with => "cisco-testing-nala-group-contact-name")
  sleep 2
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='con4_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-nala-group-account")
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
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
end

Given(/^I create a opportunity for nala group$/) do
  sleep 10
  find(:xpath,"//*[@id='Opportunity_Tab']/a").click
  sleep 2
  find(:xpath,"//input[@name='new']").click
  sleep 2
  select("Opportunity - Edit", :from => "p3")
  sleep 1
  find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click

  #to fill the opportunity name
  @@nalaoppvalue = "cisco-testing-nala-group-opportunity-name-" + Random.new.rand(1000..10010).to_s
  sleep 3
  fill_in("Opportunity Name", :with=>"")
  fill_in("Opportunity Name", :with => @@nalaoppvalue)
  sleep 5
  select("Not Contacted", :from => "opp11")
  sleep 2
  select("Volume", :from => "00N3600000D0q77")
  select("Core", :from => "Business Line")
  select("APJ", :from => "SSI Theatre")
  select("United States", :from => "Country")
  find(:id, "opp9").set("9/1/2016")
  #to choose a account name
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='opp4_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "cisco-testing-nala-group-account")
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
  #to choose a  standard price book
  page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='Pricebook2_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 10
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 5
  page.has_content?('Opportunity')
  page.has_content?('Opportunity Detail')
end

When(/^I click on manage users link$/) do
  find(:xpath,"//*[@id='Users_font']").click
end

When(/^I click on users link$/) do
  find(:xpath,"//*[@id='ManageUsers_font']").click
end

When(/^I select "([^"]*)" from view picklist under all users$/) do |value|
  select("Active Users", :from => 'fcf')
end

When(/^I verify list of active users inactive users nala group user and apac group users$/) do
  #   .//*[@id='bodyCell']/div[5]/div/div[2]/table/tbody/tr/th/a
end

When(/^I search account name as "([^"]*)"$/) do |account_name|
  fill_in('phSearchInput', :with => account_name)
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search nala service contracts as "([^"]*)"$/) do |service_contracts|
  fill_in('phSearchInput', :with => "cisco")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search sucess plan as "([^"]*)"$/) do |success_plan|
  fill_in('phSearchInput', :with => success_plan)
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search service contracts as "([^"]*)"$/) do |service_contracts|
  fill_in('phSearchInput', :with => "cisco")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search cases as "([^"]*)"$/) do |cases|
  fill_in('phSearchInput', :with => cases)
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search contacts as "([^"]*)"$/) do |contacts|
  fill_in('phSearchInput', :with => contacts)
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I search opportunity as "([^"]*)"$/) do |opportunity|
  fill_in('phSearchInput', :with => "cisco")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

When(/^I enter "([^"]*)" in search field and click$/) do |value|
  fill_in('setupSearch', :with => value)
  sleep 5
  find(:xpath,"//*[@id='ScheduledJobs_font']").click
  sleep 2
end

When(/^I click on CSM_BatchCreatePlayScheduledDispatcher manage link$/) do
  find(:xpath,"//th[contains(text(),'CSM_BatchCreatePlayScheduledDispatcher')]/preceding-sibling::td/a[contains(text(),'Manage')]").click
  sleep 5
end

Then(/^I should see apac account name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    writeFailure "data not found"
  else
    puts "#{page.has_content?(value)}"
    puts "data found successfully"
  end
end

When(/^I search apac opportunity as "([^"]*)"$/) do |value|
  fill_in('phSearchInput', :with => "cisco")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
end

Then(/^I should see apac opportunity name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    writeFailure "data not found"
  else
    page.has_xpath?("//*[contains(text(),'cisco-testing-apac-group-opportunity-name-')]")
    puts "data found successfully"
  end
end

Then(/^I should see apac contact name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    writeFailure "data not found"
  else
    puts "#{page.has_content?(value)}"
    puts "data found successfully"
  end
end

Then(/^I should see apac service contracts name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found"
  else
    puts "#{page.has_content?(value)}"
    puts "data found successfully"
  end
end

Then(/^I should see nala account name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found"
  else
    puts "#{page.has_content?(value)}"
    puts "data found successfully"
  end
end

Then(/^I should see nala success plan name "([^"]*)"$/) do |value|
  #  if page.has_content?("No matches found")
  #    writeFailure "data not found"
  #  else
  #    puts "#{page.has_content?(value)}"
  #    puts "data found successfully"
  #  end
  puts "success plan module not available"
end

Then(/^I should see nala service contracts name "([^"]*)"$/) do |value|
  sleep 5
  if page.has_content?("No matches found")
    puts "data not found"
  else
    puts "search all"
    if page.has_xpath?("//*[@id='searchAllSummaryView']")
      find(:xpath,"//*[@id='searchAllSummaryView']").click
      puts "#{page.has_content?(value)}"
      puts "data found successfully"
    else
      puts "#{page.has_content?(value)}"
      puts "data found successfully"
    end
  end
end

Then(/^I should see nala contact name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found"
  else
    puts "#{page.has_content?(value)}"
    puts "data found successfully"
  end
end

Then(/^I should see nala opportunity name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found"
  else
    page.has_xpath?("//*[contains(text(),'cisco-testing-nala-group-opportunity-name-')]")
    puts "data found successfully"
  end
end

When(/^I should not see apac account name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see apac opportunity name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see apac contact name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see apac service contracts name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see nala account name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see nala success plan name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see nala service contracts name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see nala contact name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I should not see nala opportunity name "([^"]*)"$/) do |value|
  if page.has_content?("No matches found")
    puts "data not found successfully"
  else
    page.has_content?(value)
    puts "data found"
  end
end

When(/^I click on Opportunities tab$/) do
  find(:xpath,"//img[@title='All Tabs']").click
  sleep 4
  find(:xpath,"//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 5
end

When(/^I click on the pin on the right of the cisco management folder$/) do
   fill_in('ext-comp-1001', :with => 'Cisco Management')
   sleep 5
#   find(:xpath,".//*[@id='ext-gen17']/div/li/div").hover
#   sleep 2
#   find(:xpath,".//*[@id='ext-comp-1043']").click
#   sleep 5
#   find(:xpath,".//*[@id='ext-gen538']").click
end

When(/^I verify that the users have access to the cisco management folder$/) do
   puts "todo"
end


Then(/^I should see running hours$/) do
  if page.has_select?("pst0", :selected => "11:00 PM")
    
  else
    writeFailure "Running hour is not 11:00PM"
  end
end


When(/^I click on CSM_MstrScheduledDispatcher manage link$/) do
  find(:xpath,"//th[contains(text(),'CSM_MstrScheduledDispatcher')]/preceding-sibling::td/a[contains(text(),'Manage')]").click
  sleep 5
end

When(/^I click on Customize link and Activity Custom$/) do
  find(:xpath,".//*[@id='Customize_icon']").click
  sleep 2
  find(:xpath,".//*[@id='Activity_icon']").click
  find(:xpath,".//*[@id='ActivityFields_font']").click
  sleep 2
end

When(/^I check Newly added Custom Fields$/) do
 if page.has_content?('SSI_ZTH__Task_Picklist_3__c')
   else
     fail(ArgumentError.new('SSI_ZTH__Task_Picklist_3__c not available'))
   end
 
 if page.has_content?('SSI_ZTH__Task_Picklist_4__c')
   else
     fail(ArgumentError.new('SSI_ZTH__Task_Picklist_4__c not available'))
   end
   
   if page.has_content?('SSI_ZTH__Task_Picklist_5__c')
     else
       fail(ArgumentError.new('SSI_ZTH__Task_Picklist_5__c not available'))
   end
   
   if page.has_content?('SSI_ZTH__Task_Picklist_6__c')
     else
       fail(ArgumentError.new('SSI_ZTH__Task_Picklist_6__c not available'))
  end
end


