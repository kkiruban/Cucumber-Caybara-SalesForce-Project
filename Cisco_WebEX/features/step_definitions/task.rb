Given(/^I click on new button under my task section$/) do
  sleep 5
  within all('.bRelatedList')[0] do
    puts "My Task section"
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button under My Task section"
    end
  end
end

When(/^I select "([^"]*)" from record type of new record$/) do |arg1|
  select arg1, :from => "Record Type of new record"
  @@record_type = arg1.to_s
  if find(:button,'Continue').visible?
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end

Then(/^I enter data to all the mandatory fields$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 10
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Admin")
        fill_in("lksrch",:with=> "DSIntegration Admin")
      end
    end
  end
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 25
    if (ENV['UserRole'] == "nalaopsmgrsit")
      click_on "Operations Manager CiscoAdopt NALA"
      puts "assigned to Operations Manager CiscoAdopt NALA"
      sleep 2
    else if (ENV['UserRole'] == "nalaopsrepsit")
        click_on "Operations Rep NALA CiscoAdopt"
        puts "assigned to Operations Rep NALA CiscoAdopt"
        sleep 2
      else if (ENV['UserRole'] == "nalasalesmgrsit")
          click_on "Sales Manager NALA CiscoAdopt"
          puts "assigned to Sales Manager NALA CiscoAdopt"
          sleep 2
        else if (ENV['UserRole'] == "nalasalesrepsit")
            click_on "Sales Rep NALA CiscoAdopt"
            puts "assigned to Sales Rep NALA CiscoAdopt"
            sleep 2
          else if (ENV['UserRole'] == "Admin")
              click_on "DSIntegration Admin"
              puts "assigned to Saswata Mukerji"
              sleep 2
            else if (ENV['UserRole'] == "nalasalesopssit")
                click_on "Sales Ops NALA CiscoAdopt"
                puts "assigned to Sales Ops NALA CiscoAdopt"
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

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 10
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 2
  page.driver.browser.switch_to.window(main)
  sleep 2

  page.driver.browser.switch_to.window(main)
  sleep 4
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 10
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 4


  within all(".pbSubsection")[1] do
    if page.has_select?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_select?("Status")
      select("Not Started", :from => "Status")
    end
  end
  within all(".pbSubsection")[2] do
    @subject_3 = @@record_type + "_smoketest_" + Random.new.rand(01..20000).to_s
    puts @subject_3
    fill_in "Comments",:with => "test"
    sleep 2
    fill_in "Subject", :with => @subject_3
    if page.has_select?("Health Status Reason")
      select("Past due invoices", :from => "Health Status Reason")
    end
    if page.has_select?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
  fill_in "Due Date",:with => "9/27/2016"
end

When(/^I select account name in the related lookup field$/) do
  within all('.pbSubsection')[1] do
    sleep 2
    if page.has_select?("tsk3_mlktp")
      select("Account", :from => "tsk3_mlktp")
    end
  end
  sleep 4 
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 3
  find_button('Go!').click
  sleep 3
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 4
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I click on just created "([^"]*)" link$/) do |arg1|
  puts "record type is #{arg1}"
  sleep 2
  if page.has_select?("tasklist_mode")
    select("All Open", :from => "tasklist_mode")
    puts "All Open Tasks are selected"
  end
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 2
  within all(".pbBody")[1] do
    sleep 2
    puts @subject_3
    find_link(@subject_3).visible?
    puts "#{@subject_3} is available"
    #    click_link(@subject_3, :match => :first)
    click_link(@subject_3)
    sleep 3
  end
end

When(/^I select "([^"]*)" from status picklist field$/) do |arg1|
  within all('.pbSubsection')[1] do
    sleep 2
    if page.has_select?("Status")
      select(arg1, :from => "Status")
    end
  end
end

Then(/^I click on account name from related to field$/) do
  within all('.pbSubsection')[0] do
    #    find(:id,"tsk3_ileinner").click # this id will work but i have given scoping
    table = all("tbody")[0]
		sleep 2
	  table.all('tr')[0].all('td')[3].all('div')[0].all('a')[0].click
  end
end

And(/^I verify health status reason$/) do
  sleep 5
  within all('.pbSubsection')[1] do
    sleep 2
    expected_value = "Past due invoices"
    actual_value = find(:id, "00N3600000Ea10p_ileinner").text.to_s
    puts actual_value
    if actual_value == expected_value
      puts "Health Status Reason value in task: #{expected_value} is equal to Health Status Reason value in account: #{actual_value}"
    else
      writeFailure "Health Status Reason value in task and account are not equal"
    end   
  end
end

