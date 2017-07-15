#Step definition to enter the credentials in Emea login page
When(/^I enter the credentials to the Zenith application$/) do
  visit env
  sleep 10
  arg =getCredentialInfo
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  puts "Logged in successfully"
  sleep 3
end

#Step definition login as BA
When(/^I login as BA$/) do
  visit env
  arg=getCredentialInfo
  fill_in "Username",:with => 'ciscoadopt.opsmgr@servicesource.com.sitadopt'
  fill_in "Password",:with => 'testciscoadopt123!'
  find(:id,"Login").click
  sleep 10
  if page.has_xpath?('//input[@title="Search..."]')
    puts "Logged in successfully"
  else
    fail(ArgumentError.new('Fail to login'))
  end
end

Then(/^I should see the following:$/) do |text|
 page.should have_content(text)
end
