

And(/^I able to see the "([^"]*)" cases pickList fields$/) do |field|
  begin
  sleep 2
  arg = getDetails 'NewCasesInformation'

  if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
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

      if $case_types.include?arg["CaseTypeDataProcessingRequest"]
        puts "Successfully see the #{field} pickList value: #{arg["CaseTypeDataProcessingRequest"]}"
      else
        putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeDataProcessingRequest"]}"
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

  elsif (ENV['UserRole'] == "SalesOperationSit")
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
  else
   if (ENV['UserRole'] == "Admin")

     if page.has_css?("#p3")
       puts "Successfully see the #{field} pickList field"

       if $case_types.include?arg["CaseTypeBookingRequest"]
         puts "Successfully see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
       else
         putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
       end

       if $case_types.include?arg["CaseTypeDataProcessingRequest"]
         puts "Successfully see the #{field} pickList value: #{arg["CaseTypeDataProcessingRequest"]}"
       else
         putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeDataProcessingRequest"]}"
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
       putstr "Failed to see the #{field} pickList field"
     end

   end
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

      sleep 4
      find("img[alt='Contact Name Lookup (New Window)']").click
      sleep 4
      within_window(page.driver.browser.window_handles.last) do
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
        sleep 3
        within_frame("searchFrame")do
          fill_in("lksrch",:with=> arg["CaseContactName"])
          sleep 5
          click_button('Go!')
          sleep 5
        end
        page.driver.browser.switch_to.frame("resultsFrame")
        within('.pbBody') do
          all("tbody")[0].all("tr")[1].all("th")[0].find('a').click
          sleep 3
          puts "Successfully fill the Contact name"
        end
      end
      sleep 4
      fill_in arg["CasesDescriptionField"],:with => arg["CasesDescription"]
      puts "Successfully fill the #{arg["CasesDescriptionField"]}: #{arg["CasesDescription"]}"
      sleep 3
    end


    within all(".pbSubsection")[0] do

      if page.has_select?(arg["CasesStatusField"])
        select(arg["CasesStatus"], :from => arg["CasesStatusField"])
        puts "Successfully selected the #{arg["CasesStatusField"]}: #{arg["CasesStatus"]}"
      end

      if page.has_select?(arg["CasesPriorityField"])
        select(arg["CasesPriority"], :from => arg["CasesPriorityField"])
        puts "Successfully selected the #{arg["CasesPriorityField"]}: #{arg["CasesPriority"]}"
      end

      if page.has_select?(arg["CasesSubCaseTypeField"])
        begin
          select(arg["CasesSubCaseType"], :from => arg["CasesSubCaseTypeField"])
          puts "Successfully selected the #{arg["CasesSubCaseTypeField"]}: #{arg["CasesSubCaseType"]}"
        rescue
          select(arg["CasesLeadSubCaseType"], :from => arg["CasesSubCaseTypeField"])
          puts "Successfully selected the #{arg["CasesSubCaseTypeField"]}: #{arg["CasesLeadSubCaseType"]}"
        rescue
          select(arg["CasesDataUpdateRequest"], :from => arg["CasesSubCaseTypeField"])
          puts "Successfully selected the #{arg["CasesSubCaseTypeField"]}: #{arg["CasesDataUpdateRequest"]}"
        end
      end
    end

    if page.has_content?(arg["BookingRequestDetails"])
      sleep 3
      within all(".pbSubsection")[2] do
        if page.has_xpath?("//label[text()='#{arg["CasesContractAmountField"]}']/ancestor::td[1]/following-sibling::td[1]//input")

          fill_in arg["CasesContractAmountField"],:with => arg["CasesContractAmount"]
          puts "Successfully selected the #{arg["CasesContractAmountField"]}: #{arg["CasesContractAmount"]}"
        end
      end
    end

    if page.has_content?(arg["LeadSubmissionDetailsSection"])
      sleep 3
      within all(".pbSubsection")[2] do
        if page.has_xpath?("//label[text()='#{arg["CasesNewTermDatesField"]}']/parent::td/following-sibling::td[1]//textarea")

          fill_in arg["CasesNewTermDatesField"],:with => arg["NewTermDates"]
          puts "Successfully fill the #{arg["CasesNewTermDatesField"]}: #{arg["NewTermDates"]}"

        end

        if page.has_xpath?("//label[text()='#{arg["CasesProductNeedsQuotedField"]}']/parent::td/following-sibling::td[1]//textarea")

          fill_in arg["CasesProductNeedsQuotedField"],:with => arg["ProductNeedsToBeQuoted"]
          puts "Successfully fill the #{arg["CasesProductNeedsQuotedField"]}: #{arg["ProductNeedsToBeQuoted"]}"

        end


        if page.has_xpath?("//label[text()='#{arg["CasesApplicableDiscountsField"]}']/parent::td/following-sibling::td[1]//textarea")

          fill_in arg["CasesApplicableDiscountsField"],:with => arg["ApplicableDiscounts"]
          puts "Successfully fill the #{arg["CasesApplicableDiscountsField"]}: #{arg["ApplicableDiscounts"]}"

        end
      end
    end

    if page.has_content?(arg["QuoteRequestDetailsSection"])
      within all(".pbSubsection")[2] do
        if page.has_xpath?("//label[text()='#{arg["CasesQuoteTypeField"]}']/parent::td/following-sibling::td[1]//select")

            select(arg["CasesQuoteType"], :from => arg["CasesQuoteTypeField"])
            puts "Successfully selected the #{arg["CasesQuoteTypeField"]}: #{arg["CasesQuoteType"]}"
        end
      end
    end

    puts "Successfully fill the case required fields"
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while filling the case required fields"
  end
