Then(/^I click on new Opportunity button from Opportunity related section$/) do
  sleep 2
  find(:xpath, "//td/input[@name='newOpp']").click
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

Then(/^I check that "([^"]*)" field is visble and editable under opportunity details section$/) do |arg1|
  if (ENV['UserRole'] == "salesopssit")
    within all('.pbSubsection')[0] do
      if page.has_content?(arg1)
        puts "#{arg1} field is visible under opportunity details section"
      else
        puts "#{arg1} field is not visible under opportunity details section"
      end
      if page.has_field?(arg1)
        writeFailure "#{arg1} field is editable under opportunity details section"
      else
        puts "#{arg1} field is not editable under opportunity details section"
      end
    end
  else
    within all('.pbSubsection')[0] do
      if page.has_content?(arg1)
        puts "#{arg1} field is visible under opportunity details section"
      else
        writeFailure "#{arg1} field is not visible under opportunity details section"
      end
      if page.has_field?(arg1)
        puts "#{arg1} field is editable under opportunity details section"
      else
        writeFailure "#{arg1} field is not editable under opportunity details section"
      end
    end
  end
end

Then(/^I check that "([^"]*)" is a picklist field$/) do |field_name|
  if page.has_select?(field_name)
    puts "#{field_name} field is a picklist"
  else
    writeFailure "#{field_name} field is not a picklist"
  end
end

Then(/^I check that "([^"]*)" is a text field$/) do |field_name|
  if page.has_field?(field_name)
    puts "#{field_name} field is available"
    if page.has_field?(field_name, :type => 'text')
      puts "#{field_name} is a text field"
    else
      writeFailure "#{field_name} is not a text field"
    end
  else
    writeFailure "#{field_name} field is not available"
  end
end

#Then(/^I check that "([^"]*)" is a date type field$/) do |field_name|
#  if page.has_field?(field_name)
#    puts "#{field_name} field is available"
#    within all('.pbSubsection')[0] do
#      table=all("tbody")[0]
#      if table.all('tr')[8].all('td')[1].has_css?('.dateInput')
#        puts "#{field_name} field type is date"
#      else
#       writeFailure  "#{field_name} field type is not date"
#      end
#    end
#  else
#    writeFailure "#{field_name} field is not available"
#  end
#end


Then(/^I check that CPI Letter Delivery Date is a date type field$/) do 
  if page.has_xpath?(".//span[@class='dateInput']/*[@id='00N3600000JAKmi']")
    puts "CP Email Date field is a date type field"
  else
    writeFailure "CP Email Date field is not date type field"
  end
end

Then(/^I check that CP Email Date is a date type field$/) do
  if page.has_xpath?(".//span[@class='dateInput']/*[@id='00N3600000JAKmh']")
    puts "CP Email Date field is a date type field"
  else
    writeFailure "CP Email Date field is not date type field"
  end
end


