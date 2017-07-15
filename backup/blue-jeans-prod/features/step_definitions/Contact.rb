

Given(/^I enter value to all the mandatory field over contact edit page$/) do
  $lastName = "Smoke_test_LastName_"+ Random.new.rand(1..20000).to_s
  if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set $lastName
    puts "New account record - #{$lastName} is created"
  else
    writeFailure "Fail to enter data in - Last Name - field "
  end
  if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set "Smoke_test_accounts_cases"
    puts "Enter data in Account Name"
  else
    writeFailure "Fail to enter data in - Account Name - field "
  end
end


And(/^I able to see the "([^"]*)" pickList field$/) do |role|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $contact_role = false
      if page.has_content?(role)
        puts "Successfully see the #{role} field"
        within all(".pbSubsection")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == role
              contact_role_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
              if contact_role_values.count > 0
                puts "Successfully see the #{role} pickList field is editable"
                $contact_role = true
                result = true
                break
              else
                putstr "Failed to see the #{role} pickList field is Read Only"
              end
            end
          end
          putstr "Failed to see the #{role} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{role} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $contact_role = false
        if page.has_content?(role)
          puts "Successfully see the #{role} field"
          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == role
                begin
                  contact_role_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if contact_role_values.count > 0
                    putstr "#{role} pickList field is editable"
                    $contact_role = true
                    result = true
                    break
                  end
                rescue
                  puts "#{role} pickList field is not visible"
                  $contact_role = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{role} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{role} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{role} field is visible"
  end
end