end


And(/^I select the "([^"]*)" from "([^"]*)"$/) do |option, field_name|
  begin
    sleep 3
    $account_status = false
    if page.has_content?(field_name)
      puts "Successfully see the #{field_name} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == field_name
            $field_status = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
            if $field_status.count > 0
              puts "Successfully see the #{field_name} pickList field is enabled"
              if page.has_select?(field_name)
                select(option, :from => field_name)
                puts "Successfully selected the #{option} from #{field_name}"
                sleep 3
              end
              $account_status = true
              result = true
              break
            else
              putstr "Failed to see the #{field_name} pickList field is disabled"
            end
          end
        end
        putstr "Failed to see the #{field_name} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field_name} field"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} from #{field_name}"
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


And(/^I select the "([^"]*)" value from "([^"]*)" pickList$/) do |option, sub_case_type|
  begin
    sleep 3
    $sub_case_type_status = false
    if page.has_content?(sub_case_type)
      puts "Successfully see the #{sub_case_type} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == sub_case_type
            $sub_case_type_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
            if $sub_case_type_values.count > 0
              puts "Successfully see the #{sub_case_type} pickList field is enabled"
              if page.has_select?(sub_case_type)
                select(option, :from => sub_case_type)
                puts "Successfully selected the #{option} from #{sub_case_type}"
                sleep 3
              end
              $sub_case_type_status = true
              result = true
              break
            else
              putstr "Failed to see the #{sub_case_type} pickList field is disabled"
            end
          end
        end
        putstr "Failed to see the #{sub_case_type} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{sub_case_type} field"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} from #{sub_case_type}"
  end
end


