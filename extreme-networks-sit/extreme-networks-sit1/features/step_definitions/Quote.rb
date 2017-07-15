Then(/^I enter data in all the mandatory field over quote detail page to create new quote$/) do
  $quote_name = "Smoke_test_quote_MC_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Quote Name"]/parent::td[1]/following-sibling::td[1]//input').set $quote_name
    puts "Entered -- #{$quote_name} -- in Quote Name field"
  else
    writeFailure "Fail to enter data in - Quote Name - field "
  end
  step 'I select "Direct" from "Quote Type" dropdown'
  step 'I select "1" from "Quote Type Year" dropdown'
  #step 'I select "CAD" from "Local Currency Code" dropdown'
end
