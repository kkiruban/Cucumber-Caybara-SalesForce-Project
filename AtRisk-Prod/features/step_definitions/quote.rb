#  #Then(/^I click on new quote button under quotes section$/) do
#  #  sleep 2
#  #  click_on "New Quote"
#  #end
#
##Then(/^I enter value to mandatory fields under new quote section$/) do
##  sleep 2
##  if page.has_field?("Quote Name")
##    fill_in("Quote Name", :with=> "Smoke_test_quotes")
##  else
##    writeFailure "Quote Name field is not available"
##  end
##  if page.has_field?("Quote Type")
##    select("Direct", :from => "Quote Type")
##  else
##    writeFailure "Quote Type field is not available"
##  end
##  if page.has_field?("Quote Type Year")
##    select("1", :from => "Quote Type Year")
##  else
##    writeFailure "Quote Type Year field is not available"
##  end
##end
#
#Then(/^I select existing product name$/) do
#  sleep 2
#  page.find(:xpath, ".//*[@id='search']").set("smoke")
#  sleep 2
#  page.find(:id, "save_filter_PricebookEntry").click
#  sleep 5
#  within('.x-grid3-body') do
#    table=all("tbody")[0]
#    table.all('tr')[0].all('td')[0].click
#    puts "opportunity is selected"
#  end
#end
#
#Then(/^I click on add line items button under quote line items section$/) do
#  sleep 3
#  click_on "Add Line Item"
#end
#
#Then(/^I clik on select button$/) do
#  within('.selectButtons') do
#    click_button("Select")
#  end
#end
#
#Then(/^I note the product name under add quote line items to section$/) do
#  within('.genericTable') do
#    table=all('tbody')[0]
#    $product_name = table.all('tr')[4].all('th')[0].text
#    puts "Selected Product Name is: #{$product_name}"
#  end
#end
#
#Then(/^I check that new line items added is be visible under products related list$/) do
#  within all('.pbBody')[1] do
#    if find_link($product_name).visible?
#      puts "The new line items added is visible under products related list"
#    else
#      writeFailure "The new line items added is not visible under products related list"
#    end
#  end
#end
#
#Then(/^I enter start date field value$/) do
#  sleep 2
#  if page.has_field?("00N3600000PFBaQ01u5B000000pO52")
#    fill_in("00N3600000PFBaQ01u5B000000pO52", :with=> "11/7/2016")
#  else
#    writeFailure "Start Date field is not present"
#  end
#end
#
#Then(/^I enter end date field value$/) do
#  sleep 2
#  if page.has_field?("00N3600000PFBaM01u5B000000pO52")
#    fill_in("00N3600000PFBaM01u5B000000pO52", :with=> "11/7/2017")
#  else
#    writeFailure "End Date field is not present"
#  end
#end
#
#Then(/^I enter quantity field value$/) do
#  sleep 2
#  if page.has_field?("Quantity01u5B000000pO52")
#    fill_in("Quantity01u5B000000pO52", :with=> "10")
#  else
#    writeFailure "Quantity field is not present"
#  end
#end
#
#Then(/^I enter sales price field value$/) do
#  sleep 2
#  if page.has_field?("UnitPrice01u5B000000pO52")
#    fill_in("UnitPrice01u5B000000pO52", :with=> "100")
#  else
#    writeFailure "sales price field is not present"
#  end
#end
#
#Then(/^I select value from batch type field$/) do
#  if page.has_field?("00N3600000PFBi501u5B000000pO52")
#    select("Renewal", :from => "00N3600000PFBi501u5B000000pO52")
#  else
#    writeFailure "batch type field is not available"
#  end
#end