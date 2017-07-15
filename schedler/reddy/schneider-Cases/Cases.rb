
And(/^I able to see the "([^"]*)" cases pickList fields$/) do |field|
  begin
  sleep 2
  arg = getDetails 'NewCasesInformation'

  if page.has_css?("#p3")

    puts "Successfully see the #{field} pickList"

    $case_types = []

    all(:xpath,"//select[@id='p3']/option").each do |options|

      $case_types << options.text
    end

    if $case_types.include?arg["CaseTypeBookingRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
    end

    if $case_types.include?arg["CaseTypeDataUpdateRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeDataUpdateRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeDataUpdateRequest"]}"
    end

    if $case_types.include?arg["CaseTypeLeadSubmission"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeLeadSubmission"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeLeadSubmission"]}"
    end

    if $case_types.include?arg["CaseTypeQuoteRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeQuoteRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeQuoteRequest"]}"
    end

    if $case_types.include?arg["CaseTypeReportingRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeReportingRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeReportingRequest"]}"
    end
  else
    putstr "Failed to see the #{field} pickList"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
 end
end


And(/^I fill the case required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    within all(".pbSubsection")[1] do

      begin
        fill_in "Opportunity",:with => arg["CaseOpportunityName"]
      rescue
        sleep 3
        find("img[alt='Opportunity Lookup (New Window)']").click
        sleep 4
        within_window(page.driver.browser.window_handles.last) do
          sleep 5
          page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
          sleep 3
          within_frame("searchFrame")do
            fill_in("lksrch",:with=> arg["CaseOpportunityName"])
            sleep 5
            click_button('Go!')
            sleep 5
          end
          page.driver.browser.switch_to.frame("resultsFrame")
          within('.pbBody') do
           all("tbody")[0].all("tr")[1].all("th")[0].find('a').click
           sleep 3
           puts "Successfully fill the Opportunity name"
          end
        end
      end

     sleep 4
      fill_in "Contact Name",:with => arg["CaseContactName"]
      sleep 3
    end

    within("#topButtonRow") do
       click_on arg["CaseSaveButton"]
    end

    sleep 3
    within all(".pbSubsection")[1] do

      if page.has_xpath?("//select[@title='Opportunity Select']")

        puts "Successfully see the Opportunity drop drown field"

        find(:xpath,"//select[@title='Opportunity Select']").find(:xpath, 'option[2]').select_option

        puts "Successfully fill the Opportunity name"
      end

      if page.has_xpath?("//select[@title='Contact Name Select']")

        puts "Successfully see the Contact drop drown field"

         find(:xpath,"//select[@title='Contact Name Select']").find(:xpath, 'option[2]').select_option

        puts "Successfully fill the Contact name"
      else
        putstr "Failed to see the Contact drop down field"
      end

      fill_in "Description",:with => arg["CasesDescription"]
      puts "Successfully fill the Description: #{arg["CasesDescription"]}"
      sleep 3
    end


    within all(".pbSubsection")[0] do

      if page.has_select?("Status")
        select(arg["CasesStatus"], :from => "Status")
        puts "Successfully selected the Status: #{arg["CasesStatus"]}"
      end

      if page.has_select?("Priority")
        select(arg["CasesPriority"], :from => "Priority")
        puts "Successfully selected the Priority: #{arg["CasesPriority"]}"
      end

      if page.has_select?("Sub Case Type")
        begin
         select(arg["CasesSubCaseType"], :from => "Sub Case Type")
         puts "Successfully selected the Sub Case Type: #{arg["CasesSubCaseType"]}"
        rescue
         select(arg["CasesLeadSubCaseType"], :from => "Sub Case Type")
         puts "Successfully selected the Sub Case Type: #{arg["CasesLeadSubCaseType"]}"
        rescue
         select(arg["CasesDataUpdateRequest"], :from => "Sub Case Type")
         puts "Successfully selected the Sub Case Type: #{arg["CasesDataUpdateRequest"]}"
        end
      end
    end

    if page.has_content?(arg["BookingRequestDetails"])
      sleep 3
      if page.has_xpath?('//*[@id="ep"]/div[2]/div[7]/table/tbody/tr[1]/td[2]/div/input')
        within all(".pbSubsection")[2] do
          fill_in "Contract Amount",:with => arg["CasesContractAmount"]
          puts "Successfully selected the Quote Type: #{arg["CasesQuoteType"]}"
        end
      end
    end

    if page.has_content?(arg["LeadSubmissionDetailsSection"])
      sleep 3
      if page.has_xpath?('//*[@id="ep"]/div[2]/div[7]/table/tbody/tr[1]/td[2]/div/textarea')
        within all(".pbSubsection")[2] do
          fill_in "New Term Dates",:with => arg["NewTermDates"]
          puts "Successfully fill the New Term Dates: #{arg["NewTermDates"]}"

          fill_in "Product(s) That Needs To Be Quoted",:with => arg["ProductThasNeedsToBeQuoted"]
          puts "Successfully fill the Product(s) That Needs To Be Quoted: #{arg["ProductThasNeedsToBeQuoted"]}"

          fill_in "Applicable Discounts",:with => arg["ApplicableDiscounts"]
          puts "Successfully fill the Applicable Discounts: #{arg["ApplicableDiscounts"]}"
        end
      end
    end

    if page.has_content?(arg["QuoteRequestDetailsSection"])
      if page.has_xpath?('//*[@id="ep"]/div[2]/div[7]/table/tbody/tr[1]/td[2]/div/span/select')
        within all(".pbSubsection")[2] do
          select(arg["CasesQuoteType"], :from => "Quote Type")
          puts "Successfully selected the Quote Type: #{arg["CasesQuoteType"]}"
        end
     end
    end
    puts "Successfully fill the case required fields"
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while filling the case required fields"
  end
end


And(/^I select the "([^"]*)" is "([^"]*)"$/) do |priority, state|
  begin
  sleep 3
  within all(".pbSubsection")[0] do

    $priority_status = state

    if page.has_select?(priority)
      select(state, :from => priority)
    end
    puts "Successfully selected the #{priority} is #{state}"
  end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{priority} is #{state}"
  end
end


And(/^I select the "([^"]*)" from "([^"]*)"$/) do |option, renewal_status|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    within all(".pbSubsection")[0] do

      if page.has_select?("Sub Case Type")
          select(arg["CasesRenewalStatusValue"], :from => "Sub Case Type")
      end
      sleep 3

      if page.has_select?(renewal_status)
        select(option, :from => renewal_status)
      end
      puts "Successfully selected the #{option} from #{renewal_status}"
    end

  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} from #{renewal_status}"
  end
