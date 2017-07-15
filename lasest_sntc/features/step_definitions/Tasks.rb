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
  if find(:button,'Continue').visible?
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end

When(/^I check that "([^"]*)" field is visible under task details section$/) do |arg1|
  sleep 2
  within all('.pbSubsection')[2] do
    if page.has_field?(arg1)
      puts "#{arg1} field is visible under task details section"
    else
      writeFailure "#{arg1} field is not visible under task details section"
    end
  end
end

When(/^I check that "([^"]*)" field is a mandatory field$/) do |arg1|
  if page.has_xpath?('.//label[contains(text(),"'"#{arg1}"'")]/parent::td[contains(@class ,"requiredInput")]')
    puts "#{arg1} field is present and is a required field"
  else
    writeFailure "#{arg1} field is not required field"
  end
end

When(/^I check that health check field is editable$/) do
  if page.has_field?("Health Check #")
    puts "Health Check # field is editable"
  else
    writeFailure "Health Check # field is not editable"
  end
end

Then(/^I check that task phone calls task record type is removed from the list of tasks$/) do
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[@value='012360000005um4']")
    writeFailure "Record Type of new record picklist contains Task - Phone Calls option"
  else
    puts "Record Type of new record picklist does not contain Task - Phone Calls option"
  end
end

When(/^I check that valut for srev amount is not populated$/) do
  sleep 5
  within all(".pbSubsection")[2] do
    if page.has_field?("SREV Amount")
      puts "SREV Amount field is editable"
      fill_in "SREV Amount",:with => ""
    else
      writeFailure "SREV Amount field is not editable"
    end
  end
end

Given(/^I check "([^"]*)" is visible and editable$/) do |arg1|
  sleep 5
  within all(".pbSubsection")[1] do
    if page.has_content?(arg1)
      puts "#{arg1} is visible"
    else
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      puts "#{arg1} is editable"
      find_field(arg1).click
    else
      writeFailure "#{arg1} field is not editable"
    end
  end
end

Given(/^I check the sub task type picklist value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000KNeSP')
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000KNeSP')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["sub_task_type"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "task subtype field is not editable"
    end
  end
end

Then(/^I check "([^"]*)" field is visible and editable$/) do |arg1|
  sleep 5
  within all(".pbSubsection")[2] do
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
      find_field(arg1).click
    else
      writeFailure "lead id field is not visible"
    end
    if page.has_field?(arg1)
      puts "#{arg1} field is visible"
      find_field(arg1).click
    else
      writeFailure "lead id field is not visible"
    end
  end
end

Then(/^I check whether lead id field accepts text$/) do
  if page.has_field?("00N3600000IS7ag")
    puts "lead id field is editable"
    fill_in "00N3600000IS7ag",:with => "test"
  else
    writeFailure "lead id field is not editable"
  end
  if page.has_field?('00N3600000IS7ag', :type => 'text') == true
    puts "Escalation field is a text field"
  else
    writeFailure "Escalation field is not a text field"
  end
end

Then(/^I check srev amount field accepts numeric$/) do
  sleep 5
  within all(".pbSubsection")[2] do
    if page.has_field?("SREV Amount")
      puts "SREV Amount field is editable"
      fill_in "SREV Amount",:with => "abc"
    else
      writeFailure "SREV Amount field is not editable"
    end
  end
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, "Save").visible?
      click_on "Save"
    end
  end
  sleep 2
  within all(".dataCol")[15] do
    if page.has_content?(" Invalid number")
      puts "SREV Amount field accepts numeric value"
    else
      writeFailure "SREV Amount accepts text value"
    end
    sleep 2
  end
end

Then(/^I check cisco amount field accepts numeric$/) do
  sleep 5
  within all(".pbSubsection")[2] do
    if page.has_field?("Cisco Amount")
      puts "Cisco Amount field is editable"
      fill_in "Cisco Amount",:with => "abc"
    else
      writeFailure "Cisco Amount field is not editable"
    end
  end
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, "Save").visible?
      click_on "Save"
    end
  end
  sleep 2
  within all(".dataCol")[17] do
    if page.has_content?(" Invalid number")
      puts "Cisco Amount field accepts numeric value"
    else
      writeFailure "Cisco Amount accepts text value"
    end
    sleep 2
  end
end

Then(/^I enter value to all the mandatory fields$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Sales")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    #    table=all("tbody")[0]
    sleep 2
    #    table.all('tr')[1].all('th')[0].find('a').click
    click_on "Sales Ops NALA CiscoAdopt"
    #    find("Sales Ops NALA CiscoAdopt").click
    puts "clicked"
    sleep 2
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_contact 01")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_ops01")
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
  within all(".pbSubsection")[1] do

    if page.has_field?("Sub Task Type")
      select("CTAS", :from => "Sub Task Type")
    else
      puts "Sub Task Type fiels is not present for current record type"
    end
    select("Normal", :from => "tsk13")
    if page.has_field?("00N3600000IS7ae")
      select("AMP", :from => "00N3600000IS7ae")
    else
      puts "product field is not editable"
    end
    select("Not Started", :from => "Status")
  end
  within all(".pbSubsection")[2] do
    @subject_1 = "PES automation testing" + Random.new.rand(189654..9989789).to_s
    puts @subject_1
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => @subject_1
    sleep 2
    if page.has_select?("00N3600000D0q4H")
      select("Incoming", :from => "00N3600000D0q4H")
      puts "Value for Direction field is selected"
    end
    if page.has_field?("00N3600000IS7ag")
      puts "Lead ID field is present for this user"
      fill_in "00N3600000IS7ag", :with => "01"
    else
      puts "Lead ID field is not present for this user"
    end
    if page.has_field?("00N3600000IS7aZ")
      puts "SREV Amount field is present"
      fill_in "00N3600000IS7aZ", :with => "100"
    else
      puts "SREV Amount field is not present for this user"
    end
  end
  within all(".pbSubsection")[3] do
    if page.has_field?("00N3600000IS7ab")
      fill_in "00N3600000IS7ab", :with => "10"
    else
      puts "SREV Health Score is not editable"
    end
    if page.has_field?("00N3600000JH9R8")
      select("1", :from => "00N3600000JH9R8")
    else
      puts "Health Check # field is not editable"
    end
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

Then(/^I login as "([^"]*)"$/) do |value|
  if value=="sales ops"
    visit env
    fill_in "Username",:with => 'ciscoadopt.salesops@servicesource.com.sitadopt'
    fill_in "Password",:with => 'testciscoadopt123!'
    find(:id,"Login").click
    sleep 3
  end
  if value=="admin"
    visit env
    fill_in "Username",:with => 'dsintegration-admin@servicesource.com.sitadopt'
    fill_in "Password",:with => 'srevds123!'
    find(:id,"Login").click
    sleep 3
  end
end

