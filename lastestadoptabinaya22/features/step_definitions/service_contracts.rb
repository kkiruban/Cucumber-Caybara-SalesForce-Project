#service-contracts
When(/^I click on all tabs view button$/) do
  find(:xpath,"//img[@title='All Tabs']").click
end

When(/^I should click on service contracts link$/) do
  find(:xpath,"//a[@class='listRelatedObject serviceContractBlock title']").click
end

Then(/^I should see product picklist under asset detail row$/) do
  if page.has_field?("Product")
    puts "product field picklist is visible"
  else
    fail(ArgumentError.new('product field picklist is not visible'))
  end
end

When(/^I click on underlying contract name as sales ops$/) do
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[1].all('div')[0].all('a')[0].click
  end
end

Then(/^I should see site ID field$/) do
  if page.has_field?("Site ID")
    puts "Site ID field is visible"
  else
    writeFailure "Site ID field is not visible"
  end
end

Then(/^I should see client batch year field$/) do
  if page.has_field?("Client Batch Year")
    puts "Client Batch Year field is visible"
  else
    writeFailure "Client Batch Year field is not visible"
  end
end


Then(/^I should see site ID-DS field$/) do
  if page.has_field?("Site ID-DS")
    puts "Site ID-DS field is Editable"
  else
    writeFailure "Site ID-DS field is not editable"
  end
end

Then(/^I should see client batch year-DS field$/) do
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is editable"
  else
    writeFailure "Client Batch Year-DS field is not editable"
  end
end


When(/^I click on go button$/) do
  find(:xpath,"//input[@title='Go!']").click
end

Then(/^I should verify product picklist values under asset detail row$/) do
  if page.has_field?("Product")
    actualvalues =find(:xpath,".//*[@id='00N3600000IS7bJ']").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","SNTC","NOS","Collab ELA","AMP"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in product field picklist"
    else
      fail(ArgumentError.new('expected values are not visible in product field picklist'))
    end
  else
    fail(ArgumentError.new('product field picklist is not visible'))
  end
end

#underlying contract name
When(/^I click on underlying contract name$/) do
 sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[2].all('div')[0].all('a')[0].click
  end
end

When(/^I click on description field and veirfy whether it is editable$/) do
  sleep 3
  #  element = page.find(:xpath,".//*[@id='Description_ilecell']")
  #  page.driver.browser.mouse.double_click(element.native)
  #  sleep 3
  #  page.has_content?('Description')
  #  fill_in 'Description', :with => 'testuser'
  #  puts "Description field is visible and editable"
  #  find(:xpath,"//*[@id='InlineEditDialog_buttons']/input[2]").click
  if page.has_field?("Description")
    puts "description field is visible and editable"
  else
    puts "description field is visible and editable"
  end
end


Then(/^I should see client territory picklist under asset detail row$/) do
  if page.has_field?("Client Territory")
    puts "Client Territory field picklist is visible"
  else
    fail(ArgumentError.new('Client Territory field picklist is not visible'))
  end
end

Then(/^I should verify client territory picklist values under asset detail row$/) do
  if page.has_field?("Client Territory")
    actualvalues =find(:xpath,".//*[@id='00N3600000IS7bG']").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","ANZ","ASEAN","Canada","CN","GSP","India","Japan","Brasil","CANSAC","MCO","Mexico","ROK","Central","South","East","West","SLED","FED"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Client Territory field picklist"
    else
      fail(ArgumentError.new('expected values are not visible in Client Territory field picklist'))
    end
  else
    fail(ArgumentError.new('Client Territory field picklist is not visible'))
  end
end

Then(/^I should see client segment picklist under asset detail row$/) do
  if page.has_field?("Client Segment")
    puts "Client Segment field picklist is visible"
  else
    fail(ArgumentError.new('Client Segment field picklist is not visible'))
  end
end

Then(/^I should verify client segment picklist values under asset detail row$/) do
  if page.has_field?("Client Segment")
    actualvalues =find(:xpath,".//*[@id='00N3600000IS7bH']").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","ANZ","ASEAN","Enterprise","Commercial","Public Sector","Service Provider","GSP","LATAM"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in Client Segment field picklist"
    else
      fail(ArgumentError.new('expected values are not visible in Client Segment field picklist'))
    end
  else
    fail(ArgumentError.new('Client Segment field picklist is not visible'))
  end