end



And(/^I able to see the "([^"]*)" case created successfully$/) do |state|
  begin
   sleep 3
   arg = getDetails 'NewCasesInformation'

   if page.has_content?(arg["CasesDetailsPage"])
     puts "Successfully see the Case details page"

     if page.has_css?("#RecordType_ileinner")

       sleep 4
      if find("#RecordType_ileinner").text.include? state
         puts "Successfully see the Case Record Type: #{state}"
      else
         putstr "Failed to see the Case Record Type: #{state}"
      end
     else
       putstr "Failed to see the Case Record Type field"
     end

   else
     putstr "Failed to created the #{state} case"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying created #{state} case"
  end
end


And(/^I able to see the "([^"]*)" content$/) do |content|
  begin
    sleep 3
    if page.has_content? content
      puts "Successfully see the the #{content} content"
    else
      raise "Failed to see the #{content} content"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} content"
  end
end


And(/^I verify the "([^"]*)" is "([^"]*)"$/) do |case_milestones, case_milestones_name|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    within(".listRelatedObject.caseBlock") do
      unless page.has_content?(arg["NoCasesMessage"])
        within(".pbBody") do
          within(".list") do
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|

              result = true
              if $priority_status == arg["CasesPriorityHigh"]
                if row.first("th").first("a").text == case_milestones_name
                  puts "Successfully see the #{case_milestones}: #{case_milestones_name}"
                else
                  putstr "Failed to see the #{case_milestones}: #{case_milestones_name}"
                end
              end

              if $priority_status == arg["CasesPriorityNormal"]
                if row.first("th").first("a").text == case_milestones_name
                  puts "Successfully see the #{case_milestones}: #{case_milestones_name}"
                else
                  putstr "Failed to see the #{case_milestones}: #{case_milestones_name}"
                end
              end

              if $priority_status == arg["CasesPriorityLow"]
                if row.first("th").first("a").text == case_milestones_name
                  puts "Successfully see the #{case_milestones}: #{case_milestones_name}"
                else
                  putstr "Failed to see the #{case_milestones}: #{case_milestones_name}"
                end
              end

              if row.all("td")[1].first("a").text.include? arg["CasesBusinessHours"]
                puts "Successfully see the Case Business Hours: #{arg["CasesBusinessHours"]}"
              else
                putstr "Failed to see the Case Business Hours: #{arg["CasesBusinessHours"]}"
              end

            end
            putstr "Failed to see the #{case_milestones} is #{case_milestones_name}" unless result
            sleep 3
          end
        end
      else
        putstr "No Case Milestones records found"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{case_milestones} is #{case_milestones_name}"
  end
end


And(/^I verify the "([^"]*)" should be "([^"]*)"$/) do |name, business_hours|
  begin
  sleep 3
  arg = getDetails 'NewCasesInformation'

  within(".listRelatedObject.caseBlock") do
   unless page.has_content?(arg["NoCasesMessage"])
     within(".pbBody") do
       within(".list") do
         tr = first("tbody").all(".dataRow")
         sleep 3
         result = false
         tr.each do |row|

           result = true
           if row.first("th").first("a").text == business_hours
             puts "Successfully see the Business Hours: #{business_hours}"
           else
             putstr "Failed to see the Business Hours: #{business_hours}"
           end

           if row.all("td")[2].text.include? arg["CasesTargetDate"]
             puts "Successfully see the #{name}"
           else
             putstr "Failed to see the #{name}"
           end

         end
         putstr "Failed to see the #{name} is #{business_hours}" unless result
         sleep 3
       end
      end
   else
      putstr "No Case Milestones records found"
   end
  end
   rescue Exception => ex
   putstr "Error occurred while verifying the #{name} should be #{business_hours}"
  end
end


Then(/^I able to see the "([^"]*)" created renewal case$/) do |record_type|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if page.has_content?(arg["CasesDetailsPage"])
      puts "Successfully see the Case details page"

      sleep 2
      within all(".pbSubsection")[0] do

        if page.has_content? record_type
          puts "Successfully see the the case #{record_type}"
        else
          putstr "Failed to see the case #{record_type}"
        end

      end

    else
      putstr "Failed to created the case #{arg["CasesDetailsPage"]} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying case #{record_type}"
  end