When(/^I check whether "([^"]*)" field is visible and read only$/) do |arg1|
  within all('.pbSubsection')[0] do
    if page.has_content?(arg1)
      sleep 3
      puts "#{arg1} field is visible"
    else
      #      fail(ArgumentError.new(arg1 + 'field is not visible'))
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      sleep 3
      #      fail(ArgumentError.new(arg1 + 'field is not read only'))
      writeFailure "#{arg1} field is not read only"
    else
      puts "#{arg1} field is read only"
    end
  end
end

When(/^I check "([^"]*)" field is visible and read only$/) do |arg1|
 within all('.pbSubsection')[1] do
    if page.has_content?(arg1)
      sleep 3
      puts "#{arg1} field is visible"
    else
      #      fail(ArgumentError.new(arg1 + 'field is not visible'))
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      sleep 3
      #      fail(ArgumentError.new(arg1 + 'field is not read only'))
      writeFailure "#{arg1} field is not read only "
    else
      puts "#{arg1} field is read only"
    end
  end
end

When(/^I click on any existing zenith task lead link in my task section$/) do
  #  within(".bMyTask") do
  #    sleep 2
  #    if page.has_content?("View More >>")
  #      sleep 2
  #      within(".pShowMore") do
  #        find(:xpath, "//a[contains(text(),'View More')]").click
  #      end
  #    else
  #      puts "No view more link is available"
  #    end
  #    sleep 4
  sleep 5
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  within  all(".pbBody")[1] do
    sleep 2
    puts @subject_1
    find_link(@subject_1).visible?
    click_link(@subject_1)
    sleep 5
  end
end

Given(/^I check "([^"]*)" drop down field is visible and editable$/) do |arg1|
 sleep 5
  within all(".pbSubsection")[1] do
    if page.has_select?(arg1)
      puts "#{arg1} field is editable"
      find_field("00N3600000IS7ae").click
    else
      #      fail(ArgumentError.new(arg1 + 'field is not editable'))
      writeFailure "#{arg1} field is not editable"
    end
  end
end

Then(/^I check "([^"]*)" is visible or not$/) do |arg1|
 sleep 5
  within all(".pbSubsection")[3] do
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      #      fail(ArgumentError.new(arg1 + 'field is not visible'))
      writeFailure "#{arg1} field is not visible"
    end
  end
end

When(/^I click on any existing "([^"]*)" link in my task section$/) do |arg1|
  puts arg1
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
  sleep 4
  within all(".pbBody")[1] do
    sleep 2
    puts @subject_1
    find_link(@subject_1).visible?
    click_link(@subject_1)
    sleep 5
  end
end

When(/^I check that "([^"]*)" field is visible and read only$/) do |arg1|
 within all('.pbSubsection')[2] do
    if page.has_content?(arg1)
      sleep 3
      puts "#{arg1} field is visible"
    else
      #      fail(ArgumentError.new(arg1 + 'field is not visible'))
      writeFailure "#{arg1} field is not visible"
    end
  end
end

Then(/^I enter data to all the mandatory fields$/) do
 page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  if (ENV['UserRole'] == "nalaopsmgrsit") || (ENV['UserRole'] == "nalaopsrepsit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "nalasalesmgrsit") || (ENV['UserRole'] == "nalasalesrepsit") || (ENV['UserRole'] == "nalasalesopssit")
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
    if (ENV['UserRole'] == "nalaopsmgrsit")
#      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager NALA CiscoAdopt"
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
              puts "assigned to DSIntegration Admin"
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
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_contact 01")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_ops01")
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

  within all(".pbSubsection")[1] do
    if page.has_field?("Sub Task Type")
      select("CTAS", :from => "Sub Task Type")
    else
      puts "Sub Task Type fiels is not present for current record type"
    end
    #    select("Email", :from => "TaskSubtype")
    select("Normal", :from => "tsk13")
    if page.has_field?("00N3600000IS7ae")
      select("SNTC", :from => "00N3600000IS7ae")
    else
      puts "Product field is not editable"
    end
    select("Not Started", :from => "Status")
  end
  within all(".pbSubsection")[2] do
    @subject_3 = "PES automation testing" + Random.new.rand(10000..20000).to_s
    puts @subject_3
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => @subject_3
    if page.has_field?("00N3600000IS7ag")
      fill_in "00N3600000IS7ag", :with => 01
    end
    if page.has_select?("00N3600000D0q4H")
      select("Incoming", :from => "00N3600000D0q4H")
      puts "Direction field is entered"
    end
    if page.has_field?("00N3600000IS7aZ")
      puts "SREV Amount field is present"
      fill_in "00N3600000IS7aZ", :with => "100"
    else
      puts "SREV Amount field is not present for this user"
    end
  end
  within all(".pbSubsection")[3] do
    if page.has_field?("00N3600000IS7ab")
      fill_in "00N3600000IS7ab", :with => "10"
    else
      puts "SREV Health Score is not editable"
    end
    if page.has_field?("00N3600000JH9R8")
      select("1", :from => "00N3600000JH9R8")
    else
      puts "Health Check # field is not editable"
    end
  end
end

When(/^I click on any existing "([^"]*)" link$/) do |arg1|
  puts "record type is #{arg1}"
  sleep 5
  if page.has_select?("tasklist_mode")
    select("All Open", :from => "tasklist_mode")
    puts "All Open Tasks are selected"
  end
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 5
  within all(".pbBody")[1] do
    sleep 5
    puts @subject_3
    find_link(@subject_3).visible?
    puts "#{@subject_3} is available"
    click_link(@subject_3, :match => :first)
    sleep 6
  end
end

When(/^I click on any one of the existing "([^"]*)" link$/) do |arg1|
  puts "record type is #{arg1}"
  sleep 5
  if page.has_select?("tasklist_mode")
    select("All Open", :from => "tasklist_mode")
    puts "All Open Tasks are selected"
  end
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 5
  within all(".pbBody")[1] do
    sleep 5
    puts @subject_3
    find_link(@subject_3).visible?
    puts "#{@subject_3} is available"
    click_link(@subject_3)
    puts "clicked on #{@subject_3}"
    sleep 10
  end
end

When(/^I delete lead id value from task details section$/) do
  within all('.pbSubsection')[2] do
    sleep 3
    fill_in "00N3600000IS7ag",:with =>" "
  end
end

When(/^I select "([^"]*)" from status picklist field$/) do |arg1|
  within all('.pbSubsection')[1] do
    sleep 2
    select(arg1, :from => "tsk12")
    sleep 2
  end
end

When(/^I update lead id with value$/) do
  sleep 2
  within all('.pbSubsection')[2] do
    fill_in "00N3600000IS7ag",:with => "1" + Random.new.rand(13..890).to_s
  end
end

