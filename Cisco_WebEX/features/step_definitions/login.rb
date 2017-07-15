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
#  fill_in "Username",:with => 'ciscoadopt.opsmgr@servicesource.com.sitadopt'
#  fill_in "Password",:with => 'testciscoadopt123!'
  fill_in "Username",:with => 'smukerji@servicesource.com.ciscowebex'
  fill_in "Password",:with => 'Saswata08'
  find(:id,"Login").click
  sleep 10
  if page.has_xpath?('//input[@title="Search..."]')
    puts "Logged in successfully"
  else
    fail(ArgumentError.new('Fail to login'))
  end
end

#Step definition login as BA
When(/^I login as Operation Manager$/) do
  visit env
  arg=getCredentialInfo
#  fill_in "Username",:with => 'ciscowebex.opsmgr@servicesource.com.sitwebex'
#  fill_in "Password",:with => 'testciscowebex123!'
  fill_in "Username",:with => 'ciscowebex.opsmgr@servicesource.com.ciscowebex'
  fill_in "Password",:with => 'testciscowebex123!'
  find(:id,"Login").click
  sleep 10
  if page.has_xpath?('//input[@title="Search..."]')
    puts "Logged in successfully"
  else
    fail(ArgumentError.new('Fail to login'))
  end
end
