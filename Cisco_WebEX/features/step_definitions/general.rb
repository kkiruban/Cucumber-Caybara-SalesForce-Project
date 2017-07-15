Given(/^I click on username in the top right corner then select setup$/) do
  sleep 4
  page.find(:id, "userNavLabel").click
  sleep 10
  within all('.mbrMenuItems')[0] do
    click_on 'Setup'
    sleep 2
  end
end

#When(/^I expand company profile from administration setup$/) do
#  sleep 4
#  click_on 'Company Profile'
#  sleep 4
#  click_on 'Business Hours'
#end

When(/^I click "([^"]*)" link$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2
end

When(/^I expand "([^"]*)" from administration setup$/) do |arg1|
  sleep 3
  click_on arg1  
  sleep 2
end

When(/^I expand "([^"]*)" from app setup$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2  
end

Given(/^I expand "([^"]*)" link under customize$/) do |arg1|
  sleep 4
  within all('.parent')[7] do
    sleep 4
#    puts "found link"
    find_link(arg1, :match => :prefer_exact).click
    puts "cliked on #{arg1}"
  end
end

When(/^I click on "([^"]*)" link$/) do |arg1|
  sleep 4
  within('.pbBody') do
    if find_link(arg1, :match => :prefer_exact).visible?
      find_link(arg1, :match => :prefer_exact).click
      #find( 'a', text: 'Berlin', exact: true )
    else
      writeFailure "#{arg1} link is not visible"
    end
  end
end

When(/^I verify nala time zone and Business Hours$/) do
  expected_time_zone = "(GMT-05:00) Central Daylight Time (America/Chicago)".to_s
  within('.pbSubsection') do
    table = all("tbody")[0]
    sleep 2
		actual_time_zone = table.all('tr')[0].all('td')[3].text.to_s
    puts "Expectes Time Zone: #{expected_time_zone}"
    puts "Actual Time Zone: #{actual_time_zone}"
    if expected_time_zone == actual_time_zone
      puts "Expectes Time Zone value and Actual Time Zone value are equal"
      puts "Time Zone is verified"
    else
      writeFailure "Expectes Time Zone value and Actual Time Zone value are not equal"
    end

    expected_sunday_value = "No Hours"
    actual_sunday_value = table.all('tr')[1].all('td')[1].all('tr')[0].all('td')[1].text
    puts "Expected sunday value: #{expected_sunday_value}"
    puts "Actual sunday value: #{actual_sunday_value}"
    if expected_sunday_value == actual_sunday_value
      puts "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are equal"
      puts "Business Hours for Sunday is verified"
    else
      writeFailure "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are not equal"
    end

    expected_monday_value = "8:00 AM to 12:00 AM".to_s
    actual_monday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[1].text.to_s
    actual_monday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[2].text.to_s
    actual_monday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[3].text.to_s
#    puts actual_monday_value_1
#    puts actual_monday_value_2
#    puts actual_monday_value_3
    actual_monday_value = actual_monday_value_1 + " " + actual_monday_value_2+ " " + actual_monday_value_3
    actual_monday_value = actual_monday_value.to_s
    puts "Expected monday value: #{expected_monday_value}"
    puts "Actual monday value: #{actual_monday_value}"
    if expected_monday_value == actual_monday_value
      puts "Expectes Business Hours for Monday and Actual Business Hours for Monday are equal"
      puts "Business Hours for Monday is verified"
    else
      writeFailure "Expectes Business Hours for Monday and Actual Business Hours for Monday are not equal"
    end

    expected_tuesday_value = "24 Hours"
    actual_tuesday_value = table.all('tr')[1].all('td')[1].all('tr')[2].all('td')[1].text.to_s
    puts "Expected tuesday value: #{expected_tuesday_value}"
    puts "Actual tuesday value: #{actual_tuesday_value}"
    if expected_tuesday_value == actual_tuesday_value
      puts "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are equal"
      puts "Business Hours for Tuesday is verified"
    else
      writeFailure "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are not equal"
    end

    expected_wednesday_value = "24 Hours"
    actual_wednesday_value = table.all('tr')[1].all('td')[1].all('tr')[3].all('td')[1].text.to_s
    puts "Expected Wednesday value: #{expected_wednesday_value}"
    puts "Actual Wednesday value: #{actual_wednesday_value}"
    if expected_wednesday_value == actual_wednesday_value
      puts "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are equal"
      puts "Business Hours for Wednesday is verified"
    else
      writeFailure "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are not equal"
    end

    expected_thursday_value = "24 Hours"
    actual_thursday_value = table.all('tr')[1].all('td')[1].all('tr')[4].all('td')[1].text.to_s
    puts "Expected Thursday value: #{expected_thursday_value}"
    puts "Actual Thursday value: #{actual_thursday_value}"
    if expected_thursday_value == actual_thursday_value
      puts "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are equal"
      puts "Business Hours for Thursday is verified"
    else
      writeFailure "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are not equal"
    end

    expected_friday_value = "12:00 AM to 5:00 PM".to_s
    actual_friday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[1].text.to_s
    actual_friday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[2].text.to_s
    actual_friday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[3].text.to_s