end


And(/^I able to see the "([^"]*)" icon next to "([^"]*)" button$/) do |lock, edit|
  begin
  sleep 3
   if page.has_xpath?("//input[@title='Edit']/preceding-sibling::img[@title='Locked']")
     puts "Successfully see the #{lock} icon next to #{edit} button"
   else
     putstr "Failed to see the #{lock} icon next to #{edit} button"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lock} icon next to #{edit} button"
  end
end


And(/^I "([^"]*)" should shows "([^"]*)"$/) do |case_owner, owner_name|
  begin
  sleep 2
  within all(".pbSubsection")[0] do

    if page.has_content? case_owner
      puts "Successfully see the the #{case_owner} content"
    else
      putstr "Failed to see the #{case_owner} content"
    end

    sleep 3
    if page.has_content? owner_name
      puts "Successfully see the the #{owner_name} name"
    else
      putstr "Failed to see the #{owner_name} name"
    end
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{case_owner} should shows #{owner_name}"
  end
end


When(/^I open the existing case from "([^"]*)" filter$/) do |filter_name|
  begin
    sleep 4
    arg = getDetails 'NewCasesInformation'

    find('#fcf').select filter_name
    sleep 4
    if page.has_css?(".fBody")
      within (".fBody") do
        click_button 'Go!'
      end
    end
    sleep 4

    unless page.has_content?(arg["NoCasesMessage"])
      result = false
      all(:xpath, '//div/table/tbody/tr/td[6]/div/a').each do |case_record|

        puts "Successfully find the case record"
        case_record.click
        sleep 3
        puts "Successfully open the case record"
        result = true
        break
      end
      putstr "Failed to find the case record" unless result
      sleep 3
    else
      putstr "No #{filter_name} cases found"
    end
  rescue Exception => ex
    putstr "Error occurred while opening the existing case record from #{filter_name} filter"
  end
