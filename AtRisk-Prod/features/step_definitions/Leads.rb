
When(/^I click on "([^"]*)" from "([^"]*)" page$/) do |tab, context|
  begin
    sleep 3
    if page.has_css?(".allTabsArrow")
      puts "Successfully find the #{context} plus icon"
      find(".allTabsArrow").click
      sleep 3
      if page.has_content? context
        first(:link, tab).click
        sleep 3
        puts "Successfully navigated to the #{tab} page"
      else
        putstr "Failed to navigated to the #{tab} page"
      end
    else
      putstr "Failed to find the #{context} plus icon"
    end
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end

Then(/^I should see "([^"]*)" section$/) do |value|
  if page.has_content?(value)
    puts "#{value} section is visible"
  else
    writeFailure "#{value} section is not visible"
  end
end

Then(/^I should not see Notes and Attachments section$/) do
  if page.should have_no_content('Notes & Attachments')
    puts "Notes & Attachments section is removed successfully"
  else
    writeFailure "Notes & Attachments section not removed in lead edit page"
  end
end


And(/^I verify the "([^"]*)" pickList field$/) do |lead_status|
  begin
    sleep 2
    if page.has_content?(lead_status)
      puts "Successfully see the #{lead_status} name"
      if page.has_xpath?("//select[@id='lea13']")
        puts "Successfully see the #{lead_status} pickList field"
      else
        putstr "Failed to see the #{lead_status} pickList field"
      end
    else
      putstr "Failed to see the #{lead_status} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lead_status} pickList field"
  end
end


And(/^I verify the "([^"]*)" pickList values$/) do |lead_status|
  begin
    sleep 2
    arg = getDetails 'AccountLeadStatusPickListValues'

    if page.has_xpath?("//select[@id='lea13']")

      puts "Successfully see the #{lead_status} pickList"

      $lead_status = []

      all(:xpath,"//select[@id='lea13']/option").each do |options|

        $lead_status << options.text
      end

      if $lead_status.include?arg["LeadStatusContacted"]
        puts "Successfully see the #{lead_status} #{arg["LeadStatusContacted"]} pickList value"
      else
        putstr "Failed to see the #{lead_status} #{arg["LeadStatusContacted"]} pickList value"
      end

      if $lead_status.include?arg["LeadStatusNurturing"]
        puts "Successfully see the #{lead_status} #{arg["LeadStatusNurturing"]} pickList value"
      else
        putstr "Failed to see the #{lead_status} #{arg["LeadStatusNurturing"]} pickList value"
      end

      if $lead_status.include?arg["LeadStatusQualified"]
        puts "Successfully see the #{lead_status} #{arg["LeadStatusQualified"]} pickList value"
      else
        putstr "Failed to see the #{lead_status} #{arg["LeadStatusQualified"]} pickList value"
      end

      if $lead_status.include?arg["LeadStatusUnqualified"]
        puts "Successfully see the #{lead_status} #{arg["LeadStatusUnqualified"]} pickList value"
      else
        putstr "Failed to see the #{lead_status} #{arg["LeadStatusUnqualified"]} pickList value"
      end

      if $lead_status.include?arg["LeadStatusOnHold"]
        puts "Successfully see the #{lead_status} #{arg["LeadStatusOnHold"]} pickList value"
      else
        putstr "Failed to see the #{lead_status} #{arg["LeadStatusOnHold"]} pickList value"
      end

    else
      putstr "Failed to see the #{lead_status} pickList"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lead_status} pickList values"
  end
end


And(/^I fill the all lead required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewLeadInformation'

    $lead_name = "#{arg["LastName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"


    if page.has_css?("#lea13")
      puts "Successfully see the Lead Status field"
      find("#lea13").send_keys arg["LeadStatus"]
    else
      putstr "Failed to find the Lead Status field"
    end

    if page.has_css?("#name_lastlea2")
      puts "Successfully see the Last Name field"
      find("#name_lastlea2").send_keys $lead_name
    else
      putstr "Failed to find the Last Name field"
    end

    if page.has_css?("#lea3")
      puts "Successfully see the company field"
      find("#lea3").send_keys arg["Company"]
    else
      putstr "Failed to find the company field"
    end
    puts "Successfully fill the all lead required fields"

  rescue Exception => ex
    putstr "Error occurred while filling the all lead required fields"
  end
end


When(/^I fill the all required fields to create a new lead$/) do
  $newlead="smoke-test-lead-" + Random.new.rand(0001..10000).to_s
  puts $newlead
  fill_in "Last Name",:with => $newlead
  sleep 3
  fill_in "Company",:with => "pe-testing"
  sleep 5
end


And(/^I able to see the lead created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".topName")
      if find(".topName").text == $lead_name
        puts "Successfully created the Lead: #{$lead_name}"
      else
        putstr "Failed to created the Lead: #{$lead_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#lea2_ileinner").text == $lead_name
          puts "Successfully created the Lead: #{$lead_name}"
        else
          putstr "Failed to created the Lead: #{$lead_name}"
        end
      end
    else
      putstr "Failed to created the Lead: #{$lead_name}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Lead record: #{$lead_name}"
  end
end
