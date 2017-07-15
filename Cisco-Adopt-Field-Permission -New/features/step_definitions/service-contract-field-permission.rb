When(/^I click on service contracts tab$/) do
  sleep 5
  find(:xpath,"//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject serviceContractBlock title']").click
  sleep 10
end

When(/^I should verify "([^"]*)" field permission for "([^"]*)" with cell value "([^"]*)" for service contract entity$/) do |field_name, user_role, cell_value|
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

When(/^I click on existing service contract$/) do
  if page.has_select?("fcf", :selected => "All Service Contracts")
    sleep 3
    find(:xpath,"//input[@name='go']").click
    sleep 5
  else
    select("All Service Contracts", :from => 'fcf')
    sleep 5
  end
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[1].all('div')[0].all('a')[0].click
  end
end

When(/^I should verify "([^"]*)" field permission for salesops with cell value "([^"]*)" for service contract entity$/) do |field_name,cell_value|
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
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
    excelsheet.Workbooks.close()
end

When(/^I should verify Description field permission for opsmanager user role for service contracts entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F2").Value
  puts field_permission
  if page.has_field?("Description")
    puts "Description field is visible with read and write permission"
  else
    writeFailure "Description field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Territory field permission for opsmanager user role for service contracts entity$/) do
 excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F3").Value
  puts field_permission
  if page.has_field?("Client Territory")
    puts "Client Territory field is visible with read and write permission"
  else
    writeFailure "Client Territory field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Segment field permission for opsmanager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F4").Value
  puts field_permission
  if page.has_field?("Client Segment")
    puts "Client Segment field is visible with read and write permission"
  else
    writeFailure "Client Segment field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Country field permission for opsmanager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F5").Value
  puts field_permission
  if page.has_field?("Country")
    puts "Country field is visible with read and write permission"
  else
    writeFailure "Country field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F6").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Cisco Contract Status field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F7").Value
  puts field_permission
  if page.has_field?("Cisco Contract Status")
    puts "Cisco Contract Status field is visible with read and write permission"
  else
    writeFailure "Cisco Contract Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Deployment Status field permission for opsmanager user role for service contracts entity$/) do
 excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F8").Value
  puts field_permission
  if page.has_field?("Deployment Status")
    puts "Deployment Status field is visible with read and write permission"
  else
    writeFailure "Deployment Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Dtrack Case Number field permission for opsmanager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F9").Value
  puts field_permission
  if page.has_field?("Dtrack Case Number")
    puts "Dtrack Case Number field is visible with read and write permission"
  else
    writeFailure "Dtrack Case Number field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Service Offering field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F10").Value
  puts field_permission
  if page.has_field?("Service Offering")
    puts "Service Offering field is visible with read and write permission"
  else
    writeFailure "Service Offering field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID\-DS field permission for opsmanager user role for service contracts entity$/) do
 excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F11").Value
  puts field_permission
  if page.has_field?("Site ID-DS")
    puts "Site ID-DS field is visible with read and write permission"
  else
    writeFailure "Site ID-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year DS field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Data Delivery Date field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F12").Value
  puts field_permission
  if page.has_field?("Client Data Delivery Date")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Quarter field permission for opsmanager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F14").Value
  puts field_permission
  if page.has_field?("Client Batch Quarter")
    puts "Client Batch Quarter field is visible with read and write permission"
  else
    writeFailure "Client Batch Quarter field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product ID field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F15").Value
  puts field_permission
  if page.has_field?("Product ID")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F16").Value
  puts field_permission
  if page.has_content?("Site ID")
    puts "Site ID field is visible with read only permisssion "
  else
    writeFailure "Site ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year field permission for opsmanager user role for service contracts entity$/) do
excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("F17").Value
  puts field_permission
  if page.has_content?("Client Batch Year")
    puts "Client Batch Year field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Description field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E2").Value
  puts field_permission
  if page.has_field?("Description")
    puts "Description field is visible with read and write permission"
  else
    writeFailure "Description field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Territory field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E3").Value
  puts field_permission
  if page.has_field?("Client Territory")
    puts "Client Territory field is visible with read and write permission"
  else
    writeFailure "Client Territory field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end
