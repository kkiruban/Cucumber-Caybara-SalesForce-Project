

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

        if $task_types.include?arg["TaskStandard"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskStandard"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskStandard"]}"
        end

        if $task_types.include?arg["TaskOnBoarding"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskOnBoarding"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskOnBoarding"]}"
        end

        if $task_types.include?arg["TaskCustomerSuccess"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskCustomerSuccess"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskCustomerSuccess"]}"
        end

        if $task_types.include?arg["TaskAdoption"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskAdoption"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskAdoption"]}"
        end

    else
      putstr "Failed to see the #{field} pickList"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
  end
end


And(/^I fill the task required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

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

      if page.has_select?(arg["TasksPriorityField"])
        select(arg["TasksPriorityValue"], :from => arg["TasksPriorityField"])
      end

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusValue"], :from => arg["TasksStatusField"])
      end

      if page.has_content?(arg["TasksDueDateField"])
        fill_in arg["TasksDueDateField"],:with => arg["TasksDueDateValue"]
      end

    end
    sleep 2

    if page.has_content?(arg["TasksRLMDetails"])
       puts "Successfully see the #{arg["TasksRLMDetails"]} field"

      within all(".pbSubsection")[3] do

        $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

        sleep 3
        if page.has_content?(arg["TasksSubjectField"])
          fill_in arg["TasksSubjectField"], :with => $create_task
        end

        sleep 3
        if page.has_content?(arg["TasksCommentsField"])
          fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
        end

        if page.has_select?(arg["TaskDirectionField"])
          select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
        end
      end

    else

      within all(".pbSubsection")[2] do

        $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

        sleep 3
        if page.has_content?(arg["TasksSubjectField"])
          fill_in arg["TasksSubjectField"], :with => $create_task
        end

        sleep 3
        if page.has_content?(arg["TasksCommentsField"])
          fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
        end

        if page.has_select?(arg["TaskDirectionField"])
          select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
        end
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
    sleep 3
    if page.has_css?(".pShowMore")
      sleep 3
      puts "Successfully see the Task Pagination"
      within(".pShowMore") do
        first("a").click
      end
      puts "Successfully clicked the Task Pagination"
      sleep 3
    end
    sleep 3
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


When(/^I select the "([^"]*)" pickList value from "([^"]*)" section$/) do |option, section|
  sleep 3
  if page.has_content?(section)
    puts "Successfully see the #{section} section"
   if page.has_css?("#tasklist_mode")
      puts "Successfully see the #{section} pickList"
      sleep 2
      result = false
      find("#tasklist_mode").all('option').each do |record_type|

        if record_type.text.to_s == option.to_s
          puts "Successfully see the #{section} pickList value: #{option}"
          result = true
          sleep 3
          find("#tasklist_mode").send_keys option
          puts "Successfully selected the #{section} pickList value: #{option}"
          sleep 4
        end
      end
      raise "Failed to see the #{section} pickList value: #{option}" unless result
      sleep 3
    else
      putstr "Failed to see the #{section} pickList"
    end
  else
    putstr "Failed to see the #{section} section"
  end
end


And(/^I should not able to see the "([^"]*)" section$/) do |section|
  begin
    sleep 3
    unless page.has_content?(section)
      puts "Unable to see the #{section} section"
    else
      putstr "Able to see the #{section} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{section} section"
  end
end


And(/^I able to see the "([^"]*)" pickList should be visible in the left column under "([^"]*)"$/) do |field, rlm_details|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
     if page.has_xpath?("//label[text() = '#{field}']/preceding::h3[text() = '#{rlm_details}']")
         puts "Successfully see the #{field} pickList field is visible in the left column under #{rlm_details}"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == field
              health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
              if health_status.count > 0
                puts "Successfully see the #{field} pickList field is visible"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{field} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{field} pickList field" unless result
          sleep 3
        end
     else
       putstr "#{field} pickList field is not visible in the left column under #{rlm_details}"
     end
    else
      if (ENV['UserRole'] == "SalesOperationSit")

        $task_fields = false
        if page.has_xpath?("//label[text() = '#{field}']/preceding::h3[text() = '#{rlm_details}']")
          puts "Successfully see the #{field} pickList field is visible in the left column under #{rlm_details}"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == field
                begin
                  health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if health_status.count > 0
                    putstr "Successfully see the #{field} pickList field is visible"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{field} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{field} pickList field" unless result
            sleep 3
          end
        else
          putstr "#{field} pickList field is not visible in the left column under #{rlm_details}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field is visible"
  end
end


And(/^I able to see the "([^"]*)" field editable permissions except SalesOps$/) do |field|
  begin
    sleep 3

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(field)
        puts "Successfully see the #{field} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == field
              if $task_fields == true
                health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                if health_status.count > 0
                  puts "#{field} pickList field is editable"
                  result = true
                  break
                else
                  putstr "#{field} text box field is Read Only"
                end
              else
                putstr "#{field} text box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{field} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{field} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(field)
          puts "Successfully see the #{field} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == field
                if $task_fields == true
                  begin
                    health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                    if health_status.count > 0
                      putstr "#{field} text box field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{field} text box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{field} text box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{field} text box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList field is editable"
  end
end


