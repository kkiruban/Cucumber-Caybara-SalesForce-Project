Then(/^I click on new Opportunity button from Opportunity related section$/) do
  sleep 2
  find(:xpath, "//td/input[@name='newOpp']").click
  within('.pbSubsection') do
    select("Opportunity - Edit", :from => "Record Type of new record")
  end
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

Then(/^I click on new quote button under quotes section$/) do
  sleep 2
  click_on "New Quote"
end

Then(/^I enter value to mandatory fields under new quote section$/) do
  sleep 2
 if page.has_field?("Quote Name")
   fill_in("Quote Name", :with=> "Smoke_test_quotes")
 else
   writeFailure "Quote Name field is not available"
 end
 if page.has_field?("00N3600000PFBhz")
   select("Direct", :from => "00N3600000PFBhz")
 else
   writeFailure "Quote Type field is not available"
 end
 if page.has_field?("00N3600000PFBhy")
   select("1", :from => "00N3600000PFBhy")
 else
   writeFailure "Quote Type Year field is not available"
 end
end

Then(/^I click on add line items button under quote line items section$/) do
  sleep 3
  click_on "Add Line Item"
end

Then(/^I select existing product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("smoke")
  sleep 2
  page.find(:id, "save_filter_PricebookEntry").click
  sleep 5
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[0].click
    puts "opportunity is selected"
  end
end

Then(/^I clik on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

Then(/^I note the product name under add quote line items to section$/) do
  within('.genericTable') do
    table=all('tbody')[0]
    $product_name = table.all('tr')[4].all('th')[0].text
    puts "Selected Product Name is: #{$product_name}"
  end
end

Then(/^I check that new line items added is be visible under products related list$/) do
  within all('.pbBody')[1] do
    if find_link($product_name).visible?
      puts "The new line items added is visible under products related list"
    else
      writeFailure "The new line items added is not visible under products related list"
    end
  end
end

Then(/^I enter start date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaQ01u5B000000pO52")
    fill_in("00N3600000PFBaQ01u5B000000pO52", :with=> "11/7/2016")
  else
    writeFailure "Start Date field is not present"
  end
end

Then(/^I enter end date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaM01u5B000000pO52")
    fill_in("00N3600000PFBaM01u5B000000pO52", :with=> "11/7/2017")
  else
    writeFailure "End Date field is not present"
  end
end

Then(/^I enter quantity field value$/) do
  sleep 2
  if page.has_field?("Quantity01u5B000000pO52")
    fill_in("Quantity01u5B000000pO52", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
end

Then(/^I enter sales price field value$/) do
  sleep 2
  if page.has_field?("UnitPrice01u5B000000pO52")
    fill_in("UnitPrice01u5B000000pO52", :with=> "100")
  else
    writeFailure "sales price field is not present"
  end
end

Then(/^I select value from batch type field$/) do
  if page.has_field?("00N3600000PFBi501u5B000000pO52")
    select("Renewal", :from => "00N3600000PFBi501u5B000000pO52")
  else
    writeFailure "batch type field is not available"
  end
end

Then(/^I click on "([^"]*)" button under add quote line items to page$/) do |button_name|
  within('.genericTable') do
    sleep 2
    click_on(button_name, match: :first)
  end
end

Then(/^I click on "([^"]*)" button$/) do |button_name|
  sleep 5
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  within("div#syncQuoteOverlay_buttons") do #within("div#syncQuoteOverlay_buttons") --> id is used inside within
    click_on(button_name)
  end
  page.driver.browser.switch_to.window(main)
end

Then(/^I click on opportunity name link$/) do
  within all('.pbSubsection')[0] do
  sleep 4
  puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
  page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
  sleep 5
  end
end

Then(/^I enter data to all mandatory fields under renewable line item$/) do
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Existing Product Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
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
  sleep 5

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Owner Lookup (New Window)']").click
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
      click_on "Operations Manager Guidance"
      puts "assigned to Operations Manager Guidance"
      sleep 2
    else if (ENV['UserRole'] == "opsrepsit")
        click_on "Operations Rep Guidance"
        puts "assigned to Operations Rep Guidance"
        sleep 2
      else if (ENV['UserRole'] == "salesmgrsit")
          click_on "Sales Manager Guidance"
          puts "assigned to Sales Manager Guidance"
          sleep 2
        else if (ENV['UserRole'] == "salesrepsit")
            click_on "Sales Rep Guidance"
            puts "assigned to Sales Rep Guidance"
            sleep 2
          else if (ENV['UserRole'] == "Admin")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "salesopssit")
                click_on "Sales Ops Guidance"
                puts "assigned to Sales Ops Guidance"
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
  
  within('.pbSubsection') do
    if page.has_field?("Existing Start Date")
        fill_in("Existing Start Date",:with => "10/3/2016")
        puts "value for Existing Start Date field is entered"
      else
        puts "Existing Start Date field is not available"
      end
    if page.has_field?("New Start Date")
        fill_in("New Start Date",:with => "11/3/2016")
        puts "value for New Start Date field is entered"
    else
        puts "New Start Date field is not available"
    end
      if page.has_field?("Quantity")
      fill_in("Quantity",:with => "10")
        puts "value for Quantity field is entered"
    else
        puts "Quantity field is not available"
    end
      if page.has_field?("Existing End Date")
      fill_in("Existing End Date",:with => "11/3/2016")
        puts "value for Existing End Date field is entered"
    else
        puts "Existing End Date field is not available"
    end
      if page.has_field?("New End Date")
      fill_in("New End Date",:with => "11/3/2016")
        puts "value for New End Date field is entered"
    else
        puts "New End Date field is not available"
    end
    if page.has_field?("Previous Price")
      fill_in("Previous Price",:with => "20")
      puts "value for Previous Price field is entered"
    else
      puts "Previous Price field is not available"
    end
  end 
end


Then(/^I click on "([^"]*)" button under renewable line item section$/) do |button_name|
  sleep 3
  within all('.pbHeader')[2] do
    click_on button_name
  end
end

Then(/^I click on renewal opportunity link$/) do
  sleep 3
  puts page.find(:xpath, "//div[@id='CF00N3600000PFKcf_ileinner']/a").text
  page.find(:xpath, "//div[@id='CF00N3600000PFKcf_ileinner']/a").click
  sleep 2
end

Then(/^I click on "([^"]*)" button in renewable line item section$/) do |button_name|
  within('.pbHeader') do
    click_on button_name
  end
end

Then(/^I select any existing product line on the list$/) do
  page.find(:xpath, ".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
end

Then(/^I click on renewal status button$/) do  
  page.find(:xpath, ".//*[@id='updateRRStatus']").click
end

Then(/^I check that existing contract number field is visible$/) do
  within all('.pbSubsection')[0] do
      if page.has_field?("Existing Contract Number")
        puts "Existing Contract Number field is visible"
      else
        writeFailure "Existing Contract Number field is not visible"
      end
  end
end

Then(/^I check that SSI Result Reason field is visible$/) do
  within all('.pbSubsection')[0] do
      if page.has_field?("SSI Result Reason")
        puts "SSI Result Reason field is visible"
      else
        writeFailure "SSI Result Reason field is not visible"
      end
  end
end

Then(/^I check the SSI Result Reason picklist values$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("SSI Result Reason")
      puts "SSI Result Reason field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'SSI Result Reason')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["SSI_Result_Reason"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "SSI Result Reason picklist is not present"
    end
  end
end