#    puts actual_friday_value_1
#    puts actual_friday_value_2
#    puts actual_friday_value_3
    actual_friday_value = actual_friday_value_1 + " " + actual_friday_value_2+ " " + actual_friday_value_3
    actual_friday_value = actual_friday_value.to_s
    puts "Expected monday value: #{expected_friday_value}"
    puts "Actual monday value: #{actual_friday_value}"
    if expected_friday_value == actual_friday_value
      puts "Expectes Business Hours for Friday and Actual Business Hours for Friday are equal"
      puts "Business Hours for Friday is verified"
    else
      writeFailure "Expectes Business Hours for Friday and Actual Business Hours for Friday are not equal"
    end

    expected_saturday_value = "No Hours"
    actual_saturday_value = table.all('tr')[1].all('td')[1].all('tr')[6].all('td')[1].text
    puts "Expected saturday value: #{expected_saturday_value}"
    puts "Actual saturday value: #{actual_saturday_value}"
    if expected_saturday_value == actual_saturday_value
      puts "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are equal"
      puts "Business Hours for Saturday is verified"
    else
      writeFailure "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are not equal"
    end
  end  
end

When(/^I click on Manage Currencies button under currency$/) do
  within('.lbBodyDescription') do
    if find_button("Manage Currencies", :match => :prefer_exact).visible?
      find_button("Manage Currencies", :match => :prefer_exact).click
    end
  end
end

When(/^I check that currency shows USD and CAD$/) do
  within all('.pbBody')[0] do
    table = all("tbody")[0]
    sleep 2
		currency_code_1 = table.all('tr')[1].all('th')[0].text.to_s
#    puts currency_code_1
    if currency_code_1 == "CAD"
      puts "CAD is visible under Active Currencies"
    else
      writeFailure "CAD is not visible under Active Currencies"
    end
    currency_code_2 = table.all('tr')[2].all('th')[0].text.to_s
#    puts currency_code_2
    if currency_code_2 == "USD"
      puts "USD is visible under Active Currencies"
    else
      writeFailure "USD is not visible under Active Currencies"
    end
  end
end

Given(/^I check that Stage_Closed_Sale rule Active checkbox should be unchecked$/) do
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[11]/td[6]/img[@alt='Not Checked']")
    puts "Stage Closed Sale rule Active checkbox is unchecked"
  else
    writeFailure "Stage Closed Sale rule Active checkbox is checked"
  end
end

