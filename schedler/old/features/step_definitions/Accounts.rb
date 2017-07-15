
And(/^I verify the "([^"]*)" pickList$/) do |type|
  begin
   sleep 2
   if page.has_content?(type)
     puts "Successfully see the #{type} name"
     if page.has_xpath?("//select[@id='acc6']")
       puts "Successfully see the #{type} pickList"
     else
       putstr "Failed to see the #{type} pickList"
     end
   else
     putstr "Failed to see the #{type} name"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} pickList"
  end
end

Then(/^I should verify Sales center field with default value$/) do
  if page.has_select?("00N3600000PW6iw", :selected => "Liverpool")
    puts "Sales center field with default value ods"
  else
    writeFailure "Sales center field is not visible with default value"
  end
end

When(/^I fill random account name$/) do
  randomvalue=('0001'..'9999').to_a.sample
    accountname= "smoke-test-account-#{randomvalue}"
    fill_in("Account Name", :with => accountname)
    sleep 5
end



And(/^I able to see the "([^"]*)" pickList values$/) do |type|
  begin
    sleep 2
    arg = getDetails 'AccountTypePickListValues'

    if page.has_xpath?("//select[@id='acc6']")

      puts "Successfully see the #{type} pickList"

      $type = []

      all(:xpath,"//select[@id='acc6']/option").each do |options|

        $type << options.text
      end

      if $type.include?arg["TypePartner"]
        puts "Successfully see the #{type} #{arg["TypePartner"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypePartner"]} pickList value"
      end

      if $type.include?arg["TypeProximity"]
        puts "Successfully see the #{type} #{arg["TypeProximity"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypeProximity"]} pickList value"
      end

      if $type.include?arg["TypeDosti"]
        puts "Successfully see the #{type} #{arg["TypeDosti"]} pickList value"
      else
        putstr "Failed to see the #{type} #{arg["TypeDosti"]} pickList value"
      end

    else
      putstr "Failed to see the #{type} pickList"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} pickList values"
  end
end


And(/^I verify new account field$/) do
  begin
  sleep 3
  arg = getDetails 'NewAccountInformation'

  if page.has_content?arg["AccountName"]
    puts "Successfully see the #{arg["AccountName"]} field"
  else
    putstr "Failed to see the #{arg["AccountName"]} field"
  end

  if page.has_content?arg["ParentAccount"]
    puts "Successfully see the #{arg["ParentAccount"]} field"
  else
    putstr "Failed to see the #{arg["ParentAccount"]} field"
  end

  if page.has_content?arg["AccountCurrency"]
    puts "Successfully see the #{arg["AccountCurrency"]} field"
  else
    putstr "Failed to see the #{arg["AccountCurrency"]} field"
  end

  if page.has_content?arg["AccountOwner"]
  puts "Successfully see the #{arg["AccountOwner"]} field"
  else
    putstr "Failed to see the #{arg["AccountOwner"]} field"
  end

  if page.has_content?arg["AccountType"]
    puts "Successfully see the #{arg["AccountType"]} field"
  else
    putstr "Failed to see the #{arg["AccountType"]} field"
  end

  rescue Exception => ex
    putstr "Error occurred while verifying the account fields"
  end
end


And(/^I verify "([^"]*)" field should be visible$/) do |zip_code|
  begin
    sleep 2
    $account_zip_code = false
    if page.has_content?(zip_code)
      puts "Successfully see the #{zip_code} field"
      if page.has_xpath?("//div[3]/table/tbody/tr[9]/td[2]/input")
        puts "Successfully see the #{zip_code} text box field is visible"
        $account_zip_code = true
      else
        putstr "Failed to see the #{zip_code} text box field is not visible"
      end
    else
      putstr "Failed to see the #{zip_code} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{zip_code} field is visible"
  end
end


And(/^I verify "([^"]*)" text field with valid edit permissions$/) do |field|
  begin
    sleep 3
    if (ENV['UserRole'] == "SchneiderOperationManagerSit") || (ENV['UserRole'] == "SchneiderOperationRepSit") || (ENV['UserRole'] == "SchneiderAdmin") || (ENV['UserRole'] == "SchneiderSalesManagerSit") || (ENV['UserRole'] == "SchneiderSalesRepSit")
      within all(".detailList")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        tr.each do |row|
          if row.all("td")[0].text == field
            if $account_zip_code == true
              if row.all("td")[1].first("input")[:type] == "text"
                puts "#{field} text field is editable"
                break
              else
                putstr "#{field} text field is not editable"
              end
            else
              putstr "#{field} text field is not visible"
            end
          end
        end
      end
    else
      if (ENV['UserRole'] == "SchneiderSalesOperationSit")
        within all(".detailList")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          tr.each do |row|
            if row.all("td")[0].text == field
              if $account_zip_code == true
                if row.all("td")[1].first("input")[:type] == "text"
                  puts "#{field} text field is editable"
                  break
                else
                  putstr "#{field} text field is not editable"
                end
              else
                putstr "#{field} text field is not visible"
             end
            end
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} text field is editable"
  end
end