When(/^I able to see the "([^"]*)" PickList values$/) do |role|
  begin
    sleep 2
    arg = getDetails 'ContactsRolePickListValues'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      if page.has_content?(role)
        puts "Successfully see the #{role} field"
        within all(".pbSubsection")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == role
              if $contact_role == true
                contact_role_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                if contact_role_values.count > 0

                  result = true

                  if contact_role_values.include? arg["RoleANALYTICSAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleANALYTICSBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleANALYTICSPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleANALYTICSPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleANALYTICSPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleANGELAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleANGELAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleANGELPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleANGELPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleANGELPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleASPowerSponsor"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleASPowerSponsor"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleASPowerSponsor"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATEAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATEBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEBillToContact"]}"
                  end


                  if contact_role_values.include? arg["RoleCOLLABORATEPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATEPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATEReadOnly"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEReadOnly"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEReadOnly"]}"
                  end


                  if contact_role_values.include? arg["RoleCOLLABORATEReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEReference"]}"
                  end

                  if contact_role_values.include? arg["RoleCOLLABORATESOASignatory"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATESOASignatory"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATESOASignatory"]}"
                  end


                  if contact_role_values.include? arg["RoleCONNECTBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleCONNECTPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesContact"]}"
                  end


                  if contact_role_values.include? arg["RoleCONNECTPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleCONNECTReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTReference"]}"
                  end


                  if contact_role_values.include? arg["RoleConsortiumContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleConsortiumContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleConsortiumContact"]}"
                  end


                  if contact_role_values.include? arg["RoleEDUCATIONSERVICESBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleEDUCATIONSERVICESPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesContact"]}"
                  end


                  if contact_role_values.include? arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNAcademicDeveloper"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAcademicDeveloper"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAcademicDeveloper"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNAuthorizedContractSigner"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAuthorizedContractSigner"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAuthorizedContractSigner"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNBilling"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBilling"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBilling"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNBravo"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBravo"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBravo"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNMarketing"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNMarketing"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNMarketing"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNMLAAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNMLAAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNMLAAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNReadOnly"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNReadOnly"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNReadOnly"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNShipToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNShipToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNShipToContact"]}"
                  end


                  if contact_role_values.include? arg["RoleLEARNSOASignatory"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNTraining"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNTraining"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNTraining"]}"
                  end


                  if contact_role_values.include? arg["RoleLEARNAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNReference"]}"
                  end


                  if contact_role_values.include? arg["RoleLEARNSOASignatory"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNCEVistaAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNCEVistaPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNCEVistaPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLEARNCEVistaReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaReference"]}"
                  end

                  if contact_role_values.include? arg["RoleLSBillingContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLSBillingContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLSBillingContact"]}"
                  end

                  if contact_role_values.include? arg["RoleLSServicesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleLSServicesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleLSServicesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILEBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILEBilling"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEBilling"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEBilling"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILECentralAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILECentralAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILECentralAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILECentralPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILECentralPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILECentralPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILELearnAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILELearnAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILELearnAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILEMarketing"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEMarketing"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEMarketing"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILEPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesContact"]}"
                  end


                  if contact_role_values.include? arg["RoleMOBILEPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMOBILEReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEReference"]}"
                  end

                  if contact_role_values.include? arg["RoleAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RolePrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolePrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolePrimary"]}"
                  end

                  if contact_role_values.include? arg["RolePrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolePrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolePrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RolePrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolePrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolePrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMultiPlatformBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMultiPlatformPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleMultiPlatformPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleOPENCONTENTAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleOPENCONTENTAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleOPENCONTENTAdmin"]}"
                  end

                  if contact_role_values.include? arg["RolePARTNERPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RolePARTNERPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleSalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleSalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleSalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleSTUDENTSERVICESBillToContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESBillToContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESBillToContact"]}"
                  end

                  if contact_role_values.include? arg["RoleSTUDENTSERVICESPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RoleSTUDENTSERVICESReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESReference"]}"
                  end

                  if contact_role_values.include? arg["RoleTRANSACTAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTAdmin"]}"
                  end

                  if contact_role_values.include? arg["RoleTRANSACTMarketing"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTMarketing"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTMarketing"]}"
                  end

                  if contact_role_values.include? arg["RoleTRANSACTPrimary"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTPrimary"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTPrimary"]}"
                  end

                  if contact_role_values.include? arg["RoleTRANSACTReference"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTReference"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTReference"]}"
                  end

                  if contact_role_values.include? arg["RoleTSBillingContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTSBillingContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTSBillingContact"]}"
                  end

                  if contact_role_values.include? arg["RoleTSPowerSponsor"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTSPowerSponsor"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTSPowerSponsor"]}"
                  end

                  if contact_role_values.include? arg["RoleTSSponsor"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleTSSponsor"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleTSSponsor"]}"
                  end

                  if contact_role_values.include? arg["RoleWCTBillingContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleWCTBillingContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleWCTBillingContact"]}"
                  end

                  if contact_role_values.include? arg["RoleWCTServicesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RoleWCTServicesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RoleWCTServicesContact"]}"
                  end

                  if contact_role_values.include? arg["RolesAdmin"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolesAdmin"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolesAdmin"]}"
                  end

                  if contact_role_values.include? arg["RolesPrimarySalesContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolesPrimarySalesContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolesPrimarySalesContact"]}"
                  end

                  if contact_role_values.include? arg["RolesPrimarySalesTechnicalContact"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolesPrimarySalesTechnicalContact"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolesPrimarySalesTechnicalContact"]}"
                  end

                  if contact_role_values.include? arg["RolesSystemAdministrator"]
                    puts "Successfully see the #{role} pickList value: #{arg["RolesSystemAdministrator"]}"
                  else
                    putstr "Failed to see the #{role} pickList value: #{arg["RolesSystemAdministrator"]}"
                  end

                  break
                else
                  putstr "#{role} pickList field is not visible"
                end
              else
                putstr "#{role} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{role} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{role} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(role)
          puts "Successfully see the #{role} field"
          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == role
                unless $contact_role == true
                  contact_role_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if contact_role_values.count > 0

                    result = true

                    if contact_role_values.include? arg["RoleANALYTICSAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleANALYTICSBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleANALYTICSPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleANALYTICSPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleANALYTICSPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANALYTICSPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleANGELAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleANGELAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleANGELPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleANGELPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleANGELPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleANGELPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleANGELPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleASPowerSponsor"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleASPowerSponsor"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleASPowerSponsor"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATEAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATEBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEBillToContact"]}"
                    end


                    if contact_role_values.include? arg["RoleCOLLABORATEPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATEPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATEReadOnly"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEReadOnly"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEReadOnly"]}"
                    end


                    if contact_role_values.include? arg["RoleCOLLABORATEReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATEReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATEReference"]}"
                    end

                    if contact_role_values.include? arg["RoleCOLLABORATESOASignatory"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCOLLABORATESOASignatory"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCOLLABORATESOASignatory"]}"
                    end


                    if contact_role_values.include? arg["RoleCONNECTBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleCONNECTPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesContact"]}"
                    end


                    if contact_role_values.include? arg["RoleCONNECTPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleCONNECTReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleCONNECTReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleCONNECTReference"]}"
                    end


                    if contact_role_values.include? arg["RoleConsortiumContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleConsortiumContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleConsortiumContact"]}"
                    end


                    if contact_role_values.include? arg["RoleEDUCATIONSERVICESBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleEDUCATIONSERVICESPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesContact"]}"
                    end


                    if contact_role_values.include? arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleEDUCATIONSERVICESPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNAcademicDeveloper"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAcademicDeveloper"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAcademicDeveloper"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNAuthorizedContractSigner"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAuthorizedContractSigner"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAuthorizedContractSigner"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNBilling"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBilling"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBilling"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNBravo"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBravo"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBravo"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNMarketing"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNMarketing"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNMarketing"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNMLAAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNMLAAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNMLAAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNReadOnly"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNReadOnly"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNReadOnly"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNShipToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNShipToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNShipToContact"]}"
                    end


                    if contact_role_values.include? arg["RoleLEARNSOASignatory"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNTraining"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNTraining"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNTraining"]}"
                    end


                    if contact_role_values.include? arg["RoleLEARNAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNReference"]}"
                    end


                    if contact_role_values.include? arg["RoleLEARNSOASignatory"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNSOASignatory"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNCEVistaAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNCEVistaPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNCEVistaPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLEARNCEVistaReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLEARNCEVistaReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLEARNCEVistaReference"]}"
                    end

                    if contact_role_values.include? arg["RoleLSBillingContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLSBillingContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLSBillingContact"]}"
                    end

                    if contact_role_values.include? arg["RoleLSServicesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleLSServicesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleLSServicesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILEBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILEBilling"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEBilling"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEBilling"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILECentralAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILECentralAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILECentralAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILECentralPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILECentralPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILECentralPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILELearnAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILELearnAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILELearnAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILEMarketing"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEMarketing"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEMarketing"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILEPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesContact"]}"
                    end


                    if contact_role_values.include? arg["RoleMOBILEPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMOBILEReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMOBILEReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMOBILEReference"]}"
                    end

                    if contact_role_values.include? arg["RoleAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RolePrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolePrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolePrimary"]}"
                    end

                    if contact_role_values.include? arg["RolePrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolePrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolePrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RolePrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolePrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolePrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMultiPlatformBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMultiPlatformPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleMultiPlatformPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleMultiPlatformPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleOPENCONTENTAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleOPENCONTENTAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleOPENCONTENTAdmin"]}"
                    end

                    if contact_role_values.include? arg["RolePARTNERPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RolePARTNERPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolePARTNERPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleSalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleSalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleSalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleSTUDENTSERVICESBillToContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESBillToContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESBillToContact"]}"
                    end

                    if contact_role_values.include? arg["RoleSTUDENTSERVICESPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RoleSTUDENTSERVICESReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleSTUDENTSERVICESReference"]}"
                    end

                    if contact_role_values.include? arg["RoleTRANSACTAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTAdmin"]}"
                    end

                    if contact_role_values.include? arg["RoleTRANSACTMarketing"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTMarketing"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTMarketing"]}"
                    end

                    if contact_role_values.include? arg["RoleTRANSACTPrimary"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTPrimary"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTPrimary"]}"
                    end

                    if contact_role_values.include? arg["RoleTRANSACTReference"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTRANSACTReference"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTRANSACTReference"]}"
                    end

                    if contact_role_values.include? arg["RoleTSBillingContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTSBillingContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTSBillingContact"]}"
                    end

                    if contact_role_values.include? arg["RoleTSPowerSponsor"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTSPowerSponsor"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTSPowerSponsor"]}"
                    end

                    if contact_role_values.include? arg["RoleTSSponsor"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleTSSponsor"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleTSSponsor"]}"
                    end

                    if contact_role_values.include? arg["RoleWCTBillingContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleWCTBillingContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleWCTBillingContact"]}"
                    end

                    if contact_role_values.include? arg["RoleWCTServicesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RoleWCTServicesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RoleWCTServicesContact"]}"
                    end

                    if contact_role_values.include? arg["RolesAdmin"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolesAdmin"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolesAdmin"]}"
                    end

                    if contact_role_values.include? arg["RolesPrimarySalesContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolesPrimarySalesContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolesPrimarySalesContact"]}"
                    end

                    if contact_role_values.include? arg["RolesPrimarySalesTechnicalContact"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolesPrimarySalesTechnicalContact"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolesPrimarySalesTechnicalContact"]}"
                    end

                    if contact_role_values.include? arg["RolesSystemAdministrator"]
                      puts "Successfully see the #{role} pickList value: #{arg["RolesSystemAdministrator"]}"
                    else
                      putstr "Failed to see the #{role} pickList value: #{arg["RolesSystemAdministrator"]}"
                    end

                    break
                  else
                    putstr "#{role} pickList field is not visible"
                  end
                else
                  puts "Contact #{role} pickList field is not visible"
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{role} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{role} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{role} pickList values"
  end
