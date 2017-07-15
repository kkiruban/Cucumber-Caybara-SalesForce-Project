When(/^I enter the mandatory field values under new case for lead submission$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
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
  sleep 10

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
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

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("00N3600000PFKjW")
    select("Booking", :from => "00N3600000PFKjW")
  end
  if page.has_field?("Product(s) That Needs To Be Quoted")
    fill_in("Product(s) That Needs To Be Quoted",:with=> "testing")
  end
  if page.has_field?("Applicable Discounts")
    fill_in("Applicable Discounts",:with=> "testing")
  end
  if page.has_field?("New Term Dates")
    fill_in("New Term Dates",:with=> "testing")
  end
end

Then(/^I select "([^"]*)" from sub case type picklist under case information$/) do |value|
    select(value, :from => 'Sub Case Type')
  end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_val, field_val|
  if page.has_field?(field_val)
    select(option_val, :from => field_val)
  end
end

When(/^I enter the mandatory field values under new case for data update request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
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
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 2
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 3
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 3

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
end


Then(/^I check case milestone and target date value for booking request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

Then(/^I check case milestone and target date value for lead submission$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

  Given(/^I enter the mandatory field values under new case for quote request$/) do
    if page.has_field?("Status")
      select("New", :from => "Status")
    end
    if page.has_field?("Sub Case Type")
      select("New", :from => "Sub Case Type")
    end
    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
    if page.has_field?("Quote Type")
      select("1 Year", :from => "Quote Type")
    end
  end

Then(/^I enter the mandatory field values under new case for reporting request$/) do
   if page.has_field?("Status")
      select("New", :from => "Status")
    end
    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
end

  When(/^I enter the mandatory field values under new case for booking request$/) do
    if page.has_field?("Status")
      select("New", :from => "Status")
    end
    if page.has_field?("Sub Case Type")
      select("New", :from => "Sub Case Type")
    end
    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test-contact-")
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
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
    if page.has_field?("Contract Amount")
      fill_in("Contract Amount",:with=> "100")
    end
  end

  When(/^I choose contact name through look up field$/) do
    main = page.driver.browser.window_handles.first
    find(:xpath,".//*[@id='cas3_lkwgt']/img").click
    sleep 1
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
  end

  When(/^I choose opportunity through lookup field$/) do
    main = page.driver.browser.window_handles.first
    find(:xpath,".//*[@id='CF00N3600000PVaFA_lkwgt']/img").click
    sleep 1
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    sleep 5
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
  end

When(/^I note the case number which is just created$/) do
  $case_num = find(:xpath,"//h2[@class='pageDescription']").text
  puts $case_num
end

When(/^I check the request escalation check box$/) do
  if page.has_field?("00N3600000PFBdL")
    find(:id, "00N3600000PFBdL").click
    puts "request escalation field is checked"
  else
    writeFailure "request escalation field is not available"
  end
end

When(/^I enter value in the escalation reason field$/) do
 if page.has_field?("Escalation Reason")
   fill_in("Escalation Reason",:with=> "test")
 else
   writeFailure "Escalation Reason field is not available"
 end
end

Then(/^I logout from the current user$/) do
  begin
    sleep 5
    find(:id,"userNavLabel").click
		within all('.mbrMenuItems')[0] do
			click_on 'Logout'
			sleep 4
		end
		sleep 2
		puts "Logged out Successfully"
    sleep 2
	end
end

When(/^I should click on approve button$/) do
  sleep 5
  find_button('Approve').click
end

When(/^I check that lock icon appears next to edit button$/) do
  if page.has_xpath?("//td[@id='topButtonRow']/img[@alt='Locked']")
    puts "Lock icon appears next to edit button"
  else
   writeFailure "Lock icon is not appearing next to edit button"
  end
end

Then(/^I check that lock icon does not appears next to edit button$/) do
 if page.has_no_xpath?("//td[@id='topButtonRow']/img[@alt='Locked']")
    puts "Lock icon is not appearing next to edit button"
  else
   writeFailure "Lock icon appears next to edit button"
  end
end


When(/^I enter the mandatory field values under new case for data processing request$/) do
    if page.has_field?("Description")
      fill_in("Subject",:with=> "Smoke_data_processing_request")
    end
    if page.has_field?("Status")
      select("New", :from => "Status")
    end
    sleep 5
    # if page.has_field?("Opportunity")
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 3
    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
    sleep 5
    find_button('Go!').click
    sleep 3
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 3
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 5
    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
  end

When(/^I update sub case type picklist value to no service$/) do
  if page.has_field?("Sub Case Type")
    select("No Service", :from => "Sub Case Type")
  end
end

Then(/^I enter the mandatory field values under new case for Review Request$/) do
  if page.has_field?("Status")
      select("New", :from => "Status")
    end
    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "Smoke-test")
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
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
end

Then(/^I check case milestone and target date value for data processing request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

Then(/^I check case milestone and target date value for Review Request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end