And(/^I able to see the task "([^"]*)" pickList field values$/) do |health_status|
  begin
    sleep 2
    arg = getDetails 'TasksRLMHealthStatusPickListValues'

    sleep 2
    if page.has_content?(health_status)
      puts "Successfully see the #{health_status} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == health_status

              if $task_fields == true
                result = true
                $health_status_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                if $health_status_values.count > 0

                  if $health_status_values.include?arg["HealthStatusBlack"]
                    puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                  else
                    putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                  end

                  if $health_status_values.include?arg["HealthStatusGreen"]
                    puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                  else
                    putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                  end

                  if $health_status_values.include?arg["HealthStatusRed"]
                    puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                  else
                    putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                  end

                else
                  putstr "#{health_status} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{health_status} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{health_status} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin

            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == health_status

                  if $task_fields == true

                    result = true
                    $health_status_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                    if $health_status_values.count > 0


                      if $health_status_values.include?arg["HealthStatusBlack"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusGreen"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusRed"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      end

                    else
                      putstr "#{health_status} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{health_status} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{health_status} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{health_status} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{health_status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{health_status} pickList values"
  end
end


When(/^I able to see the task "([^"]*)" pickList values$/) do |health_status_reason|
  begin
    sleep 2
    arg = getDetails 'TasksRLMHealthStatusReasonPickListValues'

    sleep 2
    if page.has_content?(health_status_reason)
      puts "Successfully see the #{health_status_reason} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == health_status_reason

              if $task_fields == true
                result = true
                $health_status_reason_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                if $health_status_reason_values.count > 0


                  if $health_status_reason_values.include?arg["HSRNoRiskIdentified"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRNoRiskIdentified"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRNoRiskIdentified"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCompetitorParty"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorParty"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorParty"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCompetitorInHouse"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorInHouse"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorInHouse"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCompetitorProductReplacement"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorProductReplacement"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorProductReplacement"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCompetitorPricing"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorPricing"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorPricing"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCompetitorUniqueOffering"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorUniqueOffering"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorUniqueOffering"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductQualityAudio"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityAudio"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityAudio"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductQualityConnectivity"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityConnectivity"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityConnectivity"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductQualityContentSharing"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityContentSharing"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityContentSharing"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductQualityUsability"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityUsability"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityUsability"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductQualityVideo"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityVideo"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityVideo"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitAntiVideoCulture"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitAntiVideoCulture"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitAntiVideoCulture"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitAudioConference"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitAudioConference"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitAudioConference"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitSelfService"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitSelfService"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitSelfService"]}"
                  end

                 if $health_status_reason_values.include?arg["HSRProductFitWebConference"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitWebConference"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitWebConference"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitRemainedNiche"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitRemainedNiche"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitRemainedNiche"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitNoLOBBuyIn"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitNoLOBBuyIn"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitNoLOBBuyIn"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitSpecificFeatures"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitSpecificFeatures"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitSpecificFeatures"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductFitStickerShock"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitStickerShock"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitStickerShock"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherAccountMerge"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherAccountMerge"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherAccountMerge"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherBadDebt"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherBadDebt"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherBadDebt"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherBank"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherBank"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherBank"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherChangeInDecisionMaker"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherChangeInDecisionMaker"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherChangeInDecisionMaker"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherFailedToDeployReasons"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherFailedToDeployReasons"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherFailedToDeployReasons"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherInsufficientDealQualification"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherInsufficientDealQualification"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherInsufficientDealQualification"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherMergersAcquisitions"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherMergersAcquisitions"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherMergersAcquisitions"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherPartnerIssue"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherPartnerIssue"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherPartnerIssue"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherPoorCustomerService"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherPoorCustomerService"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherPoorCustomerService"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherTermsConditions"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherTermsConditions"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherTermsConditions"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROtherUnknown"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherUnknown"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherUnknown"]}"
                  end

                else
                  putstr "#{health_status_reason} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{health_status_reason} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{health_status_reason} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin
            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == health_status_reason

                  if $task_fields == true

                    result = true
                    $health_status_reason_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                    if $health_status_reason_values.count > 0


                      if $health_status_reason_values.include?arg["HSRNoRiskIdentified"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRNoRiskIdentified"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRNoRiskIdentified"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCompetitorParty"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorParty"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorParty"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCompetitorInHouse"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorInHouse"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorInHouse"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCompetitorProductReplacement"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorProductReplacement"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorProductReplacement"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCompetitorPricing"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorPricing"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorPricing"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCompetitorUniqueOffering"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCompetitorUniqueOffering"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCompetitorUniqueOffering"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductQualityAudio"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityAudio"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityAudio"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductQualityConnectivity"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityConnectivity"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityConnectivity"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductQualityContentSharing"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityContentSharing"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityContentSharing"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductQualityUsability"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityUsability"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityUsability"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductQualityVideo"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductQualityVideo"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductQualityVideo"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitAntiVideoCulture"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitAntiVideoCulture"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitAntiVideoCulture"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitAudioConference"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitAudioConference"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitAudioConference"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitSelfService"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitSelfService"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitSelfService"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitWebConference"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitWebConference"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitWebConference"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitRemainedNiche"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitRemainedNiche"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitRemainedNiche"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitNoLOBBuyIn"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitNoLOBBuyIn"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitNoLOBBuyIn"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitSpecificFeatures"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitSpecificFeatures"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitSpecificFeatures"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductFitStickerShock"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductFitStickerShock"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductFitStickerShock"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherAccountMerge"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherAccountMerge"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherAccountMerge"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherBadDebt"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherBadDebt"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherBadDebt"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherBank"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherBank"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherBank"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherChangeInDecisionMaker"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherChangeInDecisionMaker"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherChangeInDecisionMaker"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherFailedToDeployReasons"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherFailedToDeployReasons"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherFailedToDeployReasons"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherInsufficientDealQualification"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherInsufficientDealQualification"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherInsufficientDealQualification"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherMergersAcquisitions"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherMergersAcquisitions"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherMergersAcquisitions"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherPartnerIssue"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherPartnerIssue"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherPartnerIssue"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherPoorCustomerService"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherPoorCustomerService"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherPoorCustomerService"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherTermsConditions"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherTermsConditions"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherTermsConditions"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROtherUnknown"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROtherUnknown"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROtherUnknown"]}"
                      end

                    else
                      putstr "#{health_status_reason} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{health_status_reason} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{health_status_reason} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{health_status_reason} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{health_status_reason} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{health_status_reason} pickList values"
  end
end


When(/^I able to see the task "([^"]*)" field is visible$/) do |sales_play|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
      if page.has_content?(sales_play)
        puts "Successfully see the #{sales_play} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == sales_play
              sales_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
              if sales_play_values.count > 0
                puts "Successfully see the #{sales_play} pickList field is visible"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{sales_play} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{sales_play} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{sales_play} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $task_fields = false
        if page.has_content?(sales_play)
          puts "Successfully see the #{sales_play} field"
          within(".pbSubsection") do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == sales_play
                begin
                  sales_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if sales_play_values.count > 0
                    putstr "Successfully see the #{sales_play} pickList field is visible"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{sales_play} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{sales_play} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{sales_play} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{sales_play} field is visible"
  end
end


When(/^I verify the task "([^"]*)" pickList values$/) do |sales_play|
  begin
    sleep 2
    arg = getDetails 'TasksSalesPlayPickListValues'

    sleep 2
    if page.has_content?(sales_play)
      puts "Successfully see the #{sales_play} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == sales_play

              if $task_fields == true
                result = true
                $sales_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                if $sales_play_values.count > 0


                  if $sales_play_values.include?arg["SalesPlayEnhance"]
                    puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayEnhance"]}"
                  else
                    putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayEnhance"]}"
                  end

                  if $sales_play_values.include?arg["SalesPlayTransform"]
                    puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayTransform"]}"
                  else
                    putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayTransform"]}"
                  end

                  if $sales_play_values.include?arg["SalesPlayConsolidate"]
                    puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayConsolidate"]}"
                  else
                    putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayConsolidate"]}"
                  end

                  if $sales_play_values.include?arg["SalesPlayAdoption"]
                    puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayAdoption"]}"
                  else
                    putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayAdoption"]}"
                  end

                else
                  putstr "#{sales_play} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{sales_play} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{sales_play} pickList field" unless result
          sleep 3
        end

      else
        if  (ENV['UserRole'] == "SalesOperationSit")

          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == sales_play

                if $task_fields == true

                  result = true
                  $sales_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                  if $sales_play_values.count > 0

                    if $sales_play_values.include?arg["SalesPlayEnhance"]
                      puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayEnhance"]}"
                    else
                      putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayEnhance"]}"
                    end

                    if $sales_play_values.include?arg["SalesPlayTransform"]
                      puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayTransform"]}"
                    else
                      putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayTransform"]}"
                    end

                    if $sales_play_values.include?arg["SalesPlayConsolidate"]
                      puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayConsolidate"]}"
                    else
                      putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayConsolidate"]}"
                    end

                    if $sales_play_values.include?arg["SalesPlayAdoption"]
                      puts "Successfully see the #{sales_play} pickList value: #{arg["SalesPlayAdoption"]}"
                    else
                      putstr "Failed to see the #{sales_play} pickList value: #{arg["SalesPlayAdoption"]}"
                    end

                  else
                    putstr "#{sales_play} pickList field is disabled mode"
                  end
                else
                  putstr "Renewal Status #{sales_play} pickList field is not visible"
                end
              end
            end
            putstr "Failed to see the #{sales_play} pickList field" unless result
            sleep 3
          end
        end
      end
    else
      putstr "Failed to see the #{sales_play} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{sales_play} pickList values"
  end
end


When(/^I verify the task "([^"]*)" field is visible$/) do |status|
  begin
    sleep 2

    if page.has_content?(status)
      puts "Successfully see the #{status} field"

      if page.has_css?("#tsk12")
        puts "Successfully see the #{status} pickList field is editable"
      else
        putstr "Failed to see the #{status} pickList field is Read Only"
      end
    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} field is visible"
  end