Given(/^I check that Expected_Booking_Date_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Expected_Booking_Date_Required")
    puts "Expected_Booking_Date_Required rule is available"
    if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[7]/td[5]/img[@alt='Checked']")
      puts "Expected_Booking_Date_Required rule Active checkbox is checked"
    else
      writeFailure "Expected_Booking_Date_Required rule Active checkbox is unchecked"
    end
  else
    writeFailure "Expected_Booking_Date_Required rule is not available"
  end  
end

Given(/^I check that Expected_Total_Booking_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Expected_Total_Booking_Required")
    puts "Expected_Total_Booking_Required rule is available"
  else
    writeFailure "Expected_Total_Booking_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[8]/td[5]/img[@alt='Checked']")
    puts "Expected_Total_Booking_Required rule Active checkbox is checked"
  else
    writeFailure "Expected_Total_Booking_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Forecast_Status_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Forecast_Status_Required")
    puts "Forecast_Status_Required rule is available"
  else
    writeFailure "Forecast_Status_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[9]/td[5]/img[@alt='Checked']")
    puts "Forecast_Status_Required rule Active checkbox is checked"
  else
    writeFailure "Forecast_Status_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that New_Contract_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("New_Contract_Required")
    puts "New_Contract_Required rule is available"
  else
    writeFailure "New_Contract_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[11]/td[5]/img[@alt='Checked']")
    puts "New_Contract_Required rule Active checkbox is checked"
  else
    writeFailure "New_Contract_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Term_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Term_Required")
    puts "Term_Required rule is available"
  else
    writeFailure "Term_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[16]/td[5]/img[@alt='Checked']")
    puts "Term_Required rule Active checkbox is checked"
  else
    writeFailure "Term_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Order_ID_Required rule is available and active checkbox is checked$/) do
 sleep 3
  if page.has_content?("Order_ID_Required")
    puts "Order_ID_Required rule is available"
  else
    writeFailure "Order_ID_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[13]/td[5]/img[@alt='Checked']")
    puts "Order_ID_Required rule Active checkbox is checked"
  else
    writeFailure "Order_ID_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Lead_Status_Booked rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Lead_Status_Booked")
    puts "Lead_Status_Booked rule is available"
  else
    writeFailure "Lead_Status_Booked rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[10]/td[5]/img[@alt='Checked']")    
    puts "Lead_Status_Booked rule Active checkbox is checked"
  else
    writeFailure "Lead_Status_Booked rule Active checkbox is unchecked"
  end
end

Given(/^I check that Actual_Booking_Date_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("Actual_Booking_Date_Required")
    puts "Actual_Booking_Date_Required rule is available"
  else
    writeFailure "Actual_Booking_Date_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[3]/td[5]/img[@alt='Checked']")
    puts "Actual_Booking_Date_Required rule Active checkbox is checked"
  else
    writeFailure "Actual_Booking_Date_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Actual_Booking_Amount_Required is available and active checkbox is checked$/) do
 sleep 3
  if page.has_content?("Actual_Booking_Amount_Required")
    puts "Actual_Booking_Amount_Required rule is available"
  else
    writeFailure "Actual_Booking_Date_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[2]/td[5]/img[@alt='Checked']")
    puts "Actual_Booking_Amount_Required rule Active checkbox is checked"
  else
    writeFailure "Actual_Booking_Amount_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that Primary_Reason_Required rule is available and active checkbox is checked$/) do
 sleep 3
  if page.has_content?("Primary_Reason_Required")
    puts "Primary_Reason_Required rule is available"
  else
    writeFailure "Primary_Reason_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[14]/td[5]/img[@alt='Checked']")
    puts "Primary_Reason_Required rule Active checkbox is checked"
  else
    writeFailure "Primary_Reason_Required rule Active checkbox is unchecked"
  end
end

Given(/^I check that New_MRR_Required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("New_MRR_Required")
    puts "New_MRR_Required rule is available"
  else
    writeFailure "New_MRR_Required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[12]/td[5]/img[@alt='Checked']")
    puts "New_MRR_Required rule Active checkbox is checked"
  else
    writeFailure "New_MRR_Required rule Active checkbox is unchecked"
  end
end


Given(/^I check that Reason_Code_Change rule is available and active checkbox is checked$/) do
   sleep 3
  if page.has_content?("Reason_Code_Change")
    puts "Reason_Code_Change rule is available"
  else
    writeFailure "Reason_Code_Change rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[12]/td[6]/img[@alt='Checked']")
    puts "Reason_Code_Change rule Active checkbox is checked"
  else
    writeFailure "Reason_Code_Change rule Active checkbox is unchecked"
  end
end

Given(/^I check that offset_c rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("offset_c")
    puts "offset_c rule is available"
  else
    writeFailure "offset_c rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[7]/td[6]/img[@alt='Checked']")
    puts "offset_c rule Active checkbox is checked"
  else
    writeFailure "offset_c rule Active checkbox is unchecked"
  end
end

Given(/^I check that health_status_reason_required rule is available and active checkbox is checked$/) do
  sleep 3
  if page.has_content?("health_status_reason_required")
    puts "health_status_reason_required rule is available"
  else
    writeFailure "health_status_reason_required rule is not available"
  end
  if page.has_xpath?(".//*[@id='ValidationFormulaList_body']/table/tbody/tr[2]/td[6]/img[@alt='Checked']")
    puts "health_status_reason_required rule Active checkbox is checked"
  else
    writeFailure "health_status_reason_required rule Active checkbox is unchecked"
  end