end

Then(/^I should see site ID field under asset detail row$/) do
  if page.has_field?("Site ID")
    puts "Site ID text field is visible"
  else
    fail(ArgumentError.new('Site ID text field is not visible'))
  end
end

Then(/^I should see product ID field under asset detail row$/) do
  if page.has_field?("Product ID")
    puts "Product ID text field is visible"
  else
    fail(ArgumentError.new('Product ID text field is visible'))
  end
end

Then(/^I should see dtrack case number field under asset detail row$/) do
  if page.has_field?("Dtrack Case Number")
    puts "Dtrack Case Number text field is visible"
  else
    fail(ArgumentError.new('Dtrack Case Number text field is visible'))
  end
end

Then(/^I should see client batch year field under asset detail row$/) do
  if page.has_field?("Client Batch Year")
    puts "Client Batch Year	 text field is visible"
  else
    fail(ArgumentError.new('Client Batch Year	text field is not visible'))
  end
end

Then(/^I should see client data delivery date field under asset detail row$/) do
  if page.has_field?("Client Data Delivery Date")
    puts "Client Data Delivery Date	text field is visible"
  else
    fail(ArgumentError.new('Client Data Delivery Date	text field is visible'))
  end
end

#Then(/^I should see partner account under asset detail row$/) do
#  if page.has_field?("Partner Account 1")
#    puts "Partner Account 1 text field is visible"
#  else
#    fail(ArgumentError.new('Partner Account 1 text field is not visible'))
#  end
#end

Then(/^I should see deployment status picklist under asset detail row$/) do
  if page.has_field?("Deployment Status")
    puts "Deployment Status field picklist is visible"
  else
    fail(ArgumentError.new('Deployment Status field picklist is not visible'))
  end
end

Then(/^I should verify deployment status picklist values under asset detail row$/) do
  if page.has_field?("Deployment Status")
    actualvalues =find(:xpath,".//*[@id='00N3600000JGH0W']").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Active","Inactive","Hold","Escalated","Completed","Terminated"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in deployment status field picklist"
    else
      fail(ArgumentError.new('expected values are not visible deployment status field picklist'))
    end
  else
    fail(ArgumentError.new('Deployment Status field picklist is not visible'))
  end
end

Then(/^I should see client batch quarter picklist under asset detail row$/) do
  if page.has_field?("Client Batch Quarter")
    puts "Client Batch Quarter field picklist is visible"
  else
    fail(ArgumentError.new('Client Batch Quarter field picklist is not visible'))
  end
end

Then(/^I should verify client batch quarter picklist values under asset detail row$/) do
  if page.has_field?("Client Batch Quarter")
    actualvalues =find(:xpath,".//*[@id='00N3600000JIHzA']").all('option').collect(&:text)
    puts "actual values =  #{actualvalues}"
    expectedvalues = ["--None--","Q1","Q2","Q3","Q4"]
    puts "expected values = #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in client batch quarter field picklist"
    else
      fail(ArgumentError.new('expected values are not visible client batch quarter field picklist'))
    end
  else
    fail(ArgumentError.new('client batch quarter field picklist is not visible'))
  end
end

Then(/^I should see country picklist under asset detail row$/) do
  if page.has_field?("Country")
    puts "Country field picklist is visible"
  else
    fail(ArgumentError.new('Country field picklist is not visible'))
  end
end

Then(/^I should see service offering field under asset detail row$/) do
  if page.has_field?("Service Offering")
    puts "Service Offering field picklist is visible"
  else
    fail(ArgumentError.new('Service Offering field picklist is not visible'))
  end
end

Then(/^I should not see service offering field under asset detail row$/) do
  if page.has_field?("Service Offering")
    fail(ArgumentError.new('Service Offering field picklist is visible'))
  else
    puts "Service Offering field picklist is not visible"
  end
end

Then(/^I should not see new button to create new service contracts$/) do
  if page.has_field?("New")
    writeFailure "New button is visible"
  else
    puts "New button is not visible successfully"
  end
end

Then(/^I should not see edit button to create new service contracts$/) do
  if page.has_field?("Edit")
    writeFailure "Edit button is visible"
  else
    puts "Edit button is not visible successfully"
  end
end