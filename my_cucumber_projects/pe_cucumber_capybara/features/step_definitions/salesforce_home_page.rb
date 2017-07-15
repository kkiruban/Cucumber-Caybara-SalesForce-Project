# To change this template, choose Tools | Templates
# and open the template in the editor.

Given(/^I should land on salesforce application homepage$/) do
  step 'I should visit saleforce website'
  step 'I should see "Welcome to the Salesforce Customer Success Platform."'
  step 'I follow "Login" link'
  step 'I fill "Username" as "qa-renewnetops-csmdev19@servicesource.com"'
  step 'I fill "Password" as "pass@wor"'
  step 'I should click on "Log In" button'
  step 'I should see "QA RenewNetOps at ServiceSource (Partner Main)"'
end

Given(/^I wait for "([^"]*)" seconds$/) do |n|
  sleep(n.to_i)
end

Then(/^I should see the following links:$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  data = table.raw
end