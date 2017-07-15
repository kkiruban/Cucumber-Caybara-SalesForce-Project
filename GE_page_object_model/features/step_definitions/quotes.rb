

Then(/^I should see "([^"]*)" text field is visible and editable under finance and coverage details row$/) do |label_name|
  within all('.pbSubsection')[1] do
    if page.has_field?(label_name)
      puts "#{label_name} field is visible and editable under order information row"
    else
      fail(ArgumentError.new( label_name + ' field is not visible and editable under order information row'))
    end
  end
end

Then(/^I should see discount reason picklist values under finance and coverage details row$/) do
  actualvalues =find(:xpath,"//*[@id='00NR0000001OIO4']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--", "Cust Request - Budget","Cust Request - Competition Driven","Multi Year"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in discount reason picklist"
  else
    fail(ArgumentError.new('expected values are not visible in discount reason picklist'))
  end
end

Then(/^I should see currency picklist values under Finance and Coverage Details$/) do
  actualvalues =find(:xpath,"//*[@id='CurrencyIsoCode']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["EUR - Euro","GBP - British Pound","USD - U.S. Dollar"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in currency picklist"
  else
    fail(ArgumentError.new('expected values are not visible in currency picklist'))
  end
end