end


When(/^I verify the task "([^"]*)" field values$/) do |status|
  begin
    sleep 3
    arg = getDetails 'TasksStatusPickListValues'

    if page.has_content?(status)
      puts "Successfully see the #{status} field"

      if page.has_css?("#tsk12")

        puts "Successfully see the #{status} pickList"

        $task_status_values = []

        all(:xpath,"//select[@id='tsk12']/option").each do |options|

          $task_status_values << options.text
        end

        if $task_status_values.include?arg["TasksStatusNotStarted"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusNotStarted"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusNotStarted"]}"
        end

        if $task_status_values.include?arg["TasksStatusInitiated"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusInitiated"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusInitiated"]}"
        end

        if $task_status_values.include?arg["TasksStatusInProgress"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusInProgress"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusInProgress"]}"
        end

        if $task_status_values.include?arg["TasksStatusCompletedSuccessfully"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusCompletedSuccessfully"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusCompletedSuccessfully"]}"
        end

        if $task_status_values.include?arg["TasksStatusCompletedUnsuccessfully"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusCompletedUnsuccessfully"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusCompletedUnsuccessfully"]}"
        end

      else
        putstr "Failed to see the #{status} pickList field"
      end

    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} pickList values"
  end
end


When(/^I update the task "([^"]*)" field$/) do |status|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(status)
      puts "Successfully see the #{status} field"
      sleep 2

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusCompletedSuccessfully"], :from => arg["TasksStatusField"], :match => :first)
        puts "Successfully selected the #{status} field value: #{arg["TasksStatusCompletedSuccessfully"]}"
      end

    else
      putstr "Failed to see the #{status} field"
    end

  rescue Exception => ex
    putstr "Error occurred while selecting the #{status} field value"
  end
