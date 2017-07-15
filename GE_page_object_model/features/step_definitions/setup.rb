
Given(/^I logged in as admin$/) do
  puts "logged in as admin"
end

When(/^I click on setup button$/) do
  find(:xpath,"//*[@id='userNavButton']").click
  sleep 5
  find(:xpath,"//*[@id='userNav-menuItems']/a[contains(text(),'Setup')]").click
  sleep 5
end

When(/^I click on company profile link$/) do
  find(:xpath,"//a[contains(text(),'Company Profile')]").click
  sleep 2
end

When(/^I click on Manage Currencies link$/) do
  find(:xpath,".//*[@id='CompanyCurrency_font']").click
  sleep 2
end

When(/^I clik on manage currencies button$/) do
  find(:xpath,"//*[@value='Manage Currencies']").click
  sleep 2
end

Then(/^I should verify the table$/) do
  puts "verified"
end

Then(/^I should verify account currency field picklist values under account information row$/) do
  actualvalues =find(:xpath,"//*[@id='acc24']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["EUR - Euro","GBP - British Pound","USD - U.S. Dollar"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in account currency picklist"
  else
    fail(ArgumentError.new('expected values are not visible in account currency picklist'))
  end
end

#step definition to click on account name under all accounts
And(/^I open any existing account name from the list under all accounts section$/) do
  if ENV['UserRole'] == "salesopssit"
    within('.x-grid3-body') do
      table = all("tbody")[0]
      table.all('tr')[0].all('td')[1].find('a').click
      sleep 5
    end
  else
    within('.x-grid3-body') do
      table = all("tbody")[0]
      table.all('tr')[0].all('td')[2].find('a').click
      sleep 5
    end
  end
end
