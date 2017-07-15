

When(/^I click on Survey Response tab$/) do
  sleep 5
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject Custom48Block title']").click
  sleep 10
end

When(/^I should verify "([^"]*)" field permission for "([^"]*)" with cell value "([^"]*)" for survey response entity$/) do |field_name, user_role, cell_value|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  if user_role == "OpsManager"
    field_permission= wrksheet.Range("F#{cell_value}").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?(field_name)
        puts "#{field_name} is visible with read and write permission"
      else
        writeFailure "#{field_name} is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?(field_name)
        puts "#{field_name} is visible with read only permisssion "
      else
        writeFailure "#{field_name} is not visible with read permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
    #  elsif user_role == "OpsRep"
    #    field_permission= wrksheet.Range("E#{cell_value}").Value
    #    puts field_permission
    #    if field_permission == "Editable"
    #      if page.has_field?(field_name)
    #        puts "#{field_name} is visible with read and write permission"
    #      else
    #        writeFailure "#{field_name} is not visible with read and write permission"
    #      end
    #    elsif field_permission == "Read Only"
    #      if page.has_content?(field_name)
    #        puts "#{field_name} is visible with read only permisssion "
    #      else
    #        writeFailure "#{field_name} is not visible with read permission"
    #      end
    #    else
    #      writeFailure "value in the cell does not match"
    #    end
  elsif user_role == "SalesManager"
    field_permission= wrksheet.Range("D#{cell_value}").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?(field_name)
        puts "#{field_name} is visible with read and write permission"
      else
        writeFailure "#{field_name} is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?(field_name)
        puts "#{field_name} is visible with read only permisssion "
      else
        writeFailure "#{field_name} is not visible with read permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesRep"
    field_permission= wrksheet.Range("C#{cell_value}").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?(field_name)
        puts "#{field_name} is visible with read and write permission"
      else
        writeFailure "#{field_name} is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?(field_name)
        puts "#{field_name} is visible with read only permisssion "
      else
        writeFailure "#{field_name} is not visible with read permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  elsif user_role == "SalesOps"
    field_permission= wrksheet.Range("E#{cell_value}").Value
    puts field_permission
    if field_permission == "Editable"
      if page.has_field?(field_name)
        puts "#{field_name} is visible with read and write permission"
      else
        writeFailure "#{field_name} is not visible with read and write permission"
      end
    elsif field_permission == "Read Only"
      if page.has_content?(field_name)
        puts "#{field_name} is visible with read only permisssion "
      else
        writeFailure "#{field_name} is not visible with read permission"
      end
    else
      writeFailure "value in the cell does not match"
    end
  else
    puts "user role does not matched"
  end
  excelsheet.Workbooks.close()
end


When(/^I should verify Account field permission for opsmanager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F2").Value
  puts field_permission
  if page.has_content?("Account")
    puts "Account field is visible with read only permisssion "
  else
    writeFailure "Account field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Date Completed field permission for opsmanager user role/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F3").Value
  puts field_permission
  if page.has_content?("Date Completed")
    puts "Date Completed field is visible with read only permisssion "
  else
    writeFailure "Date Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Time Completed field permission for opsmanager user role/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F4").Value
  puts field_permission
  if page.has_content?("Time Completed")
    puts "Time Completed field is visible with read only permisssion "
  else
    writeFailure "Time Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Link to Survey field permission for opsmanager user role/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F5").Value
  puts field_permission
  if page.has_content?("Link to Survey")
    puts "Link to Survey field is visible with read only permisssion "
  else
    writeFailure "Link to Survey field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Taken By field permission for opsmanager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F6").Value
  puts field_permission
  if page.has_content?("Taken By")
    puts "Taken By field is visible with read only permisssion "
  else
    writeFailure "Taken By field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for opsmanager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("F7").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion "
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Account field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D2").Value
  puts field_permission
  if page.has_content?("Account")
    puts "Account field is visible with read only permisssion "
  else
    writeFailure "Account field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Date Completed field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D3").Value
  puts field_permission
  if page.has_content?("Date Completed")
    puts "Date Completed field is visible with read only permisssion "
  else
    writeFailure "Date Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Time Completed field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D4").Value
  puts field_permission
  if page.has_content?("Time Completed")
    puts "Time Completed field is visible with read only permisssion "
  else
    writeFailure "Time Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Link to Survey field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D5").Value
  puts field_permission
  if page.has_content?("Link to Survey")
    puts "Link to Survey field is visible with read only permisssion "
  else
    writeFailure "Link to Survey field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Taken By field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D6").Value
  puts field_permission
  if page.has_content?("Taken By")
    puts "Taken By field is visible with read only permisssion "
  else
    writeFailure "Taken By field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesManager user role$/) do

  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("D7").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion "
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Account field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C2").Value
  puts field_permission
  if page.has_content?("Account")
    puts "Account field is visible with read only permisssion "
  else
    writeFailure "Account field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Date Completed field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C3").Value
  puts field_permission
  if page.has_content?("Date Completed")
    puts "Date Completed field is visible with read only permisssion "
  else
    writeFailure "Date Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Time Completed field permission for SalesRep user role$/) do 
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C4").Value
  puts field_permission
  if page.has_content?("Time Completed")
    puts "Time Completed field is visible with read only permisssion "
  else
    writeFailure "Time Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Link to Survey field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C5").Value
  puts field_permission
  if page.has_content?("Link to Survey")
    puts "Link to Survey field is visible with read only permisssion "
  else
    writeFailure "Link to Survey field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Taken By field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C6").Value
  puts field_permission
  if page.has_content?("Taken By")
    puts "Taken By field is visible with read only permisssion "
  else
    writeFailure "Taken By field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("C7").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion "
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Account field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E2").Value
  puts field_permission
  if page.has_content?("Account")
    puts "Account field is visible with read only permisssion "
  else
    writeFailure "Account field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Date Completed field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E3").Value
  puts field_permission
  if page.has_content?("Date Completed")
    puts "Date Completed field is visible with read only permisssion "
  else
    writeFailure "Date Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Time Completed field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E4").Value
  puts field_permission
  if page.has_content?("Time Completed")
    puts "Time Completed field is visible with read only permisssion "
  else
    writeFailure "Time Completed field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Link to Survey field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E5").Value
  puts field_permission
  if page.has_content?("Link to Survey")
    puts "Link to Survey field is visible with read only permisssion "
  else
    writeFailure "Link to Survey field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Taken By field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E6").Value
  puts field_permission
  if page.has_content?("Taken By")
    puts "Taken By field is visible with read only permisssion "
  else
    writeFailure "Taken By field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(6)
  wrksheet.Select
  field_permission= wrksheet.Range("E7").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion "
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end
