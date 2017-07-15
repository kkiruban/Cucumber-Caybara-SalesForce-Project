require 'win32ole'


Then(/^I should verify subcaste type field permission for "([^"]*)"$/) do |user_role|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  if user_role == "OpsManager"
    field_permission= wrksheet.Range("E3").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Sub Case Type")
        puts "sub caste type picklist is visible with read and write permission"
      else
        writeFailure "sub caste type picklist is not visible"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Sub Case Type')
        puts "sub caste type picklist is visible with read only permisssion "
      else
        writeFailure "sub caste type picklist is not visible"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "OpsRep"
    field_permission= wrksheet.Range("D3").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Sub Case Type")
        puts "sub caste type picklist is visible with read and write permission"
      else
        writeFailure "sub caste type picklist is not visible"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Sub Case Type')
        puts "sub caste type picklist is visible with read only permisssion "
      else
        writeFailure "sub caste type picklist is not visible"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesManager"
    field_permission= wrksheet.Range("C3").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Sub Case Type")
        puts "sub caste type picklist is visible with read and write permission"
      else
        writeFailure "sub caste type picklist is not visible"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Sub Case Type')
        puts "sub caste type picklist is visible with read only permisssion "
      else
        writeFailure "sub caste type picklist is not visible"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesRep"
    field_permission= wrksheet.Range("B3").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Sub Case Type")
        puts "sub caste type picklist is visible with read and write permission"
      else
        writeFailure "sub caste type picklist is not visible"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Sub Case Type')
        puts "sub caste type picklist is visible with read only permisssion "
      else
        writeFailure "sub caste type picklist is not visible"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesOps"
    field_permission= wrksheet.Range("F3").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Sub Case Type")
        puts "sub caste type picklist is visible with read and write permission"
      else
        writeFailure "sub caste type field is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?("Sub Case Type")
        puts "sub caste type picklist is visible with read only permisssion "
      else
        writeFailure "sub caste type picklist is not visible"
      end
    else
      writeFailure "value in the cell does not match"
    end
  else
    puts "user role does not matched"
  end
  excelsheet.Workbooks.close()
end


When(/^I click on cases tab in salesforce home page$/) do
  sleep 5
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,".//a[@class='listRelatedObject caseBlock title']").click
  sleep 10
end


Given(/^I should login as a "([^"]*)"$/) do |user_role|
  visit env
  sleep 10
  if user_role == "OpsManager"
    fill_in "Username",:with => "ciscoadopt.opsmgr@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "OpsRep"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesManager"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesRep"
    fill_in "Username",:with => "ciscoadopt.opsrep@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  elsif user_role == "SalesOps"
    fill_in "Username",:with => "ciscoadopt.salesops@servicesource.com.sitadopt"
    fill_in "Password",:with => "testciscoadopt123!"
    find(:id,"Login").click
    puts "Logged in successfully"
    sleep 3
  else
    puts "user role does not matched"
  end
end

Then(/^I should verify subcaste type field "([^"]*)" for "([^"]*)"$/) do |field_permission,user_role|
  if field_permission == "Editable"
    if page.has_select?("00N3600000D0q5n", :selected => "--None--")
      puts "sub caste type picklist is visible with read and write permission for #{user_role}"
    else
      writeFailure "sub caste type picklist is not visible for #{user_role}"
    end
  elsif field_permission == "Read Only"
    if page.has_content?('Sub Case Type')
      puts "sub caste type picklist is visible with read only permisssion for #{user_role} "
    else
      writeFailure "sub caste type picklist is not visible for #{user_role}"
    end
  else
    writeFailure "value in the cell does not match"
  end
end

Then(/^I should verify case record type field permission for "([^"]*)"$/) do |user_role|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  if user_role == "OpsManager"
    field_permission= wrksheet.Range("E4").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Case Record Type")
        puts "Case Record Type field is visible with read and write permission"
      else
        writeFailure "Case Record Type field is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?("Case Record Type")
        puts "Case Record Type field is visible with read only permisssion "
      else
        writeFailure "Case Record Type field is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "OpsRep"
    field_permission= wrksheet.Range("D4").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Case Record Type")
        puts "Case Record Type field is visible with read and write permission"
      else
        writeFailure "Case Record Type field is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Case Record Type')
        puts "Case Record Type field is visible with read only permisssion"
      else
        writeFailure "Case Record Type field is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesManager"
    field_permission= wrksheet.Range("C4").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Case Record Type")
        puts "Case Record Type field is visible with read and write permission"
      else
        writeFailure "Case Record Type field is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Case Record Type')
        puts "Case Record Type field is visible with read only permisssion "
      else
        writeFailure "Case Record Type field is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesRep"
    field_permission= wrksheet.Range("B4").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Case Record Type")
        puts "Case Record Type field is visible with read and write permission"
      else
        writeFailure "Case Record Type field is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Case Record Type')
        puts "Case Record Type field is visible with read only permisssion "
      else
        writeFailure "Case Record Type field is not having read only permission"
      end
    elsif user_role == "SalesOps"
      field_permission= wrksheet.Range("F4").Value
      puts field_permission
      if field_permission == "Editable"
        if page.has_field?("Case Record Type")
          puts "Case Record Type is visible with read and write permission"
        else
          writeFailure "Case Record Type is not visible with read and write permission"
        end
      elsif field_permission == "Read Only"
        if page.has_content?("Case Record Type")
          puts "Case Record Type is visible with read only permisssion "
        else
          writeFailure "Case Record Type is not visible with read permission"
        end
      else
        writeFailure "value in the cell does not match"
      end
    else
      writeFailure "value in the cell does not match"
    end
  end
  excelsheet.Workbooks.close()