And(/^I verify the "([^"]*)" should be "([^"]*)"$/) do |case_milestone, case_milestones_name|
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
           if row.first("th").first("a").text == case_milestones_name
             puts "Successfully see the Case Milestones Name: #{case_milestones_name}"
             if row.all("td")[2].text != ""
               puts "Successfully see the #{case_milestone} Target Date"
             else
               putstr "Failed to see the #{case_milestone} Target Date"
             end
           else
             putstr "Failed to see the Case Milestones Name: #{case_milestones_name}"
           end

         end
         putstr "Failed to see the #{case_milestone} should be #{case_milestones_name}" unless result
         sleep 3
       end
      end
   else
      putstr "No Case Milestones records found"
   end
  end
   rescue Exception => ex
   putstr "Error occurred while verifying the #{case_milestone} should be #{case_milestones_name}"
  end
end


Then(/^I able to see the "([^"]*)" created renewal case$/) do |record_type|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if (page.has_content?(arg["CasesDetailsPage"]))  && (page.has_content?(arg["CasesDetailsApprovalHistory"]))
      puts "Successfully see the #{arg["CasesDetailsPage"]} page"

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
        if first("tbody").all("tr")[7].all("td")[3].first("img")[:title] == "Checked"
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


When(/^I "([^"]*)" the "([^"]*)" case$/) do |edit, case_record_type|
  begin
    sleep 3
    if page.has_button?(edit)
      click_on edit
      sleep 2
      puts "Successfully click the #{edit} button from #{case_record_type} case details page"
    else
      putstr "Failed to see the #{edit} button from #{case_record_type} case details page"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{edit} button"
  end
end

Then(/^I verify the "([^"]*)" case updated successfully$/) do |case_record_type|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if (page.has_content?(arg["CasesDetailsPage"])) && (page.has_content?(arg["CasesDetailsApprovalHistory"]))
      puts "Successfully see the updated the #{case_record_type} case"
      if page.has_css?(".pageDescription")
        puts "Successfully see the updated the #{case_record_type} case"
      else
        putstr "Failed to updated the #{case_record_type} case"
      end
    else
      putstr "Failed to updated the #{case_record_type} case"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying updated #{case_record_type} case"
  end
end



When(/^I select the "([^"]*)" check box$/) do |request_escalation|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    within all(".pbSubsection")[0] do
      within(".detailList") do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[2].text == request_escalation
            puts "Successfully see the #{request_escalation} field"
            result = true
            if row.all("td")[3].all("div")[0].first("img")[:title] == arg["CasesRequestEscalationCheckBox"]
              puts "Successfully see the #{request_escalation} check box field"
              row.all("td")[3].all("div")[0].first("img").double_click
              puts "Successfully double clicked the #{request_escalation} check box"
              sleep 4
              within(".inlineEditDiv") do
                first("input").click
              end
              sleep 3
              break
            else
              putstr "Failed to see the #{request_escalation} check box field"
            end
          end
        end
        putstr "Failed to see the #{request_escalation} field" unless result
        sleep 3
      end
   end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{request_escalation} check box"
  end
end


And(/^I double click on "([^"]*)" text box$/) do |escalation_reason|
  begin
    sleep 3

    within all(".pbSubsection")[0] do
      within(".detailList") do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[2].text == escalation_reason
            puts "Successfully see the #{escalation_reason} field"
            result = true
            if row.all("td")[3].first("div").text == ""
              puts "Successfully see the #{escalation_reason} text box field"
              row.all("td")[3].first("div").double_click
              puts "Successfully double clicked the #{escalation_reason} text box"
              sleep 3
              break
            else
              putstr "Failed to see the #{escalation_reason} text box field"
            end
          end
        end
        putstr "Failed to see the #{escalation_reason} field" unless result
        sleep 3
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{escalation_reason} text box"
  end
end


