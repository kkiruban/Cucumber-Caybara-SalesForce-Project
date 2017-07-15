
Given(/^I should navigate to Assets tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 10
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,".//a[@class='listRelatedObject assetBlock title']").click
  sleep 5
end

Then(/^I should see Product Line field picklist$/) do
  if page.has_select?("Product Line", :selected => "--None--")
    puts "product line is visible with read write permission"
  else
    writeFailure "product line is not visible"
  end
end

Then(/^I should verify product line picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBbh']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Cataract","Vitreoretinal","Refractive","LenSx"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in product line picklist"
  else
    writeFailure "expected values are not visible in product line picklist"
  end
end

Then(/^I should see SAP Equipment ID field$/) do
  if page.has_field?("SAP Equipment ID")
    puts "SAP Equipment ID text field is visible"
  else
    writeFailure "SAP Equipment ID text field is not visible"
  end
end

Then(/^I should see status field picklist$/) do
  if page.has_select?("Status", :selected => "--None--")
    puts "Status is visible with read write permission"
  else
    writeFailure "Status is not visible"
  end
end

Then(/^I should verify status picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='Status']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Service - Active","Limited Service","No Longer Serviced"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in status picklist"
  else
    writeFailure "expected values are not visible in status picklist"
  end
end

When(/^I fill all mandantory fields to create new assets$/) do
  $newAssets="smoke-test-assets" + Random.new.rand(0001..10000).to_s
  puts $newAssets
  fill_in "Asset Name",:with =>$newAssets
  sleep 3

  # to click on account
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='Account_lkwgt']/img").click
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

   # to click on contacts
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='Contact_lkwgt']/img").click
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

When(/^I search recently created asset and click on asset name$/) do
  fill_in('phSearchInput', :with => $newassets)
  sleep 10
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 10
  click_on $newassets
  sleep 10
end

Then(/^I should see product line picklist$/) do
  if page.has_field?("Product Line")
    puts "Product Line field is visible"
    select("Accuri", :from => 'Product Line')
    sleep 5
  else
    writeFailure "Product Line field is not visible"
  end
end

When(/^I get the created asset name$/) do
  $newassets=find(:xpath,"//h2[@class='pageDescription']").text
   puts $newassets
end


Then(/^I should see territory field under contact field$/) do
  if page.has_field?("Territory")
    puts "territory field is visible"
  else
    writeFailure "territory field is not visible"
  end
end

Then(/^I should see eopl field under territory field$/) do
  if page.has_field?("EOPL")
    puts "EOPL field is visible"
  else
    writeFailure "EOPL field is not visible"
  end
end

Then(/^I should see eosl field under eopl field$/) do
  if page.has_field?("EOSL")
    puts "EOSL field is visible"
  else
    writeFailure "SEOSL field is not visible"
  end
end

Then(/^I should see Engagement Type field under Covered Asset field$/) do
  if page.has_field?("Engagement Type")
    puts "Engagement Type field is visible"
  else
    writeFailure "Engagement Type field is not visible"
  end
end

Then(/^I should see Service Sales Owner field$/) do
  if page.has_field?("Service Sales Owner")
    puts "Service Sales Owner field is visible"
  else
    writeFailure "Service Sales Owner field is not visible"
  end
end

Then(/^I should see Warranty End Date field$/) do
  if page.has_field?("Warranty End Date")
    puts "Warranty End Date field is visible"
  else
    writeFailure "Warranty End Date is not visible"
  end
end
