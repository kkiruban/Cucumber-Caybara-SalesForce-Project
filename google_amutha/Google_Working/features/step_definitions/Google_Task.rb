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
  sleep 3
  if find(:button,'Continue').visible?
    sleep 2
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end

Then(/^I check that the picklist value of record type of new record$/) do
  #    if page.has_xpath?(".//*[@id='p3']/option[@value='Task - Health Check']")
#  if page.has_xpath?("//select[@id='p3']/option[@value='012R0000000DIYO']")
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Standard']")
    puts "Record Type of new record picklist contains Task - Standard option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Standard option"
  end
   if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Email']")
    puts "Record Type of new record picklist contains Task - Email option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Email"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Phone Calls']")
    puts "Record Type of new record picklist contains Task - Phone Calls option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Phone Calls option"
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
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")
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
    if (ENV['UserRole'] == "opsmgrsit")
#      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 2
    else if (ENV['UserRole'] == "opsrepsit")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 2
      else if (ENV['UserRole'] == "salesmgrsit")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 2
        else if (ENV['UserRole'] == "salesrepsit")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 2
          else if (ENV['UserRole'] == "Admin")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "salesopssit")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
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
  fill_in("lksrch",:with=> "smoke-test-contacts")
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
  fill_in("lksrch",:with=> "smoke-test-opportunity")
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

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end   
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end  
  within all(".pbSubsection")[2] do
    @subject_1 = "smoke-test-Task-Email" + Random.new.rand(10000..20000).to_s
    puts @subject_1
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => @subject_1
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
end