Then(/^I update sub task type field$/) do
  sleep 2
  within all('.pbSubsection')[1] do
    select("CTAS", :from => "Sub Task Type")
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
  #if (page.has_content?("Lead cannot be Closed Successfully or Closed Unsuccessfully without Lead ID field populated") || page.has_content?('The following fields cannot be blank: Task SubType'))
  #if page.has_content?("• The following fields cannot be blank: Lead ID") || page.has_content?("• The following fields cannot be blank: Sub Task Type")
  if page.has_content?("Review all error messages below to correct your data.")
    puts "not saved successfully"
  else
    #    fail(ArgumentError.new('saved successfully'))
    writeFailure "saved successfully"
  end
  sleep 3
end

When(/^I delete task subtype value from task details section$/) do
  sleep 5
  within all('.pbSubsection')[1] do
    if page.has_field?("00N3600000KNeSP")
      sleep 2
      select("--None--",:from => "00N3600000KNeSP")
      sleep 2
    else
      writeFailure "Sub Task Type field is not available"
    end
  end
end

When(/^I update task subtype with a value$/) do
  sleep 4
  within all('.pbSubsection')[1] do
    if page.has_field?("00N3600000KNeSP")
      sleep 2
      select("LDoS",:from => "00N3600000KNeSP")
      sleep 2
    else
      writeFailure "task subtype field is not avaible"
    end
  end
end

When(/^I delete srev health score value$/) do
  sleep 2
  within all('.pbSubsection')[3] do
    if page.has_field?("00N3600000IS7ab")
      fill_in "00N3600000IS7ab",:with =>""
    else
      writeFailure "srev health score is not editable"
    end
  end
end

When(/^I update srev health score with a value$/) do
  within all('.pbSubsection')[3] do
    if page.has_field?("00N3600000IS7ab")
      puts "srev health score is editable"
      fill_in "00N3600000IS7ab",:with =>"10"
    else
      writeFailure "srev health score field is not editable"
    end
  end
end

When(/^I check that "([^"]*)" button is not available$/) do |value|
  sleep 3
  within(:id,'topButtonRow') do
    if page.has_no_button?(value)
      puts "#{value} button is not available"
    else
      #    fail(ArgumentError.new(value + 'button is available'))
      writeFailure "#{value} button is available"
    end
  end
end

When(/^I check that "([^"]*)" button should be available$/) do |value|
  sleep 10
  within(:id,'topButtonRow') do
    #if page.has_button?(value)
    if find_button(value).visible?
      puts "#{value} button is available"
    else
      #    fail(ArgumentError.new(value + 'button is not available'))
      writeFailure "#{value} button is not available"
    end
  end
end

#When(/^I check that Task State field is available under CSM Details section$/) do
#  sleep 2
#  within all('.pbSubsection')[3] do
#    sleep 4
#    if page.has_field?("00N3600000CzfY4")
#      puts "#{value} field is not available under CSM Details section"
#    else
##      fail(ArgumentError.new(value + 'field is available under CSM Details section'))
#      puts "field is available under CSM Details section"
#    end
#  end
#end


When(/^I check that "([^"]*)" field is not available under CSM Details section$/) do |value|
  sleep 2
  within all('.pbSubsection')[3] do
    if page.has_no_field?(value)
      puts "#{value} field is not available under CSM Details section"
    else
      #      fail(ArgumentError.new(value + 'field is available under CSM Details section'))
      writeFailure "field is available under CSM Details section"
    end
  end
end

Then(/^I check that "([^"]*)" field is available under CSM Details section$/) do |value|
  sleep 5
  within all('.pbSubsection')[3] do
    sleep 5
    if page.has_content?(value)
#    if find_field(value).visible?
      puts "#{value} field is available under CSM Details section"
    else
      #        fail(ArgumentError.new(value + ' field is not available under CSM Details section'))
      writeFailure "field is not available under CSM Details section"
    end
  end
end


Then(/^I check that success plan play field is available under CSM Details section$/) do
  sleep 5
  #   find(:xpath, ".//*[@id='CF00N3600000CzfXq']").visible?
  page.find(:xpath, "//*[contains(@name, 'CF00N3600000CzfXq')]")
  puts "success plan play field is available under CSM Details section"
end

Then(/^I check the picklist value of cisco health status field$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
   # if page.has_select?('00N3600000JH9RN')
    if page.has_select?('00NP00000014EA3')
      puts "Cisco Health Status is present and a picklist field"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@name, '00NP00000014EA3')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["cisco_health_status"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('Cisco Health Status picklist is not present'))
      writeFailure "Cisco Health Status picklist is not present"
    end
  end
end

When(/^I check product field is visible under task information section$/) do
  sleep 2
  within all('.pbSubsection')[1] do
    if find_field("00N3600000IS7ae").visible?
      puts "product field is visible under task information section"
    else
      #      fail(ArgumentError.new('product field is not available under task information section'))
      writeFailure "product field is not available under task information section"
    end
  end
end

Then(/^I check product picklist values under task information section$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7ae')
      puts "Product field type is picklist"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000IS7ae')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["product"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('product field is not editable'))
      writeFailure "product field is not editable"
    end
  end
end

Then(/^I check "([^"]*)" field is visible or not$/) do |value|
  sleep 2
  within all('.pbSubsection')[1] do
    if find_field(value).visible?
      puts "#{value} field is visible under task information section"
    else
      #      fail(ArgumentError.new(value + ' field is not available under task information section'))
      writeFailure "#{value} field is not available under task information section"
    end
  end
end

Then(/^I check escaltion field is visible or not$/) do
  if page.has_field?('00N3600000JH9UR')
    puts "Escalation field is visible"
  else
    #      fail(ArgumentError.new('Escalation field is not visible'))
    writeFailure "Escalation field is not visible"
  end
end

Then(/^I check whether the type of escalation field is checkbox and editable$/) do
  if page.has_field?('00N3600000JH9UR', :type => 'checkbox') == true
    puts "Escalation field is a checkbox"
  else
    #    fail(ArgumentError.new('Escalation field is not a checkbox'))
    writeFailure "Escalation field is not a checkbox"
  end
  find(:xpath,".//*[@id='00N3600000JH9UR']").click
  puts "Escalation field is editable"
end

Then(/^I check status picklist values$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('tsk12')
      puts "status is present and a picklist field"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@name, 'tsk12')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["status"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('status picklist is not present'))
      writeFailure "status picklist is not present"
    end
  end
end

Then(/^I open an exiting account$/) do
  sleep 5
  arg = getTaskDetails 'task_details'
  within(".searchCell") do
    fill_in "Search...",:with=> @@acc_name
    sleep 5
    page.find(:id, "phSearchButton").click
  end
  within all(".pbBody")[0] do
    click_on @@acc_name
  end
end