end


Then(/^I should verify product field permission for "([^"]*)"$/) do |user_role|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  if user_role == "OpsManager"
    field_permission= wrksheet.Range("E5").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Product")
        puts "product picklist is visible with read and write permission"
      else
        writeFailure "product picklist is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Product')
        puts "Product	picklist is visible with read only permisssion "
      else
        writeFailure "product picklist is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "OpsRep"
    field_permission= wrksheet.Range("D5").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Product")
        puts "product picklist is visible with read and write permission"
      else
        writeFailure "product picklist is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Product')
        puts "Product	picklist is visible with read only permisssion "
      else
        writeFailure "product picklist is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesManager"
    field_permission= wrksheet.Range("C5").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Product")
        puts "product picklist is visible with read and write permission"
      else
        writeFailure "product picklist is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Product')
        puts "Product	picklist is visible with read only permisssion "
      else
        writeFailure "product picklist is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesRep"
    field_permission= wrksheet.Range("B5").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Product")
        puts "product picklist is visible with read and write permission"
      else
        writeFailure "product picklist is not having editable permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?('Product')
        puts "Product	picklist is visible with read only permisssion "
      else
        writeFailure "product picklist is not having read only permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesOps"
    field_permission= wrksheet.Range("F5").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?("Product")
        puts "Product	picklist is visible with read and write permission"
      else
        writeFailure "Product	picklist is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?("Product")
        puts "Product	picklist is visible with read only permisssion "
      else
        writeFailure "Product	picklist is not visible with read permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  else
    puts "user role does not matched"
  end
  excelsheet.Workbooks.close()
end


When(/^I should verify Sub Case Type field permission for OpsManager for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("E3").Value
  puts field_permission
  if page.has_field?("Sub Case Type")
    puts "Sub Case Type field is visible with read and write permission"
  else
    writeFailure "Sub Case Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Case Record Type field permission for OpsManager for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("E4").Value
  puts field_permission
  if page.has_content?("Case Record Type")
    puts "Case Record Type field is visible with read only permisssion"
  else
    writeFailure "Case Record Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for OpsManager for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("E5").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Sub Case Type field permission for OpsRep for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("D3").Value
  puts field_permission
  if page.has_field?("Sub Case Type")
    puts "Sub Case Type field is visible with read and write permission"
  else
    writeFailure "Sub Case Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Case Record Type field permission for OpsRep for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("D4").Value
  puts field_permission
  if page.has_content?("Case Record Type")
    puts "Case Record Type field is visible with read only permisssion"
  else
    writeFailure "Case Record Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for OpsRep for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("D5").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Sub Case Type field permission for SalesManager for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("C3").Value
  puts field_permission
  if page.has_field?("Sub Case Type")
    puts "Sub Case Type field is visible with read and write permission"
  else
    writeFailure "Sub Case Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Case Record Type field permission for SalesManager for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("C4").Value
  puts field_permission
  if page.has_content?("Case Record Type")
    puts "Case Record Type field is visible with read only permisssion"
  else
    writeFailure "Case Record Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesManager for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("C5").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Sub Case Type field permission for SalesRep for case entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("B3").Value
  puts field_permission
  if page.has_field?("Sub Case Type")
    puts "Sub Case Type field is visible with read and write permission"
  else
    writeFailure "Sub Case Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Case Record Type field permission for SalesRep for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("B4").Value
  puts field_permission
  if page.has_content?("Case Record Type")
    puts "Case Record Type field is visible with read only permisssion"
  else
    writeFailure "Case Record Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesRep for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("B5").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Sub Case Type field permission for SalesOps for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("F3").Value
  puts field_permission
  if page.has_field?("Sub Case Type")
    puts "Sub Case Type field is visible with read and write permission"
  else
    writeFailure "Sub Case Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Case Record Type field permission for SalesOps for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("F4").Value
  puts field_permission
  if page.has_content?("Case Record Type")
    puts "Case Record Type field is visible with read only permisssion"
  else
    writeFailure "Case Record Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesOps for case entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(1)
  wrksheet.Select
  field_permission= wrksheet.Range("F5").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion"
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end