end


Then(/^I verify the "([^"]*)" selected name should visible in "([^"]*)" page$/) do |competitor_name, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(competitor_name)
        puts "Successfully see the #{competitor_name} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[0].text == competitor_name
              puts "Successfully see the #{competitor_name} record"
              result = true
              if row.all("td")[1].first("div").text == arg["TasksCompetitorNameValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{competitor_name} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{competitor_name} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I able to see the "([^"]*)" selected name should visible in "([^"]*)" page$/) do |health_status, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(health_status)
        puts "Successfully see the #{health_status} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == health_status
              puts "Successfully see the #{health_status} record"
              result = true
              if row.all("td")[3].first("div").text == arg["TasksHealthStatusValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{health_status} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{health_status} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I able to see the task "([^"]*)" selected name should visible in "([^"]*)" page$/) do |health_status_reason, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(health_status_reason)
        puts "Successfully see the #{health_status_reason} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == health_status_reason
              puts "Successfully see the #{health_status_reason} record"
              result = true
              if row.all("td")[3].first("div").text == arg["TaskHealthStatusReasonValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{health_status_reason} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{health_status_reason} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I verify the task "([^"]*)" selected name should visible in "([^"]*)" page$/) do |segmentation_tag, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(segmentation_tag)
        puts "Successfully see the #{segmentation_tag} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[0].text == segmentation_tag
              puts "Successfully see the #{segmentation_tag} record"
              result = true
              if row.all("td")[1].first("div").text == arg["TasksRLMPlayValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{segmentation_tag} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{segmentation_tag} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I select the "([^"]*)" asset name$/) do |related_to|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_css?("#tsk3_mlktp")
      puts "Successfully see the #{related_to} field"

      find("#tsk3_mlktp").select arg["TasksAssetField"]
      sleep 5
    else
      putstr "Failed to see the #{related_to} field"
    end

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Related To Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskRelatedTo"])
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

  rescue Exception => ex
    putstr "Error occurred while selecting the #{related_to} asset name"
  end
end


When(/^I enter the task required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

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

      if page.has_select?(arg["TasksPriorityField"])
        select(arg["TasksPriorityValue"], :from => arg["TasksPriorityField"])
      end

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusValue"], :from => arg["TasksStatusField"], :match => :first)
      end

      if page.has_content?(arg["TasksDueDateField"])
        fill_in arg["TasksDueDateField"],:with => arg["TasksDueDateValue"]
      end

      if page.has_select?(arg["TasksHealthStatusField"])
        select(arg["TasksHealthStatusValue"], :from => arg["TasksHealthStatusField"], :match => :first)
      end

      if page.has_content?(arg["TasksCompetitorNameField"])
        fill_in arg["TasksCompetitorNameField"], :with => arg["TasksCompetitorNameValue"]
      end

      if page.has_select?(arg["TasksRLMPlayField"])
        select(arg["TasksRLMPlayValue"], :from => arg["TasksRLMPlayField"])
      end

      if page.has_select?(arg["TaskHealthStatusReasonField"])
        select(arg["TaskHealthStatusReasonValue"], :from => arg["TaskHealthStatusReasonField"])
      end

    end
    sleep 2

    within all(".pbSubsection")[3] do

      $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

      sleep 3
      if page.has_content?(arg["TasksSubjectField"])
        fill_in arg["TasksSubjectField"], :with => $create_task
      end

      sleep 3
      if page.has_content?(arg["TasksCommentsField"])
        fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
      end

      if page.has_select?(arg["TaskDirectionField"])
        select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
      end

    end
    sleep 3
    puts "Successfully fill the task required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the task required fields"
  end
end


When(/^I verify the task "([^"]*)" pickList field values$/) do |additional_product_training|
  begin
    sleep 2
    arg = getDetails 'TasksAdditionalProductTrainingPickListValues'

    sleep 2
    if page.has_content?(additional_product_training)
      puts "Successfully see the #{additional_product_training} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == additional_product_training

              if $task_fields == true
                result = true
                $additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $additional_product_training_values.count > 0


                  if $additional_product_training_values.include?arg["APTOnVideo"]
                    puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTOnVideo"]}"
                  else
                    putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTOnVideo"]}"
                  end

                  if $additional_product_training_values.include?arg["APTPrimeTime"]
                    puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTPrimeTime"]}"
                  else
                    putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTPrimeTime"]}"
                  end

                  if $additional_product_training_values.include?arg["APTHuddle"]
                    puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTHuddle"]}"
                  else
                    putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTHuddle"]}"
                  end

                  if $additional_product_training_values.include?arg["APTOnSocial"]
                    puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTOnSocial"]}"
                  else
                    putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTOnSocial"]}"
                  end

                else
                  putstr "#{additional_product_training} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{additional_product_training} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{additional_product_training} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin

            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == additional_product_training

                  if $task_fields == true

                    result = true
                    $additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $additional_product_training_values.count > 0


                      if $additional_product_training_values.include?arg["APTOnVideo"]
                        puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTOnVideo"]}"
                      else
                        putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTOnVideo"]}"
                      end

                      if $additional_product_training_values.include?arg["APTPrimeTime"]
                        puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTPrimeTime"]}"
                      else
                        putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTPrimeTime"]}"
                      end

                      if $additional_product_training_values.include?arg["APTHuddle"]
                        puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTHuddle"]}"
                      else
                        putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTHuddle"]}"
                      end

                      if $additional_product_training_values.include?arg["APTOnSocial"]
                        puts "Successfully see the #{additional_product_training} pickList value: #{arg["APTOnSocial"]}"
                      else
                        putstr "Failed to see the #{additional_product_training} pickList value: #{arg["APTOnSocial"]}"
                      end

                    else
                      putstr "#{additional_product_training} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{additional_product_training} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{additional_product_training} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{additional_product_training} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{additional_product_training} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{additional_product_training} pickList values"
  end
end



When(/^I open the created "([^"]*)" Task record$/) do |task_type|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(arg["MyTasksSection"])
      puts "Successfully see the #{arg["MyTasksSection"]} section"
      sleep 3
      if page.has_css?(".pShowMore")
        sleep 3
        puts "Successfully see the Task Pagination"
        within(".pShowMore") do
          first("a").click
        end
        puts "Successfully clicked the Task Pagination"
        sleep 3
      end
      sleep 3
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
                  row.all("td")[2].all("a")[0].click
                  sleep 4
                  result = true
                  break
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


When(/^I verify the default value should be "([^"]*)" for "([^"]*)" pickList$/) do |default_value, field|
  begin
    sleep 3

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(field)
        puts "Successfully see the #{field} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == field
              if $task_fields == true
                health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                if health_status.count > 0
                  puts "#{field} pickList field is editable"
                  result = true

                  if page.has_select?(field, :selected => default_value)
                     puts "Successfully see the #{field} default value: #{default_value}"
                  else
                    putstr "Failed to see the #{field} default value: #{default_value}"
                  end
                  break
                else
                  putstr "#{field} text box field is Read Only"
                end
              else
                putstr "#{field} text box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{field} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{field} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(field)
          puts "Successfully see the #{field} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == field
                if $task_fields == true
                  begin
                    health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                    if health_status.count > 0
                      putstr "#{field} text box field is editable"
                      result = true
                      if page.has_select?(field, :selected => default_value)
                        puts "Successfully see the #{field} default value: #{default_value}"
                      else
                        putstr "Failed to see the #{field} default value: #{default_value}"
                      end
                      break
                    end
                  rescue
                    puts "#{field} text box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{field} text box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{field} text box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList field is editable"
  end
end



When(/^I select the "([^"]*)" is "([^"]*)"$/) do |additional_product_training, option|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
      if page.has_content?(additional_product_training)
        puts "Successfully see the #{additional_product_training} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == additional_product_training
              additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
              if additional_product_training_values.count > 0
                puts "Successfully see the #{additional_product_training} pickList field is visible"

                if page.has_select?(additional_product_training)
                  select(option, :from => additional_product_training)
                  puts "Successfully selected the #{additional_product_training} pickList value: #{option}"
                  sleep 3
                end

                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{additional_product_training} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{additional_product_training} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{additional_product_training} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $task_fields = false
        if page.has_content?(additional_product_training)
          puts "Successfully see the #{additional_product_training} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == additional_product_training
                begin
                  additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  if additional_product_training_values.count > 0
                    putstr "Successfully see the #{additional_product_training} pickList field is visible"

                    if page.has_select?(additional_product_training)
                      select(option, :from => additional_product_training)
                      puts "Successfully selected the #{additional_product_training} pickList value: #{option}"
                      sleep 3
                    end

                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{additional_product_training} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{additional_product_training} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{additional_product_training} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{additional_product_training} field is visible"
  end
end


When(/^I verify the onVideo "([^"]*)" pickList values$/) do |on_video_atr|
  begin
    sleep 2
    arg = getDetails 'TasksOnVideoATRPickListValues'

    sleep 2
    if page.has_content?(on_video_atr)
      puts "Successfully see the #{on_video_atr} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == on_video_atr

              if $task_fields == true
                result = true
                $on_video_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $on_video_atr_values.count > 0


                  if $on_video_atr_values.include?arg["OnVideoATROverviewBestPractices"]
                    puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATROverviewBestPractices"]}"
                  else
                    putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATROverviewBestPractices"]}"
                  end

                  if $on_video_atr_values.include?arg["OnVideoATRScheduling"]
                    puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRScheduling"]}"
                  else
                    putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRScheduling"]}"
                  end

                  if $on_video_atr_values.include?arg["OnVideoATRJoining"]
                    puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRJoining"]}"
                  else
                    putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRJoining"]}"
                  end

                  if $on_video_atr_values.include?arg["OnVideoATRRecordingSharing"]
                    puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRRecordingSharing"]}"
                  else
                    putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRRecordingSharing"]}"
                  end

                  if $on_video_atr_values.include?arg["OnVideoATRMobileDevice"]
                    puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRMobileDevice"]}"
                  else
                    putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRMobileDevice"]}"
                  end

                else
                  putstr "#{on_video_atr} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{on_video_atr} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{on_video_atr} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin

            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == on_video_atr

                  if $task_fields == true

                    result = true
                    $on_video_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $on_video_atr_values.count > 0

                      if $on_video_atr_values.include?arg["OnVideoATROverviewBestPractices"]
                        puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATROverviewBestPractices"]}"
                      else
                        putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATROverviewBestPractices"]}"
                      end

                      if $on_video_atr_values.include?arg["OnVideoATRScheduling"]
                        puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRScheduling"]}"
                      else
                        putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRScheduling"]}"
                      end

                      if $on_video_atr_values.include?arg["OnVideoATRJoining"]
                        puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRJoining"]}"
                      else
                        putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRJoining"]}"
                      end

                      if $on_video_atr_values.include?arg["OnVideoATRRecordingSharing"]
                        puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRRecordingSharing"]}"
                      else
                        putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRRecordingSharing"]}"
                      end

                      if $on_video_atr_values.include?arg["OnVideoATRMobileDevice"]
                        puts "Successfully see the #{on_video_atr} pickList value: #{arg["OnVideoATRMobileDevice"]}"
                      else
                        putstr "Failed to see the #{on_video_atr} pickList value: #{arg["OnVideoATRMobileDevice"]}"
                      end

                    else
                      putstr "#{on_video_atr} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{on_video_atr} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{on_video_atr} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{on_video_atr} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{on_video_atr} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{on_video_atr} pickList values"
  end
end


When(/^I verify the Prime time "([^"]*)" pickList values$/) do |prime_time_atr|
  begin
    sleep 2
    arg = getDetails 'TasksPrimeTimeATRPickListValues'

    sleep 2
    if page.has_content?(prime_time_atr)
      puts "Successfully see the #{prime_time_atr} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == prime_time_atr

              if $task_fields == true
                result = true
                $prime_time_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $prime_time_atr_values.count > 0


                  if $prime_time_atr_values.include?arg["PTATROverviewBestPractices"]
                    puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATROverviewBestPractices"]}"
                  else
                    putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATROverviewBestPractices"]}"
                  end

                  if $prime_time_atr_values.include?arg["PTATRScheduling"]
                    puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRScheduling"]}"
                  else
                    putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRScheduling"]}"
                  end

                  if $prime_time_atr_values.include?arg["PTATRJoining"]
                    puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRJoining"]}"
                  else
                    putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRJoining"]}"
                  end

                  if $prime_time_atr_values.include?arg["PTATRModerator"]
                    puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRModerator"]}"
                  else
                    putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRModerator"]}"
                  end

                else
                  putstr "#{prime_time_atr} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{prime_time_atr} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{prime_time_atr} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin

            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == prime_time_atr

                  if $task_fields == true

                    result = true
                    $prime_time_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $prime_time_atr_values.count > 0


                     if $prime_time_atr_values.include?arg["PTATROverviewBestPractices"]
                       puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATROverviewBestPractices"]}"
                     else
                       putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATROverviewBestPractices"]}"
                     end

                     if $prime_time_atr_values.include?arg["PTATRScheduling"]
                      puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRScheduling"]}"
                     else
                      putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRScheduling"]}"
                     end

                     if $prime_time_atr_values.include?arg["PTATRJoining"]
                      puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRJoining"]}"
                     else
                      putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRJoining"]}"
                     end

                     if $prime_time_atr_values.include?arg["PTATRModerator"]
                      puts "Successfully see the #{prime_time_atr} pickList value: #{arg["PTATRModerator"]}"
                     else
                      putstr "Failed to see the #{prime_time_atr} pickList value: #{arg["PTATRModerator"]}"
                     end

                    else
                      putstr "#{prime_time_atr} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{prime_time_atr} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{prime_time_atr} pickList field" unless result
              sleep 3
            end
          rescue
            puts "#{prime_time_atr} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{prime_time_atr} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{prime_time_atr} pickList values"
  end
end

When(/^I verify the Huddle "([^"]*)" pickList values$/) do |huddle_atr|
  begin
    sleep 2
    arg = getDetails 'TasksHuddleATRPickListValues'

    sleep 2
    if page.has_content?(huddle_atr)
      puts "Successfully see the #{huddle_atr} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == huddle_atr

              if $task_fields == true
                result = true
                $huddle_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $huddle_atr_values.count > 0
			
                  if $huddle_atr_values.include?arg["HuddleATROverviewBestPractices"]
                    puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATROverviewBestPractices"]}"
                  else
                    putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATROverviewBestPractices"]}"
                  end

                  if $huddle_atr_values.include?arg["HuddleATRComponentCompatibility"]
                    puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATRComponentCompatibility"]}"
                  else
                    putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATRComponentCompatibility"]}"
                  end

                  if $huddle_atr_values.include?arg["HuddleATRBenefitsFeatures"]
                    puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATRBenefitsFeatures"]}"
                  else
                    putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATRBenefitsFeatures"]}"
                  end

                else
                  putstr "#{huddle_atr} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{huddle_atr} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{huddle_atr} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin

            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == huddle_atr

                  if $task_fields == true

                    result = true
                    $huddle_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $huddle_atr_values.count > 0


                      if $huddle_atr_values.include?arg["HuddleATROverviewBestPractices"]
                      puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATROverviewBestPractices"]}"
                      else
                      putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATROverviewBestPractices"]}"
                      end

                      if $huddle_atr_values.include?arg["HuddleATRComponentCompatibility"]
                      puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATRComponentCompatibility"]}"
                      else
                      putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATRComponentCompatibility"]}"
                      end

                      if $huddle_atr_values.include?arg["HuddleATRBenefitsFeatures"]
                      puts "Successfully see the #{huddle_atr} pickList value: #{arg["HuddleATRBenefitsFeatures"]}"
                      else
                      putstr "Failed to see the #{huddle_atr} pickList value: #{arg["HuddleATRBenefitsFeatures"]}"
                      end
					  
                    else
                      putstr "#{huddle_atr} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{huddle_atr} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{huddle_atr} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{huddle_atr} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{huddle_atr} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{huddle_atr} pickList values"
  end
end


When(/^I verify the onSocial "([^"]*)" pickList values$/) do |on_social_atr|
  begin
    sleep 2
    arg = getDetails 'TasksOnSocialATRPickListValues'

    sleep 2
    if page.has_content?(on_social_atr)
      puts "Successfully see the #{on_social_atr} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == on_social_atr

              if $task_fields == true
                result = true
                $on_social_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $on_social_atr_values.count > 0

				
                  if $on_social_atr_values.include?arg["OnSocialATROverviewBestPractices"]
                    puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATROverviewBestPractices"]}"
                  else
                    putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATROverviewBestPractices"]}"
                  end

                  if $on_social_atr_values.include?arg["OnSocialATRScheduling"]
                    puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRScheduling"]}"
                  else
                    putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRScheduling"]}"
                  end

                  if $on_social_atr_values.include?arg["OnSocialATRModerate"]
                    puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRModerate"]}"
                  else
                    putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRModerate"]}"
                  end

                  if $on_social_atr_values.include?arg["OnSocialATRBroadcast"]
                    puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRBroadcast"]}"
                  else
                    putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRBroadcast"]}"
                  end

                else
                  putstr "#{on_social_atr} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{on_social_atr} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{on_social_atr} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")
          begin
            within all(".pbSubsection")[2] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == on_social_atr

                  if $task_fields == true

                    result = true
                    $on_social_atr_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $on_social_atr_values.count > 0


                        if $on_social_atr_values.include?arg["OnSocialATROverviewBestPractices"]
                        puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATROverviewBestPractices"]}"
                        else
                        putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATROverviewBestPractices"]}"
                        end

                        if $on_social_atr_values.include?arg["OnSocialATRScheduling"]
                        puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRScheduling"]}"
                        else
                        putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRScheduling"]}"
                        end

                        if $on_social_atr_values.include?arg["OnSocialATRModerate"]
                        puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRModerate"]}"
                        else
                        putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRModerate"]}"
                        end

                        if $on_social_atr_values.include?arg["OnSocialATRBroadcast"]
                        puts "Successfully see the #{on_social_atr} pickList value: #{arg["OnSocialATRBroadcast"]}"
                        else
                        putstr "Failed to see the #{on_social_atr} pickList value: #{arg["OnSocialATRBroadcast"]}"
                        end

                    else
                      putstr "#{on_social_atr} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{on_social_atr} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{on_social_atr} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{on_social_atr} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{on_social_atr} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{on_social_atr} pickList values"
  end