Then(/^I note the value of "([^"]*)" field under sntc section$/) do |value|
  sleep 10
  within all('.pbSubsection')[2] do
    if value=="SNTC SREV Health Score"
      @SNTC_SREV_Health_Score = find(:id, "00N3600000JH0Zp_ileinner").text.to_f
      puts "SNTC SREV Health Score value is: #{@SNTC_SREV_Health_Score}"
    end
    if value=="SNTC Features"
      @SNTC_Features = find(:id, "00N3600000JH2IO_ileinner").text.to_s
      puts "SNTC Features value is: #{@SNTC_Features}"
    end
    if value=="SNTC Cisco Health Score"
      @SNTC_Cisco_Health_Score = find(:id, "00N3600000JH0dr_ileinner").text.to_s
      puts "SNTC Cisco Health Score value is: #{@SNTC_Cisco_Health_Score}"
    end
    if value=="SNTC At Risk Reason"
      @SNTC_At_Risk_Reason = find(:id, "00N3600000JH2iR_ileinner").text.to_s
      puts "SNTC At Risk Reason value is: #{@SNTC_At_Risk_Reason}"
    end
    if value=="SNTC Inhibitors"
      @SNTC_Inhibitors = find(:id, "00N3600000JH1SQ_ileinner").text.to_s
      puts "SNTC Inhibitors value is: #{@SNTC_Inhibitors}"
    end
    if value=="SNTC Customer Sentiment"
      @SNTC_Customer_Sentiment = find(:id, "00N3600000JH2q6_ileinner").text.to_s
      puts "SNTC Customer Sentiment value is: #{@SNTC_Customer_Sentiment}"
    end
    if value=="SNTC Desired Outcomes"
      @SNTC_Desired_Outcomes = find(:id, "00N3600000JH1Zv_ileinner").text.to_s
      puts "SNTC Desired Outcomes value is: #{@SNTC_Desired_Outcomes}"
    end
    if value=="SNTC Health Status"
      @SNTC_Health_Status = find(:id, "00N3600000JH2qV_ileinner").text.to_s
      puts "SNTC Health Status value is: #{@SNTC_Health_Status}"
    end
    if value=="SNTC Achieved Outcomes"
      @SNTC_Achieved_Outcomes = find(:id, "00N3600000JH1Sa_ileinner").text.to_s
      puts "SNTC Achieved Outcomes value is: #{@SNTC_Achieved_Outcomes}"
    end
    if value=="SNTC Last Health Status"
      @SNTC_Last_Health_Status = find(:id, "00N3600000JH2qf_ileinner").text.to_s
      puts "SNTC Last Health Status value is: #{@SNTC_Last_Health_Status}"
    end
    if value=="SNTC Stage"
      @SNTC_Stage = find(:id, "00N3600000JH2qz_ileinner").text.to_s
      puts "SNTC Stage value is: #{@SNTC_Stage}"
    end
  end
end

When(/^I review the value of "([^"]*)" field under sntc section$/) do |value|
  sleep 10
  within all('.pbSubsection')[2] do
    if value=="SNTC SREV Health Score"
      @SNTC_SREV_Health_Score_review_val = find(:id, "00N3600000JH0Zp_ileinner").text.to_f
      puts "SNTC SREV Health Score value is: #{@SNTC_SREV_Health_Score_review_val}"
      if @SNTC_SREV_Health_Score == @SNTC_SREV_Health_Score_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Features"
      @SNTC_Features_review_val = find(:id, "00N3600000JH2IO_ileinner").text.to_s
      puts "SNTC Features value is: #{@SNTC_Features_review_val}"
      if @SNTC_Features == @SNTC_Features_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Cisco Health Score"
      @SNTC_Cisco_Health_Score_review_val = find(:id, "00N3600000JH0dr_ileinner").text.to_s
      puts "SNTC Cisco Health Score value is: #{@SNTC_Cisco_Health_Score_review_val}"
      if @SNTC_Cisco_Health_Score == @SNTC_Cisco_Health_Score_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC At Risk Reason"
      @SNTC_At_Risk_Reason_review_val = find(:id, "00N3600000JH2iR_ileinner").text.to_s
      puts "SNTC At Risk Reason value is: #{@SNTC_At_Risk_Reason_review_val}"
      if @SNTC_At_Risk_Reason == @SNTC_At_Risk_Reason_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Inhibitors"
      @SNTC_Inhibitors_review_val = find(:id, "00N3600000JH1SQ_ileinner").text.to_s
      puts "SNTC Inhibitors value is: #{@SNTC_Inhibitors_review_val}"
      if @SNTC_Inhibitors == @SNTC_Inhibitors_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Customer Sentiment"
      @SNTC_Customer_Sentiment_review_val = find(:id, "00N3600000JH2q6_ileinner").text.to_s
      puts "SNTC Customer Sentiment value is: #{@SNTC_Customer_Sentiment_review_val}"
      if @SNTC_Customer_Sentiment == @SNTC_Customer_Sentiment_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Desired Outcomes"
      @SNTC_Desired_Outcomes_review_val = find(:id, "00N3600000JH1Zv_ileinner").text.to_s
      puts "SNTC Desired Outcomes value is: #{@SNTC_Desired_Outcomes_review_val}"
      if @SNTC_Desired_Outcomes == @SNTC_Desired_Outcomes_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Health Status"
      @SNTC_Health_Status_review_val = find(:id, "00N3600000JH2qV_ileinner").text.to_s
      puts "SNTC Health Status value is: #{@SNTC_Health_Status_review_val}"
      if @SNTC_Health_Status == @SNTC_Health_Status_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Achieved Outcomes"
      @SNTC_Achieved_Outcomes_review_val = find(:id, "00N3600000JH1Sa_ileinner").text.to_s
      puts "SNTC Achieved Outcomes value is: #{@SNTC_Achieved_Outcomes_review_val }"
      if @SNTC_Achieved_Outcomes == @SNTC_Achieved_Outcomes_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Last Health Status"
      @SNTC_Last_Health_Status_review_val = find(:id, "00N3600000JH2qf_ileinner").text.to_s
      puts "SNTC Last Health Status value is: #{@SNTC_Last_Health_Status_review_val}"
      if @SNTC_Last_Health_Status == @SNTC_Last_Health_Status_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end

    if value=="SNTC Stage"
      @SNTC_Stage_review_val = find(:id, "00N3600000JH2qz_ileinner").text.to_s
      puts "SNTC Stage value is: #{@SNTC_Stage_review_val}"
      if @SNTC_Stage == @SNTC_Stage_review_val
        puts "Field Values are updated and matches the input values on Task"
      else
        writeFailure "Field Values dose not matches the input values on Task"
      end
    end
  end
end

