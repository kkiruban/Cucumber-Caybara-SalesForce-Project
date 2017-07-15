#Step definition to enter the credentials in Emea login page
When(/^I enter the credentials to the Zenith application$/) do
  visit env
  sleep 10
  arg =getCredentialInfo
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  sleep 4
  if page.has_xpath?('//a[text()="Remind Me Later"]')
     find(:xpath, '//a[text()="Remind Me Later"]').click
  end
  puts "Logged in successfully"
  sleep 5
end

#Step definition login as BA
When(/^I login as BA$/) do
  visit env
  arg=getCredentialInfo
  fill_in "Username",:with => 'dsintegration-admin@servicesource.com.sitadopt'
  fill_in "Password",:with => 'srevds123!'
  find(:id,"Login").click
  sleep 4
  if page.has_xpath?('//a[text()="Remind Me Later"]')
     find(:xpath, '//a[text()="Remind Me Later"]').click
  end
  sleep 5
  if page.has_xpath?('//input[@title="Search..."]')
    #puts "Logged in successfully"
    next
  else
    fail(ArgumentError.new('Fail to login'))
  end
end

#Step definition login as BA
When(/^I login as Operation Manager$/) do
  visit env
  arg=getCredentialInfo
  fill_in "Username",:with => 'ciscoadopt.opsmgr@servicesource.com.sitadopt'
  fill_in "Password",:with => 'testciscoadopt123!'
  find(:id,"Login").click
  sleep 4
  if page.has_xpath?('//a[text()="Remind Me Later"]')
     find(:xpath, '//a[text()="Remind Me Later"]').click
  end
  sleep 5
  if page.has_xpath?('//input[@title="Search..."]')
    #puts "Logged in successfully"
    next
  else
    fail(ArgumentError.new('Fail to login'))
  end
end

Then(/^I should see the following:$/) do |text|
 page.should have_content(text)
end