end


When(/^I verify the "([^"]*)" checkbox field should be visible in the right column under "([^"]*)"$/) do |executive_business_review_completed, rlm_details|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
      if page.has_xpath?("//label[text() = '#{executive_business_review_completed}']/preceding::h3[text() = '#{rlm_details}']")
        puts "Successfully see the #{executive_business_review_completed} check box field is visible in the right column under #{rlm_details}"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == executive_business_review_completed
              if row.all("td")[3].first("input")[:type] == arg["TasksCheckBoxType"]
                puts "Successfully see the #{executive_business_review_completed} check box field is editable"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{executive_business_review_completed} check box field is Read Only"
              end
            end
          end
          putstr "Failed to see the #{executive_business_review_completed} check box field" unless result
          sleep 3
        end
      else
        putstr "#{executive_business_review_completed} check box field is not visible in the right column under #{rlm_details}"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $task_fields = false
        if page.has_xpath?("//label[text() = '#{executive_business_review_completed}']/preceding::h3[text() = '#{rlm_details}']")
          puts "Successfully see the #{executive_business_review_completed} check box field is visible in the right column under #{rlm_details}"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == executive_business_review_completed
                begin
                  if row.all("td")[3].first("input")[:type] == arg["TasksCheckBoxType"]
                    putstr "#{executive_business_review_completed} check box field is editable"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "#{executive_business_review_completed} check box field is Read Only"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{executive_business_review_completed} check box field" unless result
            sleep 3
          end
        else
          putstr "#{executive_business_review_completed} check box field is not visible in the right column under #{rlm_details}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{executive_business_review_completed} check box field is visible"
  end
end


When(/^I verify the "([^"]*)" checkbox should be editable for all except SalesOps$/) do |executive_business_review_completed|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(executive_business_review_completed)
        puts "Successfully see the #{executive_business_review_completed} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == executive_business_review_completed
              if $task_fields == true
                if row.all("td")[3].first("input")[:type] == arg["TasksCheckBoxType"]
                  puts "#{executive_business_review_completed} check box field is editable"
                  result = true
                  break
                else
                  putstr "#{executive_business_review_completed} check box field is Read Only"
                end
              else
                putstr "#{executive_business_review_completed} check box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{executive_business_review_completed} check box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{executive_business_review_completed} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(executive_business_review_completed)
          puts "Successfully see the #{executive_business_review_completed} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == executive_business_review_completed
                if $task_fields == true
                  begin
                    if row.all("td")[3].first("div").first("input")[:type] == arg["TasksCheckBoxType"]
                      putstr "#{executive_business_review_completed} check box field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{executive_business_review_completed} check box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{executive_business_review_completed} check box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{executive_business_review_completed} check box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{executive_business_review_completed} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{executive_business_review_completed} check box field is editable"
  end
