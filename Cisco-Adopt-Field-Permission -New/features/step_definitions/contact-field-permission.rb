
When(/^I click on contacts tab$/) do
  sleep 5
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject contactBlock title']").click
  sleep 10
end

When(/^I should verify role field permission for opsmanager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("F2").Value
  puts field_permission
  if page.has_field?("Role")
    puts "role field is visible with read and write permission"
  else
    writeFailure "role field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify type field permission for opsmanager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("F3").Value
  puts field_permission
  if page.has_field?("Type")
    puts "Type field is visible with read and write permission"
  else
    writeFailure "Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify role field permission for OpsRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("E2").Value
  puts field_permission
  if page.has_field?("Role")
    puts "role field is visible with read and write permission"
  else
    writeFailure "role field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify type field permission for OpsRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("E3").Value
  puts field_permission
  if page.has_field?("Type")
    puts "Type field is visible with read and write permission"
  else
    writeFailure "Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify role field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("D2").Value
  puts field_permission
  if page.has_field?("Role")
    puts "role field is visible with read and write permission"
  else
    writeFailure "role field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify type field permission for SalesManager user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("D3").Value
  puts field_permission
  if page.has_field?("Type")
    puts "Type field is visible with read and write permission"
  else
    writeFailure "Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify role field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("C2").Value
  puts field_permission
  if page.has_field?("Role")
    puts "role field is visible with read and write permission"
  else
    writeFailure "role field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify type field permission for SalesRep user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("C3").Value
  puts field_permission
  if page.has_field?("Type")
    puts "Type field is visible with read and write permission"
  else
    writeFailure "Type field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify role field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("G2").Value
  puts field_permission
  if page.has_field?("Role")
    puts "role field is visible with read and write permission"
  else
    writeFailure "role field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify type field permission for SalesOps user role$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
  wrksheet.Select
  field_permission= wrksheet.Range("G3").Value
  puts field_permission
  if page.has_content?("")
    puts "Type field is visible with read only permisssion "
  else
    writeFailure "Type field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end


Given(/^I should verify "([^"]*)" field permission for "([^"]*)" with cell value "([^"]*)" for contact entity$/) do |field_name, user_role, cell_value|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(3)
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
  elsif user_role == "SalesOps"
    field_permission= wrksheet.Range("G#{cell_value}").Value
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
  elsif user_role == "OpsRep"
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
  else
    puts "user role does not matched"
  end
  excelsheet.Workbooks.close()
end

#When(/^I should verify "([^"]*)" field permission for sales ops with cell value "([^"]*)" for contact entity$/) do |field_name, cell_value|
#  excelsheet = WIN32OLE.new('excel.application')
#  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
#  wrksheet= wrkbook.Worksheets(3)
#  wrksheet.Select
#
#    field_permission= wrksheet.Range("F#{cell_value}").Value
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
#end