When(/^I should verify Client Segment field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E4").Value
  puts field_permission
  if page.has_field?("Client Segment")
    puts "Client Segment field is visible with read and write permission"
  else
    writeFailure "Client Segment field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Country field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E5").Value
  puts field_permission
  if page.has_field?("Country")
    puts "Country field is visible with read and write permission"
  else
    writeFailure "Country field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for OpsRep user role for service contracts entity$/) do
 excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E6").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Cisco Contract Status field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E7").Value
  puts field_permission
  if page.has_field?("Cisco Contract Status")
    puts "Cisco Contract Status field is visible with read and write permission"
  else
    writeFailure "Cisco Contract Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Deployment Status field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E8").Value
  puts field_permission
  if page.has_field?("Deployment Status")
    puts "Deployment Status field is visible with read and write permission"
  else
    writeFailure "Deployment Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Dtrack Case Number field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E9").Value
  puts field_permission
  if page.has_field?("Dtrack Case Number")
    puts "Dtrack Case Number field is visible with read and write permission"
  else
    writeFailure "Dtrack Case Number field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Service Offering field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E10").Value
  puts field_permission
  if page.has_field?("Service Offering")
    puts "Service Offering field is visible with read and write permission"
  else
    writeFailure "Service Offering field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID\-DS field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E11").Value
  puts field_permission
  if page.has_field?("Site ID-DS")
    puts "Site ID-DS field is visible with read and write permission"
  else
    writeFailure "Site ID-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year DS field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Data Delivery Date field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Quarter field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E14").Value
  puts field_permission
  if page.has_field?("Client Batch Quarter")
    puts "Client Batch Quarter field is visible with read and write permission"
  else
    writeFailure "Client Batch Quarter field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product ID field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E15").Value
  puts field_permission
  if page.has_field?("Product ID")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E16").Value
  puts field_permission
  if page.has_content?("Site ID")
    puts "Site ID field is visible with read only permisssion "
  else
    writeFailure "Site ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year field permission for OpsRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E17").Value
  puts field_permission
  if page.has_content?("Client Batch Year")
    puts "Client Batch Year field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end


