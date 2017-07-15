When(/^I click on new button under my task section$/) do
  sleep 5
  within all('.bRelatedList')[0] do
    puts "My Task section"
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button under My Task section"
    end
  end
end

When(/^I select "([^"]*)" from record type of new record$/) do |value|
  select value, :from => "Record Type of new record"
  if find(:button,'Continue').visible?
    click_on('Continue')
    puts "clicked on continue button"
  else
    writeFailure "Continue button is not available for this user"
  end
end

Then(/^I should verify "([^"]*)" field permission for "([^"]*)" with cell value "([^"]*)" for tasks entity$/) do |field_name, user_role, cell_value|
   excelsheet = WIN32OLE.new('excel.application')
  wrkbook= excelsheet.Workbooks.Open("D:\\salesforce_projects\\Cisco-Adopt-Field-Permission\\casefieldpermission.xlsx")
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
  else
    puts "user role does not matched"
  end
  excelsheet.Workbooks.close()
end