end


Then(/^I able to see the "([^"]*)" case section$/) do |approval_history|
  begin
  sleep 2
  within(".relatedProcessHistory") do

    if page.has_content? approval_history
      puts "Successfully see the the #{approval_history} section"
    else
      putstr "Failed to see the #{approval_history} section"
    end
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{approval_history} section"
  end
end


When(/^I click on the "([^"]*)" the link$/) do |approve_reject_link|
  begin
   sleep 3

   if page.has_css?(".relatedProcessHistory")
    within(".relatedProcessHistory") do

      puts "Successfully see the Approval History section"
       find(:xpath,"//table/tbody/tr[3]/td[1]/a[2]").click
       puts "Successfully clicked the #{approve_reject_link} link"
       sleep 4
    end

    else
      putstr "Failed to see the Approval History section"
        sleep 3
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{approve_reject_link} link"
 end
end



And(/^I enter the "([^"]*)" comments$/) do |approve_reject|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if page.has_css?("#Comments")
      puts "Successfully see the #{approve_reject} Comments text box"
      fill_in "Comments",:with => arg["CasesDescription"]
      puts "Successfully fill the #{approve_reject} Comments: #{arg["CasesDescription"]}"
      sleep 3
    else
      putstr "Failed to see the #{approve_reject} Comments text box"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{approve_reject} Comments text box"
  end
end


And(/^I verify the case "([^"]*)" status$/) do |approved|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

  if page.has_content?(arg["CasesDetailsPage"])
    puts "Successfully see the Case details page"

    within(".relatedProcessHistory") do
      within(".pbBody") do
        within(".list") do
          tr = first("tbody").all(".dataRow")
          sleep 3
          tr.each do |row|

            if row.all("td")[5].first("div").first("span").text == approved
              puts "Successfully see the #{approved} status"
              sleep 3
              break
            else
              putstr "Failed to see the #{approved} status"
            end
          end
        end
      end
    end
    else
      putstr "Failed to see the Case details page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{approved} status"
  end
end


And(/^I "([^"]*)" icon should no longer be visible$/) do |lock|
  begin
    sleep 3
    unless page.has_xpath?("//input[@title='Edit']/preceding-sibling::img[@title='Locked']")
      puts "Unable to see the #{lock} icon"
    else
      putstr "Able to see the #{lock} icon"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lock} icon is visible"
  end
end


And(/^I "([^"]*)" checkbox should be checked$/) do |approval_criteria|
  begin
    sleep 3
    if page.has_content? approval_criteria
      puts "Successfully see the the #{approval_criteria} field"
      within all(".pbSubsection")[0] do
        if first("table").all("tr")[7].all("td")[3].first("img")[:title] == "Checked"
          puts "Successfully see the the #{approval_criteria} checkbox is checked"
        else
          putstr "Failed to see the #{approval_criteria} checkbox is checked"
        end
      end
    else
      putstr "Failed to see the #{approval_criteria} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{approval_criteria} checkbox is checked"
  end
end

