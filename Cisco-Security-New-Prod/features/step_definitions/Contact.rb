Given(/^I enter value to all the mandatory field over contact edit page$/) do
    $lastName = "Smoke_test_LastName_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set $lastName
    puts "New account record - #{$lastName} is created"
  else
    writeFailure "Fail to enter data in - Last Name - field "
  end
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
    puts "Enter data in Account Name"
  else
    writeFailure "Fail to enter data in - Account Name - field "
  end
end