end


When(/^I verify the "([^"]*)" text field should be visible in the right column under "([^"]*)"$/) do |if_no_why, rlm_details|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
      if page.has_xpath?("//label[text() = '#{if_no_why}']/preceding::h3[text() = '#{rlm_details}']")
        puts "Successfully see the #{if_no_why} check box field is visible in the right column under #{rlm_details}"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == if_no_why
              if row.all("td")[3].first("input")[:type] == arg["TasksTextBoxType"]
                puts "Successfully see the #{if_no_why} check box field is editable"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{if_no_why} check box field is Read Only"
              end
            end
          end
          putstr "Failed to see the #{if_no_why} check box field" unless result
          sleep 3
        end
      else
        putstr "#{if_no_why} check box field is not visible in the right column under #{rlm_details}"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $task_fields = false
        if page.has_xpath?("//label[text() = '#{if_no_why}']/preceding::h3[text() = '#{rlm_details}']")
          puts "Successfully see the #{if_no_why} check box field is visible in the right column under #{rlm_details}"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == if_no_why
                begin
                  if row.all("td")[3].first("input")[:type] == arg["TasksTextBoxType"]
                    putstr "#{if_no_why} check box field is editable"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "#{if_no_why} check box field is Read Only"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{if_no_why} check box field" unless result
            sleep 3
          end
        else
          putstr "#{if_no_why} check box field is not visible in the right column under #{rlm_details}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{if_no_why} check box field is visible"
  end
end


When(/^I able to see the "([^"]*)" text field should be editable for all except SalesOps$/) do |if_no_why|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(if_no_why)
        puts "Successfully see the #{if_no_why} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == if_no_why
              if $task_fields == true
                if row.all("td")[3].first("input")[:type] == arg["TasksTextBoxType"]
                  puts "#{if_no_why} check box field is editable"
                  result = true
                  break
                else
                  putstr "#{if_no_why} check box field is Read Only"
                end
              else
                putstr "#{if_no_why} check box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{if_no_why} check box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{if_no_why} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(if_no_why)
          puts "Successfully see the #{if_no_why} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == if_no_why
                if $task_fields == true
                  begin
                    if row.all("td")[3].first("div").first("input")[:type] == arg["TasksTextBoxType"]
                      putstr "#{if_no_why} check box field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{if_no_why} check box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{if_no_why} check box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{if_no_why} check box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{if_no_why} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{if_no_why} check box field is editable"
  end