When(/^I note the value of "([^"]*)" field under nos section$/) do |value|
  sleep 10
  within all('.pbSubsection')[3] do
    if value=="NOS SREV Health Score"
      @NOS_SREV_Health_Sore = find(:id, "00N3600000JH2rJ_ileinner").text.to_f
      puts "NOS SREV Health Score value is: #{@NOS_SREV_Health_Sore}"
    end

    if value=="NOS Cisco Health Score"
      @NOS_Cisco_Health_Sore = find(:id, "00N3600000JH2rO_ileinner").text.to_f
      puts "NOS Cisco Health Score value is: #{@NOS_Cisco_Health_Sore}"
    end

    if value=="NOS Inhibitors"
      @NOS_Inhibitors = find(:id, "00N3600000JH42N_ileinner").text.to_s
      puts "NOS Inhibitors value is: #{@NOS_Inhibitors}"
    end

    if value=="NOS Achieved Outcomes"
      @NOS_Achieved_Outcomes = find(:id, "00N3600000JH42S_ileinner").text.to_s
      puts "NOS Achieved Outcomes value is: #{@NOS_Achieved_Outcomes}"
    end

    if value=="NOS Desired Outcomes"
      @NOS_Desired_Outcomes = find(:id, "00N3600000JH42X_ileinner").text.to_s
      puts "NOS Desired Outcomes value is: #{@NOS_Desired_Outcomes}"
    end

    if value=="NOS Features"
      @NOS_Features = find(:id, "00N3600000JH43u_ileinner").text.to_s
      puts "NOS Features value is: #{@NOS_Features}"
    end

    if value=="NOS At Risk Reason"
      @NOS_At_Risk_Reason = find(:id, "00N3600000JH4WX_ileinner").text.to_s
      puts "NOS At Risk Reason value is: #{@NOS_At_Risk_Reason}"
    end

    if value=="NOS Customer Sentiment"
      @NOS_Customer_Sentiment = find(:id, "00N3600000JH4yM_ileinner").text.to_s
      puts "NOS Customer Sentiment value is: #{@NOS_Customer_Sentiment}"
    end

    if value=="NOS SREV Health Status"
      @NOS_SREV_Health_Status = find(:id, "00N3600000JH4yb_ileinner").text.to_s
      puts "NOS SREV Health Status value is: #{@NOS_SREV_Health_Status}"
    end

    if value=="NOS Cisco Health Status"
      @NOS_Cisco_Health_Status = find(:id, "00N7A000000Y2Ov_ileinner").text.to_s
      puts "NOS Cisco Health Status value is: #{@NOS_SREV_Health_Status}"
    end

    if value=="NOS Last Health Status"
      @NOS_Last_Health_Status = find(:id, "00N3600000JH4yl_ileinner").text.to_s
      puts "NOS Last Health Status value is: #{@NOS_Last_Health_Status}"
    end
  end
end

Then(/^I click on new task button under open activities section$/) do
  page.find_button("New Task").click
  puts "clicked on new task"
end

Then(/^I enter value for "([^"]*)" field under health check details section$/) do |arg1|
  if arg1 == "SREV Health Score"
    sleep 3
    within all('.pbSubsection')[3] do
      arg = getTaskDetails 'task_details'
      find_field("00N3600000IS7ab").set(arg["srev_health_score"])
    end
  end
  if arg1 == "Cisco Health Score"
    within all('.pbSubsection')[3] do
      arg = getTaskDetails 'task_details'
      find_field("00N3600000IS7ac").set(arg["cisco_health_score"])
    end
  end
  if arg1 == "Inhibitors"
    within all('.pbSubsection')[3] do
      page.find_by_id('00N3600000IS7aU_unselected').find("option[value='0']").select_option
      page.find(:id,"00N3600000IS7aU_right_arrow").click
      sleep 3
    end
  end
  if arg1 == "Achieved Outcomes"
    within all('.pbSubsection')[3] do
      page.find_by_id('00N3600000IS7aV_unselected').find("option[value='0']").select_option
      page.find(:id,"00N3600000IS7aV_right_arrow").click
      sleep 3
    end
  end
  if arg1 == "Desired Outcomes"
    within all('.pbSubsection')[3] do
      page.find_by_id('00N3600000IS7aX_unselected').find("option[value='0']").select_option
      page.find(:id,"00N3600000IS7aX_right_arrow").click
      sleep 3
    end
  end
  if arg1 == "Features"
    within all('.pbSubsection')[3] do
      page.find_by_id('00N3600000IS7aW_unselected').find("option[value='0']").select_option
      page.find(:id,"00N3600000IS7aW_right_arrow").click
      sleep 3
    end
  end
  if arg1 == "At Risk Reason"
    within all('.pbSubsection')[3] do
      select("Competitive Service Loss", :from => "00N3600000IS7af")
    end
  end
  if arg1 == "Customer Sentiment"
    within all('.pbSubsection')[3] do
      #select("Very Likely to Renew", :from => "00N3600000JH9Qy")
      select("Very Likely to Renew", :from => "00NP00000014EA4")
    end
  end
  if arg1 == "SREV Health Status"
    within all('.pbSubsection')[3] do
      #      select("Healthy", :from => "00N3600000JH9RN")
      #select("Healthy", :from => "00N3600000GvtnO")
      select("Healthy", :from => "00NP00000014EA6")
    end
  end
  if arg1 == "Cisco Health Status"
    within all('.pbSubsection')[3] do
      #      select("Healthy", :from => "00N7A000000Y2Ol")
      #select("Healthy", :from => "00N3600000GvtnN")
      select("Healthy", :from => "00NP00000014EA3")
    end
  end
  if arg1 == "Health Check#"
    within all('.pbSubsection')[3] do
      #select("1", :from => "00N3600000JH9R8")
      select("1", :from => "00NP00000014EA5")
    end
  end
end

Then(/^I click on account name from related to field$/) do
  within all('.pbSubsection')[0] do
    find(:id,"tsk3_ileinner").click
  end
end


Given(/^I check that contact field is a look up field$/) do
  if page.has_xpath?(".//*[@id='CF00N3600000JH9UM_lkwgt']/img")
    puts "contact field is a look up field"
  else
    #    fail(ArgumentError.new('contact field is not a lookup field'))
    writeFailure "contact field is not a lookup field"
  end
end

Then(/^I check "([^"]*)" field is visible$/) do |value|
  sleep 3
  within all('.pbSubsection')[2] do
    if page.has_field?(value)
      puts "#{value} field is visible"
    else
      #      fail(ArgumentError.new(vlaue +' field is not visible'))
      writeFailure "#{value} field is not visible"
    end
  end
end

Then(/^I check srev health score is a numeric field and non editable$/) do
  sleep 5
  if page.has_field?("SREV Health Score")
    within all(".pbSubsection")[3] do
      if page.has_field?("SREV Health Score")
        puts "SREV Health Score field is editable"
        fill_in "SREV Health Score",:with => "abc"
      else
        puts "SREV Health Score field is not editable"
      end
    end
    sleep 2
    within(:id,'topButtonRow') do
      if find(:button, "Save").visible?
        click_on "Save"
      end
    end
    sleep 2
    within all(".dataCol")[18] do
      if page.has_content?(" Invalid number")
        puts "SREV Health Score field accepts numeric value"
      else
        #      fail(ArgumentError.new('SREV Health Score field accepts text value'))
        puts "SREV Health Score field accepts text value"
      end
      sleep 2
    end
  else
    puts "SREV Health Score field is not editable"
  end
end


