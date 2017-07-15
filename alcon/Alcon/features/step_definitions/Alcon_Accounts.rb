Given(/^I enter value to all the mandatory field$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = "Smoke_test_accounts"+ Random.new.rand(1..20000).to_s
    fill_in "acc2",:with => $account_name
    puts $account_name
    puts "account name is: #{$account_name}"
  end
  if page.has_field?("Account Currency")
      select("USD - U.S. Dollar", :from => "Account Currency")
      puts "value for Account Currency is selected"
  else
      writeFailure "Account Currency field is not available"
  end
  sleep 3
end

Then(/^I check the picklist value of account currency field$/) do
begin
    sleep 5
    arg = getAccountsDetails 'account_details'
    if page.has_select?("acc24")
      puts "account currency field is present and it is a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'acc24')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["account_currency"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
         writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
     writeFailure "account currency picklist field is not present"
    end
  end
end

When(/^I check that "([^"]*)" is visible and editable$/) do |arg1|
  if (ENV['UserRole'] == "salesopssit")
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      puts "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      writeFailure "#{arg1} field is editable"
    else
      puts "#{arg1} field is not editable"
    end
  else
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      puts "#{arg1} field is editable"
    else
      writeFailure "#{arg1} field is not editable"
    end
 end
end

Given(/^I check the picklist value of channel tier field$/) do
 begin
    sleep 5
    arg = getAccountsDetails 'account_details'
    if page.has_select?("00N3600000PFKgj")
      puts "Channel tier picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, '00N3600000PFKgj')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["channel_tier"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "channel tier picklist is not present"
    end
  end
end

Given(/^I check the picklist value of type field$/) do
 begin
    sleep 5
    arg = getAccountsDetails 'account_details'
    if page.has_select?("acc6")
      puts "Type picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'acc6')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
#        expectedvalue = arg["type"].split(',')
         expectedvalue = arg["type"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Type picklist is not present"
    end
  end
end

Then(/^I select picklist value for account currency field$/) do
  if page.has_field?("Account Currency")
      select("USD - U.S. Dollar", :from => "Account Currency")
      puts "value for Account Currency is selected"
  else
      writeFailure "Account Currency field is not available"
  end
end

Then(/^I select picklist value for channel tier field$/) do
  if page.has_field?("Channel Tier")
      select("Channel Tier 1", :from => "Channel Tier")
      puts "value for Channel Tier is selected"
  else
      writeFailure "Channel Tier field is not available"
  end
end

Given(/^I check the picklist value of industry field$/) do
 begin
    sleep 5
    arg = getAccountsDetails 'account_details'
    if page.has_select?("Industry")
      puts "Industry picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'acc7')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["industry"]
 #       expectedvalue = arg["industry"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Industry picklist is not present"
    end
  end
end

Then(/^I select picklist value for industry field$/) do
  if page.has_field?("Industry")
      select("Design", :from => "Industry")
      puts "value for Industry is selected"
  else
      writeFailure "Industry field is not available"
  end
end

Then(/^I select picklist value for type field$/) do
  if page.has_field?("Type")
      select("End User", :from => "Type")
      puts "value for Type is selected"
  else
      writeFailure "Type field is not available"
  end
end