When(/^I should verify Description field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D2").Value
  puts field_permission
  if page.has_field?("Description")
    puts "Description field is visible with read and write permission"
  else
    writeFailure "Description field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Territory field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D3").Value
  puts field_permission
  if page.has_field?("Client Territory")
    puts "Client Territory field is visible with read and write permission"
  else
    writeFailure "Client Territory field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Segment field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D4").Value
  puts field_permission
  if page.has_field?("Client Segment")
    puts "Client Segment field is visible with read and write permission"
  else
    writeFailure "Client Segment field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Country field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D5").Value
  puts field_permission
  if page.has_field?("Country")
    puts "Country field is visible with read and write permission"
  else
    writeFailure "Country field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D6").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Cisco Contract Status field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D7").Value
  puts field_permission
  if page.has_field?("Cisco Contract Status")
    puts "Cisco Contract Status field is visible with read and write permission"
  else
    writeFailure "Cisco Contract Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Deployment Status field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D8").Value
  puts field_permission
  if page.has_field?("Deployment Status")
    puts "Deployment Status field is visible with read and write permission"
  else
    writeFailure "Deployment Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Dtrack Case Number field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D9").Value
  puts field_permission
  if page.has_field?("Dtrack Case Number")
    puts "Dtrack Case Number field is visible with read and write permission"
  else
    writeFailure "Dtrack Case Number field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Service Offering field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D10").Value
  puts field_permission
  if page.has_field?("Service Offering")
    puts "Service Offering field is visible with read and write permission"
  else
    writeFailure "Service Offering field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID\-DS field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D11").Value
  puts field_permission
  if page.has_field?("Site ID-DS")
    puts "Site ID-DS field is visible with read and write permission"
  else
    writeFailure "Site ID-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year DS field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Data Delivery Date field permission for SalesManager user role for service contracts entity$/) do
 excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D13").Value
  puts field_permission
  if page.has_field?("Client Data Delivery Date")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Quarter field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D14").Value
  puts field_permission
  if page.has_field?("Client Batch Quarter")
    puts "Client Batch Quarter field is visible with read and write permission"
  else
    writeFailure "Client Batch Quarter field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product ID field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D15").Value
  puts field_permission
  if page.has_field?("Product ID")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D16").Value
  puts field_permission
  if page.has_content?("Site ID")
    puts "Site ID field is visible with read only permisssion "
  else
    writeFailure "Site ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year field permission for SalesManager user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("D17").Value
  puts field_permission
  if page.has_content?("Client Batch Year")
    puts "Client Batch Year field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Description field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C2").Value
  puts field_permission
  if page.has_field?("Description")
    puts "Description field is visible with read and write permission"
  else
    writeFailure "Description field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Territory field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C3").Value
  puts field_permission
  if page.has_field?("Client Territory")
    puts "Client Territory field is visible with read and write permission"
  else
    writeFailure "Client Territory field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Segment field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C4").Value
  puts field_permission
  if page.has_field?("Client Segment")
    puts "Client Segment field is visible with read and write permission"
  else
    writeFailure "Client Segment field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Country field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C5").Value
  puts field_permission
  if page.has_field?("Country")
    puts "Country field is visible with read and write permission"
  else
    writeFailure "Country field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C6").Value
  puts field_permission
  if page.has_field?("Product")
    puts "Product field is visible with read and write permission"
  else
    writeFailure "Product field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Cisco Contract Status field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C7").Value
  puts field_permission
  if page.has_field?("Cisco Contract Status")
    puts "Cisco Contract Status field is visible with read and write permission"
  else
    writeFailure "Cisco Contract Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Deployment Status field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C8").Value
  puts field_permission
  if page.has_field?("Deployment Status")
    puts "Deployment Status field is visible with read and write permission"
  else
    writeFailure "Deployment Status field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Dtrack Case Number field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C9").Value
  puts field_permission
  if page.has_field?("Dtrack Case Number")
    puts "Dtrack Case Number field is visible with read and write permission"
  else
    writeFailure "Dtrack Case Number field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Service Offering field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C10").Value
  puts field_permission
  if page.has_field?("Service Offering")
    puts "Service Offering field is visible with read and write permission"
  else
    writeFailure "Service Offering field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID\-DS field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C11").Value
  puts field_permission
  if page.has_field?("Site ID-DS")
    puts "Site ID-DS field is visible with read and write permission"
  else
    writeFailure "Site ID-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year DS field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Data Delivery Date field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C12").Value
  puts field_permission
  if page.has_field?("Client Batch Year-DS")
    puts "Client Batch Year-DS field is visible with read and write permission"
  else
    writeFailure "Client Batch Year-DS field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Quarter field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C14").Value
  puts field_permission
  if page.has_field?("Client Batch Quarter")
    puts "Client Batch Quarter field is visible with read and write permission"
  else
    writeFailure "Client Batch Quarter field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product ID field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C15").Value
  puts field_permission
  if page.has_field?("Product ID")
    puts "Client Data Delivery Date field is visible with read and write permission"
  else
    writeFailure "Client Data Delivery Date field is not visible with read and write permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C16").Value
  puts field_permission
  if page.has_content?("Site ID")
    puts "Site ID field is visible with read only permisssion "
  else
    writeFailure "Site ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year field permission for SalesRep user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("C17").Value
  puts field_permission
  if page.has_content?("Client Batch Year")
    puts "Client Batch Year field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Description field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G2").Value
  puts field_permission
  if page.has_content?("Description")
    puts "Description field is visible with read only permisssion "
  else
    writeFailure "Description field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Territory field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G3").Value
  puts field_permission
  if page.has_content?("Client Territory")
    puts "Client Territory field is visible with read only permisssion "
  else
    writeFailure "Client Territory field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Segment field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G4").Value
  puts field_permission
  if page.has_content?("Client Segment")
    puts "Client Segment field is visible with read only permisssion "
  else
    writeFailure "Client Segment field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Country field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G5").Value
  puts field_permission
  if page.has_content?("Country")
    puts "Country field is visible with read only permisssion "
  else
    writeFailure "Country field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G6").Value
  puts field_permission
  if page.has_content?("Product")
    puts "Product field is visible with read only permisssion "
  else
    writeFailure "Product field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Cisco Contract Status field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G7").Value
  puts field_permission
  if page.has_content?("Cisco Contract Status")
    puts "Cisco Contract Status field is visible with read only permisssion "
  else
    writeFailure "Cisco Contract Status field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Deployment Status field permission for SalesOps user role for service contracts entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G8").Value
  puts field_permission
  if page.has_content?("Deployment Status")
    puts "Deployment Status field is visible with read only permisssion "
  else
    writeFailure "Deployment Status field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Dtrack Case Number field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G9").Value
  puts field_permission
  if page.has_content?("Dtrack Case Number")
    puts "Dtrack Case Number field is visible with read only permisssion "
  else
    writeFailure "Dtrack Case Number field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Service Offering field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G10").Value
  puts field_permission
  if page.has_content?("Service Offering")
    puts "Service Offering field is visible with read only permisssion "
  else
    writeFailure "Service Offering field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID\-DS field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G11").Value
  puts field_permission
  if page.has_content?("Site ID-DS")
    puts "Site ID-DS field is visible with read only permisssion "
  else
    writeFailure "Site ID-DS field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year DS field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G12").Value
  puts field_permission
  if page.has_content?("Client Batch Year DS")
    puts "Client Batch Year DS field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year DS field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Data Delivery Date field permission for SalesOps user role for service contracts entity$/) do
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G13").Value
  puts field_permission
  if page.has_content?("Client Data Delivery Date")
    puts "Client Data Delivery Date field is visible with read only permisssion "
  else
    writeFailure "Client Data Delivery Date field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Quarter field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G14").Value
  puts field_permission
  if page.has_content?("Client Batch Quarter")
    puts "Client Batch Quarter field is visible with read only permisssion "
  else
    writeFailure "Client Batch Quarter field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Product ID field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("G15").Value
  puts field_permission
  if page.has_content?("Product ID")
    puts "Product ID field is visible with read only permisssion "
  else
    writeFailure "Product ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Site ID field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E16").Value
  puts field_permission
  if page.has_content?("Site ID")
    puts "Site ID field is visible with read only permisssion "
  else
    writeFailure "Site ID field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

When(/^I should verify Client Batch Year field permission for SalesOps user role for service contracts entity$/) do
  excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission -New\\casefieldpermission.xlsx")
  wrksheet= wrkbook.Worksheets(4)
  wrksheet.Select
  field_permission= wrksheet.Range("E17").Value
  puts field_permission
  if page.has_content?("Client Batch Year")
    puts "Client Batch Year field is visible with read only permisssion "
  else
    writeFailure "Client Batch Year field is not visible with read permission"
  end
  excelsheet.Workbooks.close()
end