Then(/^I check cisco health score is a numeric field and non editable$/) do
  sleep 5
  if page.has_field?("Cisco Health Score")
    within all(".pbSubsection")[3] do
      if page.has_field?("Cisco Health Score")
        puts "Cisco Health Score field is editable"
        fill_in "Cisco Health Score",:with => "abc"
      else
        #      fail(ArgumentError.new('Cisco Health Score field is not editable'))
        puts "Cisco Health Score field is not editable"
      end
    end
    sleep 2
    within(:id,'topButtonRow') do
      if find(:button, "Save").visible?
        click_on "Save"
      end
    end
    sleep 2
    within all(".dataCol")[20] do
      if page.has_content?(" Invalid number")
        puts "Cisco Health Score field accepts numeric value"
      else
        #      fail(ArgumentError.new('Cisco Health Score field accepts text value'))
        writeFailure "Cisco Health Score field accepts text value"
      end
      sleep 2
    end
  else
    puts "Cisco Health Score field is not editable"
  end
end

Then(/^I check that inhibitors field is a multi select picklist and non editable$/) do
  if page.has_xpath?("//*[@id='00N3600000IS7aU_unselected']  | //*[@mulitple='multiple']")
    puts "inhibitors field is a multi select picklist"
  end
end

Then(/^I whether desired outcomes field is a multi select picklist and non editable$/) do
  if page.has_xpath?(".//*[@id='00N3600000IS7aX_unselected'] | //*[@miltiple='multiple']")
    puts "desired outcomes field is a multi select picklist"
  end
end

Then(/^I whether features is a multi select picklist and non editable$/) do
  if page.has_xpath?("//*[@id='00N3600000IS7aW_unselected']  | //*[@mulitple='multiple']")
    puts "features field is a multi select picklist"
  end
end

