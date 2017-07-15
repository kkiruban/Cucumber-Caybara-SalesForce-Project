
When(/^I click on "([^"]*)" button from "([^"]*)" section$/) do |new, my_task|
  begin
    sleep 3
    if page.has_xpath?("//input[@title='New Task']")
      find(:xpath,"//input[@title='New Task']").click
      sleep 2
      puts "Successfully click the #{new} button from #{my_task} section"
    else
      putstr "Failed to see the #{new} button from #{my_task} section"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{new} button from #{my_task} section"
  end
end


And(/^I able to see the "([^"]*)" tasks pickList fields$/) do |field|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

    if page.has_css?("#p3")

      puts "Successfully see the #{field} pickList"

      $task_types = []

      all(:xpath,"//select[@id='p3']/option").each do |options|

        $task_types << options.text
      end

      if $task_types.include?arg["TaskEmail"]
        puts "Successfully see the #{field} pickList value: #{arg["TaskEmail"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["TaskEmail"]}"
      end

      if $task_types.include?arg["TaskFax"]
        puts "Successfully see the #{field} pickList value: #{arg["TaskFax"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["TaskFax"]}"
      end

      if $task_types.include?arg["TaskInbox"]
        puts "Successfully see the #{field} pickList value: #{arg["TaskInbox"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["TaskInbox"]}"
      end

      if $task_types.include?arg["TaskPhoneCalls"]
        puts "Successfully see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
      end

      if $task_types.include?arg["TaskStandard"]
        puts "Successfully see the #{field} pickList value: #{arg["TaskStandard"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["TaskStandard"]}"
      end
    else
      putstr "Failed to see the #{field} pickList"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
  end
end


When(/^I select the "([^"]*)" from "([^"]*)" pickList field$/) do |option, field|
   sleep 3
   if page.has_content?(field)
     puts "Successfully see the #{field} field"
     if page.has_css?("#p3")
       puts "Successfully see the #{field} pickList"
       sleep 2
       result = false
       find("#p3").all('option').each do |record_type|

         if record_type.text.to_s == option.to_s
            puts "Successfully see the #{field} pickList value: #{option}"
            result = true
            sleep 3
            find("#p3").send_keys option
         end
       end
       raise "Failed to see the #{field} pickList value: #{option}" unless result
       sleep 3
     else
       putstr "Failed to see the #{field} pickList"
     end
   else
     putstr "Failed to see the #{field} field"
   end
end


And(/^I fill the task required fields$/) do
  begin
  sleep 3
  arg = getDetails 'NewTaskInformation'

  # sleep 3
  # page.driver.browser.window_handles.first
  # main = page.driver.browser.window_handles.first
  # find("img[alt='Assigned To Lookup (New Window)']").click
  # sleep 5
  # page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  # lookup = page.driver.browser.window_handles.last
  # page.driver.browser.switch_to.frame("searchFrame")
  # sleep 5
  #
  # if (ENV['UserRole'] == "SchneiderAdmin")
  #
  #   fill_in("lksrch",:with=> "Admin")
  #
  # elsif (ENV['UserRole'] == "SchneiderOperationManagerSit")
  #
  #   fill_in("lksrch",:with=> "Sales")
  #
  # elsif (ENV['UserRole'] == "SchneiderSalesManagerSit")
  #
  #   fill_in("lksrch",:with=> "Sales")
  #
  # elsif (ENV['UserRole'] == "SchneiderOperationRepSit")
  #   fill_in("lksrch",:with=> "Sales")
  #
  # elsif (ENV['UserRole'] == "SchneiderSalesRepSit")
  #   fill_in("lksrch",:with=> "Sales Rep Schneider")
  #
  # elsif (ENV['UserRole'] == "SchneiderSalesOperationSit")
  #   fill_in("lksrch",:with=> "Sales")
  # end
  # sleep 4
  # find_button('Go!').click
  # sleep 4
  # page.driver.browser.switch_to.window(lookup)
  # page.driver.browser.switch_to.frame("resultsFrame")
  # within('.pbBody') do
  #   all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
  # end
  # sleep 2
  # page.driver.browser.switch_to.window(main)
  # sleep 2


  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> arg["TaskContactName"])
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
  end
  sleep 2
  page.driver.browser.switch_to.window(main)
  sleep 2


  page.driver.browser.switch_to.window(main)
  sleep 4
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> arg["TaskRelatedTo"])
  sleep 2
  find_button('Go!').click
  sleep 2
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 3
    all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 4

  within all(".pbSubsection")[1] do
    if page.has_select?("Priority")
      select(arg["TaskPriority"], :from => "Priority")
    end
    if page.has_select?("Status")
      select(arg["TaskStatus"], :from => "Status")
    end
    fill_in "Due Date",:with => arg["TaskDueDate"]
  end
  sleep 2

  within all(".pbSubsection")[2] do

    $create_task = "Smoke_Test_#{Time.now.strftime('%m%d_%H%M_%S')}"

    fill_in "Comments",:with => arg["TaskComments"]
    sleep 2
    fill_in "Subject", :with => $create_task

    if page.has_select?("Direction")
      select(arg["TaskDirection"], :from => "Direction")
    end

    if page.has_select?("Health Status Reason")
      select(arg["TaskHealthStatusReason"], :from => "Health Status Reason")
    end
  end
  sleep 3
  puts "Successfully fill the task required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the task required fields"
  end
end


Then(/^I able to see the created "([^"]*)" successfully$/) do |task_type|
  begin
  sleep 3
  arg = getDetails 'NewTaskInformation'

  if page.has_content?(arg["MyTasksSection"])
    puts "Successfully see the #{arg["MyTasksSection"]} section"
    unless page.has_content?(arg["NoOpenTasksMessage"])
     within(".bMyTask") do
      within(".list") do
       if first("tbody").all(".dataRow").count > 0
         tr = first("tbody").all(".dataRow")
         sleep 3
         result = false
         tr.each do |row|
           if row.all("td")[2].all("a")[0].text == $create_task
             puts "Successfully created the #{task_type} Task: #{$create_task}"
             result = true
           end
         end
         putstr "Failed to create the #{task_type} Task: #{$create_task}" unless result
         sleep 3
       else
         putstr "No Tasks are available"
       end
      end
     end
    else
      putstr "You have no open tasks scheduled for this period"
    end
  else
    putstr "Failed to created the #{task_type} Task"
  end
  rescue Exception => ex
    putstr "Error occurred while creating the #{task_type} Task"
  end
end