Then(/^I check that health status reason is available under task details section$/) do
  within all('.pbSubsection')[2] do
    if page.has_field?("Health Status Reason")
      puts "health status reason field is available under task details section"
    else
      writeFailure "health status reason field is not available under task details section"
    end
  end
end

Then(/^I check that waiting on someone else option is not available in status picklist$/) do
  if page.has_select?("Status")
    if page.has_xpath?("//select[@id='tsk12']/option[@value='Waiting on someone else']")
      writeFailure "status picklist contains Waiting on someone else option"
    else
      puts "status picklist does not contain Waiting on someone else option"
    end
  else
    puts "Status picklist field does is not available"
  end
end

Then(/^I check that completed unsuccessfully option is available in status picklist$/) do
  if page.has_select?("Status")
    if page.has_xpath?("//select[@id='tsk12']/option[@value='Completed Unsuccessfully']")
      puts "status picklist contains Completed Unsuccessfully option"
    else
      writeFailure "status picklist does not contain Completed Unsuccessfully option"
    end
  else
    puts "Status picklist field does is not available"
  end
end

Then(/^I check that deferred option is not available in status picklist$/) do
  if page.has_select?("Status")
    if page.has_xpath?("//select[@id='tsk12']/option[@value='Deffered']")
      writeFailure "status picklist contains Deferred option"
    else
      puts "status picklist does not contain Deferred option"
    end
  else
    puts "Status picklist field does is not available"
  end
end

Then(/^I select "([^"]*)" from "([^"]*)" picklist field$/) do |arg1, arg2| 
  if page.has_select?(arg2)
    select(arg1, :from => arg2)
  end
end

Then(/^I click on "([^"]*)" button from task page$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
  if page.has_content?("Health Status Reason is Required when Status = Completed & Task Record Type = Health Check")
    puts "not saved successfully"
  else    
    writeFailure "saved successfully"
  end
  sleep 3
end

When(/^I check that "([^"]*)" button is not visible/) do |value|
  sleep 3
  within(:id,'topButtonRow') do
    if page.has_no_button?(value)
      puts "#{value} button is not available"
    else
      puts "#{value} button is available"
    end
  end
end

When(/^I check that "([^"]*)" button should be visible$/) do |value|
  sleep 3
  within(:id,'topButtonRow') do
    if page.has_button?(value)
      puts "#{value} button is available"
    else
      puts "#{value} button is not available"
    end
  end
end

Then(/^I check that the picklist value of select task record type$/) do
  sleep 2
  #    if page.has_xpath?(".//*[@id='p3']/option[@value='Task - Health Check']")
  if page.has_xpath?("//select[@id='p3']/option[@value='012R0000000DIYO']")
    puts "Record Type of new record picklist contains Task - Health Check option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Health Check option"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[@value='01236000000Bfum']")
    puts "Record Type of new record picklist contains Task - Standard option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Standard option"

  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[@value='01236000000Bful']")
    puts "Record Type of new record picklist contains Task - Phone Calls option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Phone Calls option"
  end
end

When(/^I enter data in mandatory fields$/) do
  begin
    if page.has_xpath?('//label[text()="Priority"]')
      find(:xpath, '//label[text()="Priority"]/parent::td/following-sibling::td[1]//select').select "High"
      #puts "Entered data in Priority"
    else
      writeFailure "Fail to entered data in Priority"
    end

    if page.has_xpath?('//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input').set "Call"
      #puts "Data in - Subject - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Subject - field"
    end
    if page.has_xpath?('//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea')
      find(:xpath, '//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea').set "Testing"
      #puts "Data in - Comments - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Comments - field"
    end
    if page.has_xpath?('//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select').select "Not Started"
      #puts "Data in - Status - field has been entered"
      #fail(ArgumentError.new('Fail'))
    else
      writeFailure "Fail to enter data in - Status - field"
    end
    if page.has_xpath?('//label[text()="Related To"]')
      find(:xpath, '//label[text()="Related To"]/parent::td/following-sibling::td[1]//select').select "Account"
      #puts "Entered data in Priority"
    else
      writeFailure "Fail to entered data in -- Related To --  dropdown"
    end
    if page.has_xpath?('//label[text()="Related To"]/parent::td[1]/following-sibling::td[1]//span/input')
      find(:xpath, '//label[text()="Related To"]/parent::td[1]/following-sibling::td[1]//span/input').set "Cisco Webex"
    else
      writeFailure "Fail to enter data in - Related To - field"
    end
    if page.has_xpath?('//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input')
      find(:xpath, '//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input').set "Michael Testa"
    else
      writeFailure "Fail to enter data in - Name - field"
    end


    if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
      find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    end
    if page.has_content?("Error: Invalid Data.")
      writeFailure "Task NOT saved successfully due to Invalid Data. "
    else
      puts "Activity History record created successfully"
    end
  end
end