end


#Given(/^I check that health_status_reason_required__c rule is available and active checkbox is checked$/) do
#   if page.has_content?("health_status_reason_required__c")
#    puts "health_status_reason_required__c rule is available"
#  else
#    writeFailure "health_status_reason_required__c rule is not available"
#  end
#   if page.has_xpath?("")
#    puts "health_status_reason_required rule Active checkbox is checked"
#  else
#    writeFailure "health_status_reason_required rule Active checkbox is unchecked"
#  end
#end

Then(/^I check that list of Active User should match with the username in config workbook user tab$/) do
  puts "avtive users given in config workbook user tab are : CiscoWebex1, Qualtrics and Team, Queue"
  within all('.bNext')[0] do    
    within('.fBody') do      
      if page.has_select?("View:")
        select("Active Users", :from => "View:")        
      end
    end
  end
  sleep 4
  within('.pbBody') do
    if page.has_content?("CiscoWebex1, Qualtrics")
      puts "CiscoWebex1, Qualtrics batch job is enabled and an active user"
    else
      puts "CiscoWebex1, Qualtrics batch job is not enabled"
    end
    if page.has_content?("Team, Queue")
      puts "Team, Queue batch job is enabled and an active user"
    else
      puts "Team, Queue batch job is not enabled"
    end
  end
end

When(/^I search for scheduled jobs in quick search bar$/) do
  within('.searchBoxContainer') do
    sleep 4
    fill_in("Quick Find / Search...", :with=> "Scheduled Jobs")
  end
end

When(/^I ckeck that "([^"]*)" batch job is enabled$/) do |arg1|
  within('.pbBody') do
    if page.has_content?(arg1)
      puts "#{arg1} batch job is enabled"
    else
      puts "#{arg1} batch job is not enabled"
    end
  end
end

Then(/^I click on manage and verify frequency of "([^"]*)"$/) do |arg1|
  sleep 2
  if page.has_content?(arg1)
    if page.has_xpath?("//th[contains(text(),'#{arg1}')]/preceding-sibling::td/a[contains(text(),'Manage')]")
      find(:xpath, "//th[contains(text(),'#{arg1}')]/preceding-sibling::td/a[contains(text(),'Manage')]").click
      puts "clicked on mangae link of #{arg1}"
    else
      writeFailure "#{arg1} is not enabled"
    end
    sleep 4
    within('.outerBox') do
      if page.has_field?("Preferred Start Time")
        actual_run_time = find_field("Preferred Start Time").value
        expected_run_time = "1:00 AM"
        if actual_run_time == expected_run_time
          puts "Run hour is 1:00 AM"
        else
          writeFailure "Run hour is #{actual_run_time}"
        end
      end
    end
  else
    writeFailure "#{arg1} is not enabled"
  end
end

When(/^I verify that "([^"]*)" is available and an active user$/) do |arg1|
  within all('.bNext')[0] do
      within('.fBody') do
        if page.has_select?("View:")
          select("Active Users", :from => "View:")
        end
      end
     end
     sleep 4
     within('.pbBody') do
       if page.has_content?(arg1)
        puts "#{arg1} is available and an active user"
    else
       writeFailure "#{arg1} is not available"
    end
  end
end

Then(/^I check that "([^"]*)" is available active user with SSI Zenith Sales Profile$/) do |arg1|
  sleep 5
    within all('.bNext')[0] do      
      within('.fBody') do        
        if page.has_select?("View:")
          select("Active Users", :from => "View:")          
        end
      end
     end
     sleep 4
     within('.pbBody') do
       if page.has_content?(arg1)
         puts "#{arg1} is available and an active user"
        click_link(arg1)
        sleep 2
      else
        writeFailure "#{arg1} is not available"
      end
     end
    within(:id,'topButtonRow') do
    if find(:button, "Edit").visible?
      click_on "Edit"
    end
   end
   within all('.pbSubsection')[0] do
#     actual_value = find_field("Profile").value
#     expected_value = "SSI Zenith Sales"
#     if actual_value == expected_value
    if page.has_select?("Profile", :selected => "SSI Zenith Sales")
       puts "profile for #{arg1} is SSI Zenith Sales"
     else
      writeFailure "profile for #{arg1} is  not SSI Zenith Sales"
     end
  end
end
