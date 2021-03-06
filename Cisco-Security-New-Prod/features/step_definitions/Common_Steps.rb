
Given(/^I login to the "([^"]*)" application$/) do |application|
  begin
    visit env
    sleep 8
    arg = getCredentialInfo
    fill_in "Username",:with => arg["Username"]
    fill_in "Password",:with => arg["Password"]
    sleep 5
    find("#Login").click
    sleep 5
    puts "Successfully entered the #{application} user credentials"
    sleep 3
  rescue Exception => ex
    raise "Error occurred while entering #{application} user credentials"
  end
end


Then(/^I able to see the logged in to "([^"]*)" application$/) do |app|
  sleep 5
  if page.has_css?("#userNav")
    puts "Successfully logged in to #{app} application"
  else
    raise "Failed to logged in to #{app} application"
  end
end


And(/^I click on the "([^"]*)" button$/) do |button_text|
  begin
    sleep 3
    if page.has_button?(button_text)
      click_on button_text
      sleep 2
      puts "Successfully click the #{button_text} button"
    else
      putstr "Failed to see the #{button_text} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
  end
end


When(/^I click on the "([^"]*)" tab$/) do |tab|
  begin
    sleep 5
    first(:link, tab).click
    sleep 10
    puts "Successfully navigated to #{tab} tab"
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end

When(/^I click on "([^"]*)" link$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
      click_on name
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{name} link"
  end
end


When(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |name, currency|
  begin
    sleep 3
    if page.has_button? name
      puts "Successfully see the #{name} button"
      find(:xpath,"//input[@title='#{name}']").click
      sleep 2
      puts "Successfully click the #{name} button"
    else
      putstr "Failed to see the #{name} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{name} button from #{currency} page"
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


When(/^I click on "([^"]*)" link from user menu$/) do |setup|
  begin
    sleep 2
    find("#userNavButton").click
    sleep 2
    within("#userNav-menuItems") do
      click_on setup
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{setup} link"
  end
end

And(/^I click on "([^"]*)" button from new "([^"]*)" page$/) do |save, context|
  begin
    sleep 3
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{context} page"
        click_on save
      else
        putstr "Failed to see the #{save} button from #{context} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{context} page"
  end
end


Then(/^I able to see the "([^"]*)" page$/) do |content|
  begin
    sleep 4
    if page.has_content? content
      puts "Successfully see the the #{content} page"
    else
      putstr "Failed to see the #{content} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} page"
  end
end

Then(/^I able to see the "([^"]*)" name$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} link"
  end
end

And(/^I fill the "([^"]*)" required fields$/) do |location_address|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    $location_address = "#{arg["LocationAddressName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the #{location_address} Name field"
      fill_in "Location Address Name",:with => $location_address

      puts "Successfully fill the the #{location_address} required fields"
      sleep 3
    else
      raise "Failed to see the #{location_address} Name field"
    end
  rescue Exception => ex
    putstr "Error occurred while filling the #{location_address} required fields"
  end
end


Then(/^I able to see the created "([^"]*)"$/) do |location_address|
  begin
    sleep 3
    if page.has_css?(".pageDescription")
      if find(".pageDescription").text == $location_address
        puts "Successfully created the #{location_address}: #{$location_address}"
      else
        putstr "Failed to created the #{location_address}: #{$location_address}"
      end
      within(".pbSubsection") do
        if find("#Name_ileinner").text == $location_address
          puts "Successfully created the #{location_address}: #{$location_address}"
        else
          putstr "Failed to created the #{location_address}: #{$location_address}"
        end
      end
    else
      putstr "Failed to created the #{location_address}: #{$location_address}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created #{location_address} record: #{$location_address}"
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

    sleep 3

    fill_in "Estimated Amount",:with => arg["LeadEstimatedAmount"]

    fill_in "Estimated Close Date",:with => arg["LeadEstimatedCloseDate"]


    if page.has_css?("#lea5")
      puts "Successfully see the Lead Source PickList"
      find("#lea5").select arg["LeadSource"]
    else
      putstr "Failed to find the Lead Source PickList"
    end

    sleep 4

    select(arg["LeadType"], :from => "Lead Type")

    select(arg["LeadSubType"], :from => "Lead Sub-Type")

    sleep 4
    puts "Successfully fill the all lead required fields"

  rescue Exception => ex
    putstr "Error occurred while filling the all lead required fields"
  end
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


When(/^I fill the asset required fields$/) do
  begin
    sleep 2
    arg = getDetails 'OpportunityAssets'

    $asset_name = "#{arg["AssetName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the Asset Name field"
      find("#Name").send_keys $asset_name
    else
      putstr "Failed to find the Asset Name field"
    end

    if page.has_css?("#Product2")
      puts "Successfully see the Product Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Product Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetProductName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Product Lookup field"
    end

    #if page.has_css?("#Account")
    #  puts "Successfully see the Account field"
    #  main = page.driver.browser.window_handles.first
    #  find(:xpath,"//a[@title='Account Lookup (New Window)']").click
    #  sleep 3
    #  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    #  lookup = page.driver.browser.window_handles.last
    #  page.driver.browser.switch_to.frame("searchFrame")
    #  fill_in("lksrch",:with=> arg["AssetAccountName"])
    #  sleep 3
    #  find_button('Go!').click
    #  sleep 4
    #  page.driver.browser.switch_to.window(lookup)
    #  page.driver.browser.switch_to.frame("resultsFrame")
    #  within('.pbBody') do
    #    all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    #  end
    #  page.driver.browser.switch_to.window(main)
    #  sleep 6
    #else
    #  putstr "Failed to find the Account field"
    #end

    if page.has_css?("#Contact")
      puts "Successfully see the Contact field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Contact Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetContactName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Contact field"
    end


    if page.has_css?("#SerialNumber")
      puts "Successfully see the Serial Number field"
      find("#SerialNumber").send_keys arg["AssetSerialNumber"]
    else
      putstr "Failed to find the Serial Number field"
    end

    puts "Successfully fill the asset required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the asset required fields"
  end