When(/^I check inhibitors field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7aU_unselected')
      puts "Inhibitors field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00N3600000IS7aU_unselected')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["inhibitors"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('inhibitors field is not editable'))
      writeFailure "inhibitors field is not editable"
    end
  end
end

When(/^I check desired outcomes field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7aX_unselected')
      puts "desired outcomes field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00N3600000IS7aX_unselected')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["desired_outcomes"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('desired outcomes field is not editable'))
      writeFailure "desired outcomes field is not editable"
    end
  end
end

When(/^I check achieved outcomes field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7aV_unselected')
      puts "achieved outcomes field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00N3600000IS7aV_unselected')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["achieved_outcomes"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('achieved outcomes field is not editable'))
      writeFailure "achieved outcomes field is not editable"
    end
  end
end

When(/^I check features field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7aW_unselected')
      puts "features field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00N3600000IS7aW_unselected')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["features"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('features field is not editable'))
      writeFailure "features field is not editable"
    end
  end
end

Then(/^I check at risk reason field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00N3600000IS7af')
      puts "at risk reason field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00N3600000IS7af')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["at_risk_reason"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('at risk reason field is not editable'))
      writeFailure "at risk reason field is not editable"
    end
  end
end

Then(/^I check customer sentiment field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00NP00000014EA4')
      puts "customer sentiment field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP00000014EA4')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["customer_sentiment"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('customer sentiment field is not editable'))
      writeFailure "customer sentiment field is not editable"
    end
  end
end

Then(/^I check srev health status field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00NP00000014EA6')
      puts "srev health status field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP00000014EA6')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["srev_health_status"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('srev health status field is not editable'))
      writeFailure "srev health status field is not editable"
    end
  end
end

Then(/^I check cisco health status picklist value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?("00NP00000014EA3")
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP00000014EA3')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["cisco_health_status"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "cisco health status field is not editable"
    end
  end
end


Then(/^I check cisco health status field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?('00NP00000014EA3')
      puts "Cisco Health Status field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP00000014EA3')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["cisco_health_status"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('Cisco Health Status field is not editable'))
      writeFailure "Cisco Health Status field is not editable"
    end
  end
end

Then(/^I check health check field value$/) do
  begin
    sleep 5
    arg = getTaskDetails 'task_details'
    #if page.has_select?('00N3600000JH9R8')
    if page.has_select?('00NP00000014EA5')
      puts "health check # field type is picklist"
      within all('.pbSubsection')[3] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP00000014EA5')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["health_check"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          #          fail(ArgumentError.new('expected values are not visible in new record picklist'))
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      #      fail(ArgumentError.new('health check # field is not editable'))
      writeFailure "health check # field is not editable"
    end
  end
end

When(/^I click on new button under accounts section$/) do
  sleep 5
  within('.bRelatedList') do
    puts "Accounts section"
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button under Accounts section"
    end
  end
end

When(/^I enter data to reqired fields under new account$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    @@acc_name = "PES_account_01" + Random.new.rand(99..1000).to_s
    fill_in "acc2",:with => @@acc_name
    puts @@acc_name
    puts "account name entered"

    fill_in "Client Company ID",:with => "01"
    puts "Client Company ID is entered"

    select("APAC", :from => "00N3600000EeE7h")
    puts "value for Client Theatre picklist is selected"

    fill_in "00N3600000JH0Zp",:with => "10"
    puts "SNTC SREV Health Score is entered"

    fill_in "00N3600000JH0dr",:with => "10"
    puts "SNTC Cisco Health Score is entered"
    sleep 2

    page.find_by_id('00N3600000JH1SQ_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH1SQ_right_arrow").click
    sleep 2
    puts "value for SNTC Inhibitors multi picklist is selected"

    page.find_by_id('00N3600000JH1Sa_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH1Sa_right_arrow").click
    puts "value for SNTC Achieved Outcomes multi picklist is selected"
    sleep 2

    page.find_by_id('00N3600000JH1Zv_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH1Zv_right_arrow").click
    puts "value for SNTC Desired Outcomes multi picklist is selected"
    sleep 2

    page.find_by_id('00N3600000JH2IO_unselected').find("option[value='1']").select_option
    sleep 5
    find(:id, "00N3600000JH2IO_right_arrow").click
    puts "value for SNTC Features multi picklist is selected"
    sleep 2

    select("Competitive Service Loss", :from => "00N3600000JH2iR")
    puts "value for SNTC At Risk Reason picklist is selected"

    select("Very Likely to Renew", :from => "00N3600000JH2q6")
    puts "value for SNTC Customer Sentiment picklist is selected"

    select("Healthy", :from => "00N3600000JH2qV")
    puts "value for SNTC SREV Health Status picklist is selected"

    fill_in "00N3600000JH2qf",:with => "7/27/2016"
    puts "SNTC Last Health Status is entered"

    select("Healthy", :from => "00N7A000000Y2Oq")
    puts "value for SNTC Cisco Health Status picklist is selected"

    select("Active", :from => "00N3600000JH2qz")
    puts "value for SNTC Stage picklist is selected"

    fill_in "00N3600000JH2qu",:with => "7/27/2016"
    puts "AMP Last Health Status is entered"

    select("Healthy", :from => "00N3600000JH428")
    puts "value for AMP SREV Health Status picklist is selected"

    select("Very Likely to Renew", :from => "00N3600000JH42D")
    puts "value for AMP Customer Sentiment picklist is selected"

    select("Competitive Service Loss", :from => "00N3600000JH42I")
    puts "value for AMP At Risk Reason picklist is selected"

    page.find_by_id('00N3600000JH43p_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH43p_right_arrow").click
    sleep 2
    puts "value for AMP Features multi picklist is selected"

    page.find_by_id('00N3600000JH5zV_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH5zV_right_arrow").click
    sleep 2
    puts "value for AMP Achieved Outcomes multi picklist is selected"

    page.find_by_id('00N3600000JH4yg_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH4yg_right_arrow").click
    sleep 2
    puts "value for AMP Desired Outcomes multi picklist is selected"

    fill_in "00N3600000JH9QA",:with => "10"
    puts "AMP SREV Health Score is entered"

    page.find_by_id('00N3600000JH700_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH700_right_arrow").click
    sleep 2
    puts "value for AMP Inhibitors multi picklist is selected"

    fill_in "00N3600000JH9QP",:with => "10"
    puts "AMP Cisco Health Score is entered"

    select("Healthy", :from => "00N7A000000Y2PA")
    puts "value for AMP Cisco Health Status picklist is selected"
    select("Active", :from => "00N3600000JH2qB")
    puts "value for AMP Stage picklist is selected"

    fill_in "00N3600000JH2rJ",:with => "10"
    puts "NOS SREV Health Score is entered"

    fill_in "00N3600000JH2rO",:with => "10"
    puts "NOS Cisco Health Score is entered"

    page.find_by_id('00N3600000JH42N_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH42N_right_arrow").click
    sleep 2
    puts "value for NOS Inhibitors multi picklist is selected"

    page.find_by_id('00N3600000JH42S_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH42S_right_arrow").click
    sleep 2
    puts "value for NOS Achieved Outcomes multi picklist is selected"

    page.find_by_id('00N3600000JH42X_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH42X_right_arrow").click
    sleep 2
    puts "value for NOS Desired Outcomes multi picklist is selected"

    page.find_by_id('00N3600000JH43u_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH43u_right_arrow").click
    puts "value for NOS Features multi picklist is selected"

    select("Competitive Service Loss", :from => "00N3600000JH4WX")
    puts "value for NOS At Risk Reason picklist is selected"

    select("Very Likely to Renew", :from => "00N3600000JH4yM")
    puts "value for NOS Customer Sentiment picklist is selected"

    select("Healthy", :from => "00N3600000JH4yb")
    puts "value for NOS SREV Health Status picklist is selected"

    fill_in "00N3600000JH4yl",:with => "7/27/2016"
    puts "NOS Last Health Status is entered"

    select("Healthy", :from => "00N7A000000Y2Ov")
    puts "value for NOS Cisco Health Status picklist is selected"

    select("Active", :from => "00N3600000JH4zt")
    puts "value for NOS Stage picklist is selected"

    fill_in "00N3600000JH51G",:with => "10"
    puts "Collab ELA SREV Health Score is entered"

    fill_in "00N3600000JH51a",:with => "10"
    puts "Collab ELA Cisco Health Score is entered"

    page.find_by_id('00N3600000JH5xo_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH5xo_right_arrow").click
    sleep 2
    puts "value for Collab ELA Inhibitors multi picklist is selected"

    page.find_by_id('00N3600000JH60Y_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH60Y_right_arrow").click
    sleep 2
    puts "value for Collab ELA Achieved Outcomes multi picklist is selected"

    page.find_by_id('00N3600000JH6Yp_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH6Yp_right_arrow").click
    sleep 2
    puts "value for Collab ELA Desired Outcomes multi picklist is selected"

    page.find_by_id('00N3600000JH6vF_unselected').find("option[value='1']").select_option
    sleep 2
    find(:id, "00N3600000JH6vF_right_arrow").click
    sleep 2
    puts "value for Collab ELA Features multi picklist is selected"

    select("Very Likely to Renew", :from => "00N3600000JHxf5")
    puts "value for Collab ELA Customer Sentiment picklist is selected"

    select("Healthy", :from => "00N3600000JHyQG")
    puts "value for Collab ELA SREV Health Status picklist is selected"

    fill_in "00N3600000JHz3S",:with => "7/27/2016"
    puts "Collab ELA Last Health Status is entered"

    select("Competitive Service Loss", :from => "00N3600000JH721")
    puts "value for Collab ELA At Risk Reason picklist is selected"

    select("Healthy", :from => "00N7A000000Y2PP")
    puts "value for Collab ELA Cisco Health Status picklist is selected"

    select("Tier 1", :from => "00N7A000000YUKS")
    puts "value for SNTC Engagement Tier picklist is selected"

    select("Tier 1", :from => "00N7A000000YUKX")
    puts "value for AMP Engagement Tier picklist is selected"

    select("Tier 1", :from => "00N7A000000YUKc")
    puts "value for Collab ELA Engagement Tier picklist is selected"
  end
end

Then(/^I check that qualtrics link is a url type and not editable$/) do
  sleep 2
  if page.has_field?("00N3600000IS7ai")
    fill_in "00N3600000IS7ai",:with => "test"
  else
    puts "qualtrics link field is not editable"
  end
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, "Save").visible?
      click_on "Save"
    end
  end
  sleep 2
  if page.has_content?("Error: Invalid Data. ")
    puts "Not saved successfully"
  else
    puts "Saved successfully"
  end
  sleep 2
  if page.has_field?("00N3600000IS7ai")
    expected_qualtrics_link_value = "http://test"
    actual_qualtrics_link_value = page.find(:id, "00N3600000IS7ai_ileinner").text.to_s
    if actual_qualtrics_link_value == expected_qualtrics_link_value
      puts "Qualtrics Link field is a url type field"
    else
      writeFailure "Qualtrics Link field is not a url type field"
    end
  end
end


Then(/^I whether achieved outcomes fiels is a multi select picklist and non editable$/) do
  if page.has_xpath?("//*[@id='00N3600000IS7aV_unselected']  | //*[@mulitple='multiple']")
    puts "inhibitors field is a multi select picklist"
  end
end

Then(/^I check whether at risk reason field is picklist and non editable$/) do
  if page.has_field?("00N3600000IS7af")
    if page.has_select?("00N3600000IS7af")
      puts "at risk reason field is a picklist"
    else
      puts "at reisk reason field is not a picklist field"
    end
  else
    puts "at risk reason field is not editable"
  end
end

Then(/^I check whether customer sentiment field is picklist and non editable$/) do
  if page.has_field?("00N3600000JH9Qy")
    if page.has_select?("00N3600000JH9Qy")
      puts "customer sentiment field is a picklist"
    else
      puts "customer sentiment field is not a picklist field"
    end
  else
    puts "customer sentiment field is not editable"
  end
end

Then(/^I whether cisco health staus field is picklist and non editable$/) do
  if page.has_field?("00N7A000000Y2Ol")
    if page.has_select?("00N7A000000Y2Ol")
      puts "cisco healt staus field is a picklist"
    else
      puts "cisco healt staus field is not a picklist field"
    end
  else
    puts "cisco healt staus field is not editable"
  end
end

Then(/^I check whether health check field is picklist and non editable$/) do
  if page.has_field?("00N3600000JH9R8")
    if page.has_select?("00N3600000JH9R8")
      puts "health check field is a picklist"
    else
      puts "health check field is not picklist field"
    end
  else
    puts "health check field is not editable"
  end
end

Then(/^I enter reqired data for all the mandatory fields$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  fill_in("lksrch",:with=> "DSIntegration")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 2
    click_on "DSIntegration Admin"
    puts "assigned to DSIntegration Admin"
    sleep 2
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_contact 01")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> @@acc_name)
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
  within all(".pbSubsection")[1] do
    if page.has_field?("00N3600000IS7ag")
      select("CTAS", :from => "00N3600000IS7ag")
    else
      puts "Sub Task Type fiels is not present for current record type"
    end
    select("Normal", :from => "tsk13")
    select("SNTC", :from => "00N3600000IS7ae")
    select("Not Started", :from => "Status")
  end
  within all(".pbSubsection")[2] do
    @subject_3 = "PES automation testing" + Random.new.rand(60987..109876).to_s
    puts @subject_3
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => @subject_3
    if page.has_field?("00N3600000IS7ag")
      fill_in "00N3600000IS7ag", :with => 01
    end
  end
end

Then(/^I enter value to date time closed field$/) do
  arg = getTaskDetails 'task_details'
  within all('.pbSubsection')[1] do
    sleep 2
    fill_in "00N3600000D0q4F", :with => arg["date_time_closed"]
    sleep 2
  end
end

When(/^I select account name in the related lookup field$/) do
  within all('.pbSubsection')[1] do
    sleep 2
    select("Account", :from => "tsk3_mlktp")
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> @@acc_name)
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
end

When(/^I click on account name from related to lookup field$/) do
  sleep 4
  page.find(:id, "lookup0013600000OV1GDtsk3").click
  puts "click on account"
end

Then(/I enter data to all the mandatory fields except srev health score$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  if (ENV['UserRole'] == "nalaopsmgrsit") || (ENV['UserRole'] == "nalaopsrepsit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "nalasalesmgrsit") || (ENV['UserRole'] == "nalasalesrepsit" || (ENV['UserRole'] == "nalasalesopssit"))
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
              puts "assigned to DSIntegration Admin"
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
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_contact 01")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.switch_to.window(main)
  sleep 10
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "PES_ops01")
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

  within all(".pbSubsection")[1] do
    if page.has_field?("Sub Task Type")
      select("CTAS", :from => "Sub Task Type")
    else
      puts "Sub Task Type fiels is not present for current record type"
    end
    #    select("Email", :from => "TaskSubtype")
    select("Normal", :from => "tsk13")
    if page.has_field?("00N3600000IS7ae")
      select("SNTC", :from => "00N3600000IS7ae")
    else
      puts "Product field is not editable"
    end
    select("Not Started", :from => "Status")
  end
  within all(".pbSubsection")[2] do
    @subject_3 = "PES automation testing" + Random.new.rand(10000..20000).to_s
    puts @subject_3
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => @subject_3
    if page.has_field?("00N3600000IS7ag")
      fill_in "00N3600000IS7ag", :with => 01
    end
    if page.has_select?("00N3600000D0q4H")
      select("Incoming", :from => "00N3600000D0q4H")
      puts "Direction field is entered"
    end
    if page.has_field?("00N3600000IS7aZ")
      puts "SREV Amount field is present"
      fill_in "00N3600000IS7aZ", :with => "100"
    else
      puts "SREV Amount field is not present for this user"
    end
  end

  within all(".pbSubsection")[3] do
    if page.has_field?("00N3600000IS7ab")
      puts "SREV Heatht Score value is not entered"
      fill_in "00N3600000IS7ab", :with => "10"
      else
      puts "SREV Health Score is not editable"
    end
    if page.has_field?("00N3600000JH9R8")
      select("1", :from => "00N3600000JH9R8")
    else
      puts "Health Check # field is not editable"
    end
  end
end

Then(/^I click on "([^"]*)" button which should fail$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
  if page.has_content?("Error: Invalid Data. ")
    puts "not saved successfully"
  else
    writeFailure "saved successfully"
  end
  sleep 3
end

Then(/^I should see customer user story field with read only permission$/) do
  if page.has_field?("Customer Success Story")
    writeFailure "Customer Success Story field is visible with read and write permission"
  elsif page.has_content?("Customer Success Story")
    puts "Customer Success Story field is visible with read only permisssion"
  else
    writeFailure "Customer Success Story field is not visible"
  end
end

Then(/^I should verify task status picklist values under task information row$/) do
  if page.has_select?("tsk12", :selected => "Not Started")
    actualvalues =find(:xpath,"//*[@id='tsk12']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["Not Started", "Completed Successfully", "Completed Unsuccessfully"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in task status picklist"
    else
      writeFailure "expected values are not visible in task status picklist"
    end
  else
    writeFailure "task status picklist is not visible"
  end
end


Then(/^I should see contact field with read write permission$/) do
  if page.has_field?("Contact")
    puts "contact field is visible with read and write permission"
  elsif page.has_content?("Customer Success Story")
    writeFailure "contact field is visible with read only permisssion"
  else
    writeFailure "contact is not visible"
  end
end

Then(/^I should see contact field type as lookup$/) do
  if page.has_xpath?("//*[@alt='Contact Lookup (New Window)']")
    puts "contact field has lookup"
  else
    writeFailure "contact field does not have lookup"
  end
end

When(/^I click on continue button$/) do
 if find(:button,'Continue').visible?
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end

#-------------------------------------------------------------------------------

When(/^I check that "([^"]*)" is visible and editable$/) do |arg1|
  if (ENV['UserRole'] == "nalasalesopssit")
    if page.has_content?(arg1)
      writeFailure "#{arg1} field is visible"
    else
      puts "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      writeFailure "#{arg1} field is editable"
    else
      puts "#{arg1} field is not editable"
    end
  else
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      puts "#{arg1} field is editable"
    else
      writeFailure "#{arg1} field is not editable"
    end
 end
end

Then(/^I check the transition direction picklist values$/) do
begin
    sleep 5
    arg = getTaskDetails 'task_details'
     if page.has_select?('00NP0000001A77M')
      puts "transition direction field type is picklist"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@id, '00NP0000001A77M')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["transition_direction"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else          
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else      
      writeFailure "transition direction field is not editable"
    end
  end
end