And(/^I enter the "([^"]*)" message and click on "([^"]*)" button$/) do |escalation_reason, ok_button|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if page.has_css?("#InlineEditDialogTitle")
      puts "Successfully see the #{escalation_reason} pop up window"
      if page.has_content? escalation_reason
        within("#InlineEditDialogContent") do
          first("textarea").send_keys arg["CasesEscalationReasonMessage"]
          puts "Successfully enter the #{escalation_reason} message"
          sleep 4
          within("#InlineEditDialog_buttons") do
            first("input").click
            sleep 4
            puts "Successfully clicked the #{ok_button} button"
          end
        end
      else
        putstr "Failed to see the #{escalation_reason} pop up window"
      end
    else
      putstr "Failed to see the #{escalation_reason} pop up window"
    end
  rescue Exception => ex
    putstr "Error occurred while entering the #{escalation_reason} message"
  end
end

And(/^I verify the case "([^"]*)" pickList field is visible$/) do |ns_ha_insight|
  begin
    sleep 2
  if page.has_content?(ns_ha_insight)
    puts "Successfully see the #{ns_ha_insight} pickList field"
    within all(".pbSubsection")[0] do
      tr = first("tbody").all("tr")
      sleep 3
      result = false
      tr.each do |row|
        if row.all("td")[0].text == ns_ha_insight

          if ($sub_case_type_status == true) && ($account_status == true)
            $ns_ha_insight = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

            if $ns_ha_insight.count > 1
              puts "Successfully see the #{ns_ha_insight} pickList field is enabled"
              result = true
              break
            else
              putstr "#{ns_ha_insight} pickList field is disabled mode"
            end
          else
            putstr "Sub Case Type, Renewal Status and #{ns_ha_insight} pickList fields are not visible"
          end
        end
      end
      putstr "Failed to see the #{ns_ha_insight} pickList field" unless result
      sleep 3
    end
    else
      putstr "Failed to see the #{ns_ha_insight} pickList field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{ns_ha_insight} pickList field"
  end
end