end


Then(/^I able to see the asset created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'OpportunityAssets'

    if page.has_content? arg["AssetDetailsPage"]
      puts "Successfully see the #{arg["AssetDetailsPage"]} page"

      if find(".pageDescription").text == $asset_name
        puts "Successfully created the Asset: #{$asset_name}"
      else
        putstr "Failed to created the Asset: #{$asset_name}"
      end

      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text.include? $asset_name
          puts "Successfully created the Asset: #{$asset_name}"
        else
          putstr "Failed to created the Asset: #{$asset_name}"
        end
      end

    else
      putstr "Failed to create the New Asset"
    end

  rescue Exception => ex
    putstr "Error occurred while creating the Asset: #{$asset_name}"
  end
end


When(/^I select the "([^"]*)" filter$/) do |filter_name|
  begin
    sleep 4
    if page.has_css?("#fcf")
      find('#fcf').select filter_name
      sleep 4
      puts "Successfully selected the opportunity filter: #{filter_name}"
    else
      putstr "Failed to selected the opportunity filter: #{filter_name}"
    end

    if page.has_css?(".fBody")
      within (".fBody") do
        click_button 'Go!'
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the opportunity filter: #{filter_name}"
  end
end


When(/^I fill the service contract required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    $service_contract_name = "#{arg["ServiceContractName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the Service Contract Name field"
      find("#Name").send_keys $service_contract_name
    else
      putstr "Failed to find the Service Contract Name field"
    end

    puts "Successfully fill the service contract required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the service contract required fields"
  end
end


Then(/^I able to see the service contract created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewAccountInformation'

    if page.has_content? arg["ServiceContractDetailPage"]
      puts "Successfully see the #{arg["ServiceContractDetailPage"]} page"

      if find(".pageDescription").text == $service_contract_name
        puts "Successfully created the Service Contract: #{$service_contract_name}"
      else
        putstr "Failed to created the Service Contract: #{$service_contract_name}"
      end

      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text.include? $service_contract_name
          puts "Successfully created the Service Contract: #{$service_contract_name}"
        else
          putstr "Failed to created the Service Contract: #{$service_contract_name}"
        end
      end
    else
      putstr "Failed to create the New Service Contract"
    end
  rescue Exception => ex
    putstr "Error occurred while creating the Service Contract: #{$service_contract_name}"
  end
end


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


When(/^I click on the "([^"]*)" button from "([^"]*)" page$/) do |save, product_edit|
  begin
    sleep 3
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{product_edit} page"
        click_on save
      else
        putstr "Failed to see the #{save} button from #{product_edit} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{product_edit} page"
  end
end


When(/^I search the "([^"]*)" name$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'RenewalLineItemDetails'

    if page.has_css?("#phSearchInput")
      puts "Successfully see the search text box"
      sleep 4
      find("#phSearchInput").send_keys arg["NewOpportunityName"]
      sleep 4
      puts "Successfully fill the Opportunity name: #{arg["NewOpportunityName"]}"

      within("#searchButtonContainer") do
        first("#phSearchButton").click
        puts "Successfully clicked the Search button"
      end
    else
      putstr "Failed to see the search text box"
    end
  rescue Exception => ex
    putstr "Error occurred while searching the #{opportunity} name"
  end
end


Then(/^I able to see the "([^"]*)" search results$/) do |opportunity|
  begin
    sleep 3
    arg = getDetails 'RenewalLineItemDetails'

    unless page.has_content? arg["NoOpportunityResults"]
      if page.has_css?("#secondSearchButton")
        puts "Successfully see the #{opportunity} search button"
        sleep 3
        if page.has_css?("#Opportunity")
          puts "Successfully see the #{opportunity} search results"
          sleep 3
        else
          putstr "Failed to see the #{opportunity} search results"
        end
      else
        putstr "Failed to see the #{opportunity} search button"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end


When(/^I click the "([^"]*)" record$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'RenewalLineItemDetails'

    unless page.has_content? arg["NoOpportunityResults"]
      if page.has_css?("#Opportunity")
        puts "Successfully see the #{opportunity} search results"
        sleep 4

        within(".listRelatedObject.opportunityBlock") do
          within("#Opportunity_body") do
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|
              if row.first("th").first("a").text.include? arg["NewOpportunityName"]
                puts "Successfully see the #{opportunity} record"
                row.first("th").first("a").click
                sleep 5
                puts "Successfully clicked the #{opportunity} record"
                result = true
                break
              end
            end
            putstr "Failed to see the #{opportunity} record" unless result
            sleep 3
          end
        end
      else
        putstr "Failed to see the #{opportunity} search record"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end