end


And(/^I verify the contact "([^"]*)" pickList$/) do |type_field|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      $contact_status = false
      if page.has_content?(type_field)
        puts "Successfully see the #{type_field} field"
        within all(".pbSubsection")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == type_field
              $type_pickList = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
              if $type_pickList.count > 0
                puts "Successfully see the #{type_field} pickList"
                $contact_status = true
                result = true
                break
              else
                putstr "Failed to see the #{type_field} pickList"
              end
            end
          end
          putstr "Failed to see the #{type_field} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{type_field} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        $contact_status = false
        if page.has_content?(type_field)
          puts "Successfully see the #{type_field} field"
          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == type_field
                begin
                  $type_pickList = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  if $type_pickList.count > 0
                    putstr "#{type_field} pickList field is not editable"
                    $contact_status = true
                    result = true
                    break
                  end
                rescue
                  puts "#{type_field} pickList field is not visible"
                  $contact_status = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{type_field} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{type_field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type_field} pickList"
  end
end


When(/^I verify the "([^"]*)" PickList values$/) do |type_field|
  begin
    sleep 3
    arg = getDetails 'ContactsTypePickListValues'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      if page.has_select?(type_field)
        puts "Successfully see the #{type_field} field"
        within all(".pbSubsection")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == type_field

              if $contact_status == true
                puts "Successfully see the #{type_field} pickList field is visible"

                result = true

                $type_pickList_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $type_pickList_values.include?arg["ContactTypeClient"]
                  puts "Successfully see the #{type_field} pickList value: #{arg["ContactTypeClient"]}"
                else
                  putstr "Failed to see the #{type_field} pickList value: #{arg["ContactTypeClient"]}"
                end

                if $type_pickList_values.include?arg["ContactsTypeDistributor"]
                  puts "Successfully see the #{type_field} pickList value: #{arg["ContactsTypeDistributor"]}"
                else
                  putstr "Failed to see the #{type_field} pickList value: #{arg["ContactsTypeDistributor"]}"
                end

                if $type_pickList_values.include?arg["ContactTypeEndUser"]
                  puts "Successfully see the #{type_field} pickList value: #{arg["ContactTypeEndUser"]}"
                else
                  putstr "Failed to see the #{type_field} pickList value: #{arg["ContactTypeEndUser"]}"
                end

                if $type_pickList_values.include?arg["ContactsTypeReseller"]
                  puts "Successfully see the #{type_field} pickList value: #{arg["ContactsTypeReseller"]}"
                else
                  putstr "Failed to see the #{type_field} pickList value: #{arg["ContactsTypeReseller"]}"
                end

                break
              else
                putstr "Contact #{type_field} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{type_field} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{type_field} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_content?(type_field)
          puts "Successfully see the #{type_field} field"
          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == type_field

                unless $contact_status == true
                  puts "Successfully see the #{type_field} pickList field is visible"

                  result = true

                  $type_pickList_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                  if $type_pickList_values.include?arg["ContactTypeClient"]
                    puts "Successfully see the #{type_field} pickList value: #{arg["ContactTypeClient"]}"
                  else
                    putstr "Failed to see the #{type_field} pickList value: #{arg["ContactTypeClient"]}"
                  end

                  if $type_pickList_values.include?arg["ContactsTypeDistributor"]
                    puts "Successfully see the #{type_field} pickList value: #{arg["ContactsTypeDistributor"]}"
                  else
                    putstr "Failed to see the #{type_field} pickList value: #{arg["ContactsTypeDistributor"]}"
                  end

                  if $type_pickList_values.include?arg["ContactTypeEndUser"]
                    puts "Successfully see the #{type_field} pickList value: #{arg["ContactTypeEndUser"]}"
                  else
                    putstr "Failed to see the #{type_field} pickList value: #{arg["ContactTypeEndUser"]}"
                  end

                  if $type_pickList_values.include?arg["ContactsTypeReseller"]
                    puts "Successfully see the #{type_field} pickList value: #{arg["ContactsTypeReseller"]}"
                  else
                    putstr "Failed to see the #{type_field} pickList value: #{arg["ContactsTypeReseller"]}"
                  end

                  break
                else
                  puts "Contact #{type_field} pickList field is not visible"
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{type_field} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{type_field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the from #{type_field}"
  end

end