And(/^I verify the "([^"]*)" pickList value "([^"]*)"$/) do |ns_ha_insight, ns_ha_insight_option|
  begin
   sleep 3

   if page.has_content?(ns_ha_insight)
     puts "Successfully see the #{ns_ha_insight} field"
     within all(".pbSubsection")[0] do
       tr = first("tbody").all("tr")
       sleep 3
       result = false
       tr.each do |row|
         if row.all("td")[0].text == ns_ha_insight

          if ($sub_case_type_status == true) && ($account_status == true)
             $ns_ha_insight = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

             if $ns_ha_insight.count > 0
               puts "Successfully see the #{ns_ha_insight} pickList field is enabled"
               result = true

               if $ns_ha_insight.include? ns_ha_insight_option
                 puts "Successfully see the #{ns_ha_insight} pickList value: #{ns_ha_insight_option}"
               else
                 putstr "Failed to see the #{ns_ha_insight} pickList value: #{ns_ha_insight_option}"
               end

               break
             else
               putstr "#{ns_ha_insight} pickList field is disabled mode"
             end
          else
            putstr "Sub Case Type, Renewal Status #{ns_ha_insight} pickList field are not visible"
          end
         end
       end
       putstr "Failed to see the #{ns_ha_insight} pickList field" unless result
       sleep 3
     end
   else
     putstr "Failed to see the #{ns_ha_insight} field"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{ns_ha_insight_option} pickList value from #{ns_ha_insight}"
  end
end


And(/^I verify the renewal status "([^"]*)" selection "([^"]*)" pickList values$/) do |renewal_status_option, ns_ha_insight|
  begin
    sleep 3
    arg = getDetails 'CasesPickListValues'

    if page.has_content?(ns_ha_insight)
      puts "Successfully see the #{ns_ha_insight} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == ns_ha_insight

          if ($sub_case_type_status == true) && ($account_status == true)
            result = true
            $ns_ha_insight = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

           if $ns_ha_insight.count > 0


            if renewal_status_option == arg["CasesNSCanNotReachContactCNCPickListName"]

              if $ns_ha_insight.include?arg["CasesNSCanNotReachContactCNCOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCanNotReachContactCNCOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCanNotReachContactCNCOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCanNotReachContactCNCOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCanNotReachContactCNCOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCanNotReachContactCNCOption2"]}"
              end
            end


            if renewal_status_option == arg["CasesNSClientInternalReplacementCPRPickListName"]

              if $ns_ha_insight.include?arg["CasesNSClientInternalReplacementCPROption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSClientInternalReplacementCPROption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSClientInternalReplacementCPROption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSClientInternalReplacementCPROption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSClientInternalReplacementCPROption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSClientInternalReplacementCPROption2"]}"
              end
            end


            if renewal_status_option == arg["CasesNSCustomerCostBenefitDecisionSCBPickListName"]

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption2"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption3"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption3"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption3"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption4"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption4"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption4"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption5"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption5"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption5"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerCostBenefitDecisionSCBOption6"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption6"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerCostBenefitDecisionSCBOption6"]}"
              end

            end


            if renewal_status_option == arg["CasesNSCustomerSatisfactionDrivenCSDPickListName"]

              if $ns_ha_insight.include?arg["CasesNSCustomerSatisfactionDrivenCSDOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerSatisfactionDrivenCSDOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerSatisfactionDrivenCSDOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSCustomerSatisfactionDrivenCSDOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerSatisfactionDrivenCSDOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSCustomerSatisfactionDrivenCSDOption2"]}"
              end
            end


            if renewal_status_option == arg["CasesNSNoProductNPPickListName"]

              if $ns_ha_insight.include?arg["CasesNSNoProductNPOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSNoProductNPOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSNoProductNPOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSNoProductNPOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSNoProductNPOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSNoProductNPOption2"]}"
              end
            end


            if renewal_status_option == arg["CasesNSNotInBudgetNIBPickListName"]

              if $ns_ha_insight.include?arg["CasesNSNotInBudgetNIBOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSNotInBudgetNIBOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSNotInBudgetNIBOption1"]}"
              end

            end


            if renewal_status_option == arg["CasesNSProductDecommissionedPPDPickListName"]

              if $ns_ha_insight.include?arg["CasesNSProductDecommissionedPPDOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSProductDecommissionedPPDOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSProductDecommissionedPPDOption2"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSProductDecommissionedPPDOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSProductDecommissionedPPDOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSProductDecommissionedPPDOption1"]}"
              end

            end


            if renewal_status_option == arg["CasesNSReplacedwithCompetingProduct"]

              if $ns_ha_insight.include?arg["CasesNSReplacedWithCompetingProductOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSReplacedWithCompetingProductOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption2"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSReplacedWithCompetingProductOption3"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption3"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption3"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSReplacedWithCompetingProductOption4"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption4"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSReplacedWithCompetingProductOption4"]}"
              end
            end


            if renewal_status_option == arg["CasesNSThirdPartyMaintenanceSPMPickListName"]

              if $ns_ha_insight.include?arg["CasesNSThirdPartyMaintenanceSPMOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSThirdPartyMaintenanceSPMOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption2"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSThirdPartyMaintenanceSPMOption3"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption3"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSThirdPartyMaintenanceSPMOption3"]}"
              end
            end


            if renewal_status_option == arg["CasesNSUnresponsiveEndUserREUPickListName"]

              if $ns_ha_insight.include?arg["CasesNSUnresponsiveEndUserREUOption1"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSUnresponsiveEndUserREUOption1"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSUnresponsiveEndUserREUOption1"]}"
              end

              if $ns_ha_insight.include?arg["CasesNSUnresponsiveEndUserREUOption2"]
                puts "Successfully see the #{ns_ha_insight} pickList value: #{arg["CasesNSUnresponsiveEndUserREUOption2"]}"
              else
                putstr "Failed to see the #{ns_ha_insight} pickList value: #{arg["CasesNSUnresponsiveEndUserREUOption2"]}"
              end
            end

         else
           putstr "#{ns_ha_insight} text box field is disabled mode"
         end
           else
             putstr "Renewal Status #{ns_ha_insight} pickList field is not visible"
           end
          end
        end
        putstr "Failed to see the #{ns_ha_insight} text box field" unless result
        sleep 3
       end
    else
      putstr "Failed to see the #{ns_ha_insight} pickList"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{ns_ha_insight} pickList value option #{renewal_status_option}"
  end
end