Then(/^I check the contract type picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000JAKmu")
      puts "contract type picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000JAKmu')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["contract_type"].split(',')
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
      writeFailure "contract type picklist is not present"
    end
  end
end

Then(/^I check the cpi sales stage picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000JAKmt")
      puts "CPI Sales Stage field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000JAKmt')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["cpi_sales_stage"].split(',')
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
      writeFailure "CPI Sales Stage picklist is not present"
    end
  end
end

Then(/^I check that "([^"]*)" field is visble under location and batch classification section$/) do |field_name|
  if page.has_field?(field_name)
    puts "#{field_name} is visible"
    within all('.pbSubsection')[2] do
      #      puts "checking whether #{field_name} is visble under location and batch classification section"
      if page.has_field?(field_name)
        #      if find_field(field_name, :visible => true)
        puts "#{field_name} is visible under location and batch classification section"
      else
        writeFailure "#{field_name} is not visible under location and batch classification section"
      end
    end
  else
    writeFailure "#{field_name} is not visible"
  end
end

Then(/^I check that Operating Unit field is visble under location and batch classification section$/) do
  if page.has_field?("00N3600000JAKmv")
    puts "Operating Unit field is visible"
    within all('.pbSubsection')[2] do
      #      puts "checking whether Operating Unit field is visble under location and batch classification section"
      if page.has_field?("00N3600000JAKmv")
        #if find_field("00N3600000JAKmv", :visible => true)
        puts "Operating Unit field is visible under location and batch classification section"
      else
        writeFailure "Operating Unit field is not visible under location and batch classification section"
      end
    end
  else
    writeFailure "Operating Unit field is not visible"
  end
end

Then(/^I check that Expired Code field is visble under order information section$/) do
  if page.has_field?("00N3600000JAKmw")
    puts "Expired Code field is visible"
    within all('.pbSubsection')[3] do
      #      puts "checking whether Operating Unit field is visble under location and batch classification section"
      if page.has_field?("00N3600000JAKmw")
        #      if find_field("00N3600000JAKmw", :visible => true)
        puts "Expired Code field is visible under location and batch classification section"
      else
        writeFailure "Expired Code field is not visible under location and batch classification section"
      end
    end
  else
    writeFailure "Expired Code field is not visible"
  end
end



Then(/^I check the direct channel picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N7A000000blqY")
      puts "direct channel field is present and a picklist field"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N7A000000blqY')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["direct_channel"].split(',')
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
      writeFailure "direct channel picklist is not present"
    end
  end
end

Then(/^I check the operating unit values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000JAKmv")
      puts "operating unit field is present and a picklist field"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000JAKmv')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["operating_unit"].split(',')
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
      writeFailure "operating unit picklist is not present"
    end
  end
end

Then(/^I check that "([^"]*)" field is visble under order information section$/) do |field_name|
  if page.has_field?(field_name)
    puts "#{field_name} is visible"
    within all('.pbSubsection')[3] do
      puts "checking whether #{field_name} is visble under order information section"
      if page.has_field?(field_name)
        #      if find_field(field_name).visible?
        puts "#{field_name} is visible under order information section"
      else
        writeFailure "#{field_name} is not visible under order information section"
      end
    end
  else
    writeFailure "#{field_name} is not visible"
  end
end

Then(/^I check that Expired Code fied is picklist field$/) do
  if page.has_select?("00N3600000JAKmw")
    puts "Expired Code field is present and a picklist field"
  else
    #      fail(ArgumentError.new('Cisco Health Status picklist is not present'))
    writeFailure "Expired Code picklist is not present"
  end
end


Then(/^I check the expired code picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000JAKmw")
      puts "Expired Code field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000JAKmw')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["expired_code"].split(',')
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
      writeFailure "Expired Code picklist is not present"
    end
  end
end

Then(/^I enter data to all mandatory fiels under new opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "Smoke_test_opportinity_"+ Random.new.rand(1..20000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "opportunity name is: #{$opp_name}"
    sleep 2
    if page.has_field?("opp11")
      select("Contacted", :from => "opp11")
      puts "value for stage field is selected"
    else
      puts "stage field is not available"
    end
    sleep 2
    if page.has_field?("opp9")
      fill_in("opp9",:with => "5/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end
  if page.has_field?("00N3600000JAKnJ")
    select("Enterprise", :from => "00N3600000JAKnJ")
    puts "value for Opportunity Type field is selected"
  else
    puts "Opportunity Type field is not available"
  end

  if page.has_field?("00N3600000JAKmK")
    select("SREV/FICO", :from => "00N3600000JAKmK")
    puts "value for Engagement Type field is selected"
  else
    puts "Engagement Type field is not available"
  end

  if page.has_field?("00N3600000JAKmv")
    select("FIHK HKD", :from => "00N3600000JAKmv")
    puts "value for Operating Unit field is selected"
  else
    puts "Operating Unit field is not available"
  end

  if page.has_field?("Business Line")
    select("Core", :from => "Business Line")
    puts "value for Business Line field is selected"
  else
    puts "Business Line field is not available"
  end

  if page.has_field?("00N7A000000blqY")
    select("Direct", :from => "00N7A000000blqY")
    puts "value for Dirrect/Channel field is selected"
  else
    puts "Dirrect/Channel field is not available"
  end

  if page.has_field?("00N3600000JAKmC")
    select("USA", :from => "00N3600000JAKmC")
    puts "value for Client Territory field is selected"
  else
    puts "Client Territory field is not available"
  end

  if page.has_field?("00N3600000JAKmA")
    select("USA", :from => "00N3600000JAKmA")
    puts "value for Client Region field is selected"
  else
    puts "Client Region field is not available"
  end

  if page.has_field?("Country")
    select("United States", :from => "Country")
    puts "value for Country field is selected"
  else
    puts "Country field is not available"
  end

  if page.has_field?("00N3600000JAKnU")
    select("NALA", :from => "00N3600000JAKnU")
    puts "value for SSI Theatre field is selected"
  else
    puts "SSI Theatre field is not available"
  end
  #  end

  #  within all('.pbSubsection')[3] do
  if page.has_field?("opp16")
    select("USD - U.S. Dollar", :from => "opp16")
    puts "value for Opportunity Currency field is selected"
  else
    puts "Opportunity Currency field is not available"
  end
  #  end

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke_test_accounts")
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

  sleep 3
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Price Book Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Standard")
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
  if page.has_field?("00N3600000PFKo1")
    select("Direct", :from => "00N3600000PFKo1")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N3600000PFKo0")
    select("1", :from => "00N3600000PFKo0")
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
  if page.has_field?("00N3600000PFKgD01u36000003tesz")#("00N3600000PFKgD01u6C000000PjBx")
    fill_in("00N3600000PFKgD01u36000003tesz", :with=> "11/3/2016")
  else
    writeFailure "Start Date field is not present"
  end
end

Then(/^I enter end date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFKg901u36000003tesz")
    fill_in("00N3600000PFKg901u36000003tesz", :with=> "11/3/2017")
  else
    writeFailure "End Date field is not present"
  end
end

Then(/^I check that Ratable Start Date field is visble under order informationection$/) do
  if page.has_xpath?(".//span[@class='dateInput']/*[@id='00N3600000JAKmj']")
    puts "Ratable Start Date field is a date type field"
  else
    writeFailure "Ratable Start Date field is not date type field"
  end
end

Then(/^I check that Ratable End Date is a date type field$/) do
  if page.has_xpath?(".//span[@class='dateInput']/*[@id='00N3600000JAKmk']")
    puts "Ratable End Date field is a date type field"
  else
    writeFailure "Ratable End Date field is not date type field"
  end
end

Then(/^I check that PO Required is a checkbox$/) do
  if page.has_field?('00N3600000JAKmW', :type => 'checkbox') == true
    puts "PO Required is a checkbox"
  else
    writeFailure "PO Required is not a checkbox"
  end
end

Then(/^I check that Quote Ready is a checkbox$/) do
  if page.has_field?('00N3600000PFKlJ', :type => 'checkbox') == true
    puts "PO Required is a checkbox"
  else
    writeFailure "PO Required is not a checkbox"
  end
end

Then(/^I enter quantity field value$/) do
  sleep 2
  if page.has_field?("Quantity01u36000003tesz")#("Quantity01u6C000000PjBx")
    fill_in("Quantity01u36000003tesz", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
end

Then(/^I enter sales price field value$/) do
  sleep 2
  if page.has_field?("UnitPrice01u36000003tesz")#("UnitPrice01u6C000000PjBx")
    fill_in("UnitPrice01u36000003tesz", :with=> "100")
  else
    writeFailure "sales price field is not present"
  end
end

Then(/^I select value from batch type field$/) do
  if page.has_field?("00N3600000PFKo701u36000003tesz")#("00N3600000PFKo701u6C000000PjBx")
    select("Renewal", :from => "00N3600000PFKo701u36000003tesz")
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

#Then(/^I should see popup "([^"]*)"$/) do |popup_name|
#sleep 5
#main = page.driver.browser.window_handles.first
#popup = page.driver.browser.window_handles.last
#page.driver.browser.switch_to.window(popup)
#  if page.has_content? popup_name
#    puts "#{popup_name} content is present"
#  else
#    writeFailure "#{popup_name} content is not present present"
#  end
#  page.driver.browser.switch_to.window(main)
#end

Then(/^I click on opportunity name link$/) do
  within all('.pbSubsection')[0] do
  sleep 4
  puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
  page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
  sleep 5
  end
end

Then(/^I check the invoicing picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Invoicing")
      puts "Invoicing field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKlg')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["invoicing"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Invoicing picklist is not present"
    end
  end
end

Then(/^I check the quarterly forecast picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Quarterly Forecast")
      puts "Quarterly Forecast field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKli')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["quarterly_forecast"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Quarterly Forecast picklist is not present"
    end
  end
end

Then(/^I check the "([^"]*)" picklist values$/) do |arg1|
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?(arg1)
      puts "Revised/Returned field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKlk')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["revised_returned"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Revised/Returned picklist is not present"
    end
  end
end

Then(/^I check the worked by picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Worked By")
      puts "Worked By field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKlh')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["worked_by"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Worked By picklist is not present"
    end
  end
end

Then(/^I check the Data Exclusion Type picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Data Exclusion Type")
      puts "Data Exclusion Type	 field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKll')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["data_exclusion_type"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Data Exclusion Type	 picklist is not present"
    end
  end
end

Then(/^I check the picklist value of "([^"]*)" field$/) do |arg1|
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?(arg1)
      puts "Direct/Channel field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKl6')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["direct_channel"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Direct/Channel picklist is not present"
    end
  end
end

Then(/^I check that "([^"]*)" field is visble and editable under partner information section$/) do |arg1|
  if (ENV['UserRole'] == "salesopssit")
    within all('.pbSubsection')[1] do
      if page.has_content?(arg1)
        puts "#{arg1} field is visible under partner information section"
      else
        puts "#{arg1} field is not visible under partner information section"
      end
      if page.has_field?(arg1)
        writeFailure "#{arg1} field is editable under partner information section"
      else
        puts "#{arg1} field is not editable under partner information section"
      end
    end
  else
    within all('.pbSubsection')[1] do
      if page.has_content?(arg1)
        puts "#{arg1} field is visible under partner information section"
      else
        writeFailure "#{arg1} field is not visible under partner information section"
      end
      if page.has_field?(arg1)
        puts "#{arg1} field is editable under partner information section"
      else
        writeFailure "#{arg1} field is not editable under partner information section"
      end
    end
  end
end

Then(/^I check the "([^"]*)" picklist field values$/) do |arg1|
 begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?(arg1)
      puts "Partner Account 1 Type field is present and a picklist field"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKaS')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["partner_account_1_type"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Partner Account 1 Type picklist is not present"
    end
  end
end

Then(/^I check the vlaue for "([^"]*)" picklist field$/) do |arg1|
 begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?(arg1)
      puts "Partner Account 2 Type field is present and a picklist field"
      within all('.pbSubsection')[1] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKaV')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["partner_account_2_type"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Partner Account 2 Type picklist is not present"
    end
  end
end

Then(/^I check the Business Line picklist values$/) do
 begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Business Line")
      puts "Business Line field is present and a picklist field"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKaV')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["business_line"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Business Line picklist is not present"
    end
  end
end

Then(/^I check the Client Region picklist values$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Client Region")
      puts "Client Region field is present and a picklist field"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKkw')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["client_region"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Client Region picklist is not present"
    end
  end
end

Then(/^I check the Commit Level picklist values$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Commit Level")
      puts "Commit Level field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKl0')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["commit_level"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Commit Level picklist is not present"
    end
  end
end

Then(/^I check the SSI Theatre picklist values$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("SSI Theatre")
      puts "SSI Theatre field is present and a picklist field"
      within all('.pbSubsection')[2] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKmH')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["ssi_theatre"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "SSI Theatre picklist is not present"
    end
  end
end

Then(/^I check the Quote Type picklist values$/) do
  begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("Quote Type")
      puts "Quote Type field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKo1')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["quote_type"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Quote Type picklist is not present"
    end
  end
end

Then(/^I check the Quote Type Year picklist values$/) do
 begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000PFKo0")
      puts "Quote Type Year field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKo0')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["quote_type_year"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Quote Type Year picklist is not present"
    end
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

Then(/^I select "([^"]*)" option from price book picklist$/) do |arg1|
 sleep 5
 within('.pbSubsection') do
  select(arg1, :from => "p1")
 end
end

Then(/^I check the picklist values for batch type field$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000PFKov")
      puts "batch type field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKov')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["batch_type"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "batch type picklist is not present"
    end
  end
end


Then(/^I check the picklist values for ssi sub result reason field$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("00N3600000PFKpO")
      puts "SSI Sub Result Reason field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKpO')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["ssi_sub_result_reason"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "SSI Sub Result Reason picklist is not present"
    end
  end
end

Then(/^I update value to previous price field$/) do
  if page.has_field?("Previous Price")
    fill_in("Previous Price",:with => "20")
    puts "value for Previous Price field is entered"
  else
    writeFailure "Previous Price field is not available"
  end
end

Then(/^I update value to am project field$/) do
  if page.has_field?("AM Project")
    fill_in("AM Project",:with => "test")
    puts "value for AM Project field is entered"
  else
    writeFailure "AM Project field is not available"
  end
end

Then(/^I select value from ssi sub result reason picklist/) do
  if page.has_select?("SSI Sub Result Reason")
    select("CS - Renewed at Par - R@P", :from => "SSI Sub Result Reason")
    puts "value for SSI Sub Result Reason field is selected"
  else
    writeFailure "SSI Sub Result Reason field is not available"
  end
end

Then(/^I select value from batch type picklist$/) do
  if page.has_select?("Batch Type")
    select("Renewal", :from => "Batch Type")
    puts "value for SSI Sub Result Reason field is selected"
  else
    writeFailure "SSI Sub Result Reason field is not available"
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
#  page.find(:id, "CF00N3600000PFKcf_ileinner").click
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

Then(/^I check that Open is avialble in the dropdown$/) do
  sleep 2
  if page.has_xpath?("//ul[@id='demolist']/li/a[contains(text(),'Open')]")
    puts "Open link is avialble in the dropdown"
  else
    writeFailure "Open link is not avialble in the dropdown"
  end
end

Then(/^I check that Lost is avialble in the dropdown$/) do
  sleep 2
   if page.has_xpath?("//ul[@id='demolist']/li/a[contains(text(),'Lost')]")
    puts "Lost link is avialble in the dropdown"
  else
    writeFailure "Lost link is not avialble in the dropdown"
  end
end

Then(/^I check that Won is avialble in the dropdown$/) do
  sleep 2
  if page.has_xpath?("//ul[@id='demolist']/li/a[contains(text(),'Won')]")
    puts "Won link is avialble in the dropdown"
  else
    writeFailure "Won link is not avialble in the dropdown"
  end
end