end


When(/^I verify the "([^"]*)" pickList should be visible in the right column under "([^"]*)"$/) do |additional_product_training, rlm_details|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $task_fields = false
      if page.has_xpath?("//label[text() = '#{additional_product_training}']/preceding::h3[text() = '#{rlm_details}']")
        puts "Successfully see the #{additional_product_training} pickList field is visible in the right column under #{rlm_details}"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == additional_product_training
              additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
              if additional_product_training_values.count > 0
                puts "Successfully see the #{additional_product_training} pickList field is visible"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{additional_product_training} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{additional_product_training} pickList field" unless result
          sleep 3
        end
      else
        putstr "#{additional_product_training} pickList field is not visible in the right column under #{rlm_details}"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")

        $task_fields = false
        if page.has_xpath?("//label[text() = '#{additional_product_training}']/preceding::h3[text() = '#{rlm_details}']")
          puts "Successfully see the #{additional_product_training} pickList field is visible in the right column under #{rlm_details}"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == additional_product_training
                begin
                  additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  if additional_product_training_values.count > 0
                    putstr "Successfully see the #{additional_product_training} pickList field is visible"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{additional_product_training} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{additional_product_training} pickList field" unless result
            sleep 3
          end
        else
          putstr "#{additional_product_training} pickList field is not visible in the right column under #{rlm_details}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{additional_product_training} field is visible"
  end
end


When(/^I verify the "([^"]*)" pickList field editable permissions except SalesOps$/) do |additional_product_training|
  begin
    sleep 3

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(additional_product_training)
        puts "Successfully see the #{additional_product_training} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == additional_product_training
              if $task_fields == true
                additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                if additional_product_training_values.count > 0
                  puts "#{additional_product_training} pickList field is editable"
                  result = true
                  break
                else
                  putstr "#{additional_product_training} pickList is Read Only"
                end
              else
                putstr "#{additional_product_training} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{additional_product_training} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{additional_product_training} field"
      end
    else
      if  (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(additional_product_training)
          puts "Successfully see the #{additional_product_training} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == additional_product_training
                if $task_fields == true
                  begin
                    additional_product_training_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                    if additional_product_training_values.count > 0
                      putstr "#{additional_product_training} pickList field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{additional_product_training} pickList field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{additional_product_training} pickList field is not visible"
                end
              end
            end
            putstr "Failed to see the #{additional_product_training} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{additional_product_training} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{additional_product_training} pickList field is editable"
  end
end



When(/^I select the "([^"]*)" check box$/) do |deployment_completed|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_content?(deployment_completed)
        puts "Successfully see the #{deployment_completed} field"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == deployment_completed

              if row.all("td")[3].first("input")[:type] == arg["TasksCheckBoxType"]
                 puts "#{deployment_completed} check box field is editable"
                 sleep 3
                 result = true
                  unless find('input[type=checkbox]').checked?
                    find('input[type=checkbox]').click
                    puts "Successfully select the #{deployment_completed} check box"
                    break
                  else
                    puts "#{deployment_completed} check box is already enabled"
                  end
              end
            end
          end
          putstr "Failed to see the #{deployment_completed} check box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{deployment_completed} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(deployment_completed)
          puts "Successfully see the #{deployment_completed} field"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == deployment_completed
                begin
                  if row.all("td")[3].first("div").first("input")[:type] == arg["TasksCheckBoxType"]
                    putstr "#{deployment_completed} check box field is editable"
                    result = true
                    unless find('input[type=checkbox]').checked?
                      find('input[type=checkbox]').click
                      puts "Successfully select the #{deployment_completed} check box"
                      break
                    else
                      puts "#{deployment_completed} check box is already enabled"
                    end
                  end
                rescue
                  puts "#{deployment_completed} check box field is Read Only"
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{deployment_completed} check box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{deployment_completed} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{deployment_completed} check box"
  end
end