When(/^I click on "([^"]*)" button from "([^"]*)" case$/) do |edit, case_record_type|
  begin
    sleep 3
    if page.has_button?(edit)
      within("#topButtonRow") do
        click_on edit
        sleep 2
        puts "Successfully click the #{edit} button"
      end
      else
      putstr "Failed to see the #{edit} button from #{case_record_type} case details page"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{edit} button"
  end
end


Then(/^I verify the House Account "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 2
    arg = getDetails 'CasesRenewalStatusPickListValues'

    sleep 3
    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
				
              if row.all("td")[0].text == renewal_status

                $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                result = true

                if $renewal_status_values.count > 0
                  puts "Successfully see the #{renewal_status} pickList values"
                else
                  putstr "Failed to see the #{renewal_status} pickList values"
                end

              end
            end
            putstr "#{renewal_status} pickList field is not visible" unless result
            sleep 3
          end


          if $renewal_status_values.include? arg["CasesRenewalStatusHABDT"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHABDT"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHABDT"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHACNL"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACNL"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACNL"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHACOV"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACOV"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACOV"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHADUP"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHADUP"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHADUP"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAEOL"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEOL"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEOL"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAEVG"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEVG"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEVG"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHASPB"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHASPB"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHASPB"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAAPAC"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAAPAC"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAAPAC"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAEMEA"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEMEA"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEMEA"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHANALA"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHANALA"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHANALA"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHALEA"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHALEA"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHALEA"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAOEM"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOEM"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOEM"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAOTH"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOTH"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOTH"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusHAPRT"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAPRT"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAPRT"]}"
          end

        else
          putstr "#{renewal_status} pickList field with read only permissions"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

            within all(".pbSubsection")[0] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == renewal_status

                  $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                  result = true

                  if $renewal_status_values.count > 0
                    puts "Successfully see the #{renewal_status} pickList values"
                  else
                    putstr "Failed to see the #{renewal_status} pickList values"
                  end

                end
              end
              putstr "#{renewal_status} pickList field is not visible" unless result
              sleep 3
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHABDT"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHABDT"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHABDT"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHACNL"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACNL"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACNL"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHACOV"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACOV"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHACOV"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHADUP"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHADUP"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHADUP"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAEOL"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEOL"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEOL"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAEVG"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEVG"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEVG"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHASPB"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHASPB"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHASPB"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAAPAC"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAAPAC"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAAPAC"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAEMEA"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEMEA"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAEMEA"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHANALA"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHANALA"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHANALA"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHALEA"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHALEA"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHALEA"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAOEM"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOEM"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOEM"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAOTH"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOTH"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAOTH"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusHAPRT"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAPRT"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusHAPRT"]}"
            end

          else
            putstr "#{renewal_status} pickList field with read only permissions"
          end
        end
      end
    else
      putstr "Failed to see the #{renewal_status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList values"
  end
end


Then(/^I verify the No Service "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 2
    arg = getDetails 'CasesRenewalStatusPickListValues'

    sleep 3
    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
				
              if row.all("td")[0].text == renewal_status

                $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                result = true

                if $renewal_status_values.count > 0
                  puts "Successfully see the #{renewal_status} pickList values"
                else
                  putstr "Failed to see the #{renewal_status} pickList values"
                end

              end
            end
            putstr "#{renewal_status} pickList field is not visible" unless result
            sleep 3
          end


          if $renewal_status_values.include? arg["CasesRenewalStatusNSPTR"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPTR"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPTR"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSPCP"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPCP"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPCP"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSSCS"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCS"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCS"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSSCB"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCB"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCB"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSRNE"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRNE"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRNE"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSSSD"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSSD"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSSD"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSPEL"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPEL"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPEL"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSUEU"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSUEU"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSUEU"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSRDM"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRDM"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRDM"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSPPD"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPPD"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPPD"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSSPM"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSPM"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSPM"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSREU"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSREU"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSREU"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSRUV"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRUV"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRUV"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSRVN"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRVN"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRVN"]}"
          end

          if $renewal_status_values.include? arg["CasesRenewalStatusNSDVN"]
            puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSDVN"]}"
          else
            putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSDVN"]}"
          end

        else
          putstr "#{renewal_status} pickList field with read only permissions"
        end
      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

            within all(".pbSubsection")[0] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
			    
                if row.all("td")[0].text == renewal_status

                  $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                  result = true

                  if $renewal_status_values.count > 0
                    puts "Successfully see the #{renewal_status} pickList values"
                  else
                    putstr "Failed to see the #{renewal_status} pickList values"
                  end

                end
              end
              putstr "#{renewal_status} pickList field is not visible" unless result
              sleep 3
            end


            if $renewal_status_values.include? arg["CasesRenewalStatusNSPTR"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPTR"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPTR"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSPCP"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPCP"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPCP"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSSCS"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCS"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCS"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSSCB"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCB"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSCB"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSRNE"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRNE"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRNE"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSSSD"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSSD"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSSD"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSPEL"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPEL"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPEL"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSUEU"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSUEU"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSUEU"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSRDM"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRDM"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRDM"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSPPD"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPPD"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSPPD"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSSPM"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSPM"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSSPM"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSREU"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSREU"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSREU"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSRUV"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRUV"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRUV"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSRVN"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRVN"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSRVN"]}"
            end

            if $renewal_status_values.include? arg["CasesRenewalStatusNSDVN"]
              puts "Successfully see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSDVN"]}"
            else
              putstr "Failed to see the #{renewal_status} pickList value: #{arg["CasesRenewalStatusNSDVN"]}"
            end

          else
            putstr "#{renewal_status} pickList field with read only permissions"
          end
        end
      end
    else
      putstr "Failed to see the #{renewal_status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList values"
  end
end


Then(/^I verify the Closed Sale "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 2
    arg = getDetails 'CasesRenewalStatusPickListValues'

    sleep 3
    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"

      if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

        if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == renewal_status

                $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                result = true

                if $renewal_status_values.count > 0
                   puts "Successfully see the #{renewal_status} pickList values"
                else
                  putstr "Failed to see the #{renewal_status} pickList values"
                end

              end
            end
            putstr "#{renewal_status} pickList field is not visible" unless result
            sleep 3
          end
        else
          putstr "#{renewal_status} pickList field with read only permissions"
        end

      else
        if (ENV['UserRole'] == "SalesOperationSit")

          if page.has_xpath?("//label[text()='#{renewal_status}']/parent::td/following-sibling::td[1]//select")

            within all(".pbSubsection")[0] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[0].text == renewal_status

                  $renewal_status_values = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
                  result = true

                  if $renewal_status_values.count > 0
                    puts "Successfully see the #{renewal_status} pickList values"
                  else
                    putstr "Failed to see the #{renewal_status} pickList values"
                  end

                end
              end
              putstr "#{renewal_status} pickList field is not visible" unless result
              sleep 3
            end
          else
            putstr "#{renewal_status} pickList field with read only permissions"
          end
        end
      end
    else
      putstr "Failed to see the #{renewal_status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList values"
  end
end


When(/^I verify the Case "([^"]*)" details$/) do |milestones_name|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit") || (ENV['UserRole'] == "SalesOperationSit")

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
                  if row.first("th").first("a").text == arg["APACCasesMilestone12Hours"]
                    puts "Successfully see the case #{milestones_name}: #{arg["APACCasesMilestone12Hours"]}"
                  else
                    putstr "Failed to see the case #{milestones_name}: #{arg["APACCasesMilestone12Hours"]}"
                  end
                end

                if $priority_status == arg["CasesPriorityNormal"]
                  if row.first("th").first("a").text == arg["APAC24CasesMilestone24Hours"]
                    puts "Successfully see the case #{milestones_name}: #{arg["APAC24CasesMilestone24Hours"]}"
                  else
                    putstr "Failed to see the case #{milestones_name}: #{arg["APAC24CasesMilestone24Hours"]}"
                  end
                end

                if $priority_status == arg["CasesPriorityLow"]
                  if row.first("th").first("a").text == arg["APAC48CasesMilestone48Hours"]
                    puts "Successfully see the case #{milestones_name}: #{arg["APAC48CasesMilestone48Hours"]}"
                  else
                    putstr "Failed to see the case #{milestones_name}: #{arg["APAC48CasesMilestone48Hours"]}"
                  end
                end


                if row.all("td")[1].first("a").text.include? arg["CasesAPACBusinessHours"]
                  puts "Successfully see the case #{arg["BusinessHoursField"]}: #{arg["CasesAPACBusinessHours"]}"
                else
                  putstr "Failed to see the case #{arg["BusinessHoursField"]}: #{arg["CasesAPACBusinessHours"]}"
                end

              end
              putstr "Failed to see the case #{milestones_name}" unless result
              sleep 3
            end
          end
        else
          putstr "No Case Milestones records found"
        end
       end

    else
      if (ENV['UserRole'] == "EMEAOperationManagerSit") || (ENV['UserRole'] == "EMEAOperationRepSit") || (ENV['UserRole'] == "EMEAAdmin") || (ENV['UserRole'] == "EMEASalesManagerSit") || (ENV['UserRole'] == "EMEASalesRepSit") || (ENV['UserRole'] == "EMEASalesOperationSit")

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
                    if row.first("th").first("a").text == arg["EMEACasesMilestone12Hours"]
                      puts "Successfully see the case #{milestones_name}: #{arg["EMEACasesMilestone12Hours"]}"
                    else
                      putstr "Failed to see the case #{milestones_name}: #{arg["EMEACasesMilestone12Hours"]}"
                    end
                  end

                  if $priority_status == arg["CasesPriorityNormal"]
                    if row.first("th").first("a").text == arg["EMEACasesMilestone24Hours"]
                      puts "Successfully see the case #{milestones_name}: #{arg["EMEACasesMilestone24Hours"]}"
                    else
                      putstr "Failed to see the case #{milestones_name}: #{arg["EMEACasesMilestone24Hours"]}"
                    end
                  end

                  if $priority_status == arg["CasesPriorityLow"]
                    if row.first("th").first("a").text == arg["EMEACasesMilestone48Hours"]
                      puts "Successfully see the case #{milestones_name}: #{arg["EMEACasesMilestone48Hours"]}"
                    else
                      putstr "Failed to see the case #{milestones_name}: #{arg["EMEACasesMilestone48Hours"]}"
                    end
                  end

                  if row.all("td")[1].first("a").text.include? arg["CasesEMEABusinessHours"]
                    puts "Successfully see the case #{arg["BusinessHoursField"]}: #{arg["CasesEMEABusinessHours"]}"
                  else
                    putstr "Failed to see the case #{arg["BusinessHoursField"]}: #{arg["CasesEMEABusinessHours"]}"
                  end

                end
                putstr "Failed to see the case #{milestones_name} " unless result
                sleep 3
              end
            end
          else
            putstr "No Case Milestones records found"
          end
        end

      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the case #{milestones_name} details"
  end
end


And(/^I select the "([^"]*)" pickList value is "([^"]*)"$/) do |status, status_option|
  begin
   sleep 3
    within all(".pbSubsection")[0] do

      if page.has_select?(status)
        select(status_option, :from => status)
        puts "Successfully selected the #{status}: #{status_option}"
      end

    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{status} pickList value is #{status_option}"
  end
end


And(/^I select the "([^"]*)" pickList value from "([^"]*)"$/) do |option, sub_case_type|
  begin
    sleep 3
    if page.has_content?(sub_case_type)
      puts "Successfully see the #{sub_case_type} field"

      if page.has_select?(sub_case_type)
        select(option, :from => sub_case_type)
        puts "Successfully selected the #{option} from #{sub_case_type}"
        sleep 3
      end

    else
      putstr "Failed to see the #{sub_case_type} field"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} pickList value from #{sub_case_type}"
  end
end