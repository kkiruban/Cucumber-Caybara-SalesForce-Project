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

Then(/^I enter data to all the mandatory fields$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
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
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 5
  page.driver.browser.switch_to.window(main)
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
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

  within all(".pbSubsection")[1] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
    if page.has_field?("tsk4")
      fill_in("tsk4",:with => "5/17/2017")
      puts "value for due date field is entered"
    else
      puts "due date field is not available"
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

Then(/^I check the picklist value of case origin field$/) do
begin
    sleep 5
    arg = getTaskDetails 'task_details'
    if page.has_select?("Case Origin")
      puts "Case Origin picklist field is present and a picklist field"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKhV')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["case_origin"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Case Origin picklist is not present"
    end
  end
end