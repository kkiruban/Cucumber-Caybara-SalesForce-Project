
And(/^I verify the "([^"]*)" pickList$/) do |industry|
  begin
   sleep 2
   if page.has_content?(industry)
     puts "Successfully see the #{industry} name"
     if page.has_xpath?("//select[@id='acc7']")
       puts "Successfully see the #{industry} pickList"
     else
       putstr "Failed to see the #{industry} pickList"
     end
   else
     putstr "Failed to see the #{industry} name"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{industry} pickList"
  end
end

And(/^I able to see the "([^"]*)" pickList values$/) do |industry|
  begin
    sleep 2
    arg = getDetails 'AccountIndustryPickListValues'

    if page.has_xpath?("//select[@id='acc7']")

      puts "Successfully see the #{industry} pickList"

      $Industry = []

      all(:xpath,"//select[@id='acc7']/option").each do |options|

        $Industry << options.text
      end

      if $Industry.include?arg["IndustryAgriculture"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAgriculture"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAgriculture"]} "
      end

      if $Industry.include?arg["IndustryApparel"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryApparel"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryApparel"]}"
      end

      if $Industry.include?arg["IndustryBanking"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBanking"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBanking"]}"
      end


      if $Industry.include?arg["IndustryBiotechnology"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBiotechnology"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBiotechnology"]} "
      end

      if $Industry.include?arg["IndustryChemicals"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryChemicals"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryChemicals"]}"
      end

      if $Industry.include?arg["IndustryCommunications"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryCommunications"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryCommunications"]}"
      end


      if $Industry.include?arg["IndustryConstruction"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryConstruction"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryConstruction"]} "
      end

      if $Industry.include?arg["IndustryConsulting"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryConsulting"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryConsulting"]}"
      end

      if $Industry.include?arg["IndustryEducation"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEducation"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEducation"]}"
      end


      if $Industry.include?arg["IndustryElectronics"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryElectronics"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryElectronics"]} "
      end

      if $Industry.include?arg["IndustryEnergy"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEnergy"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEnergy"]}"
      end

      if $Industry.include?arg["IndustryEngineering"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEngineering"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEngineering"]}"
      end


      if $Industry.include?arg["IndustryEntertainment"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEntertainment"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEntertainment"]} "
      end

      if $Industry.include?arg["IndustryEnvironmental"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEnvironmental"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEnvironmental"]}"
      end

      if $Industry.include?arg["IndustryFinance"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryFinance"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryFinance"]}"
      end


      if $Industry.include?arg["IndustryFood"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryFood"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryFood"]} "
      end

      if $Industry.include?arg["IndustryGovernment"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryGovernment"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryGovernment"]}"
      end

      if $Industry.include?arg["IndustryHealthcare"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryHealthcare"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryHealthcare"]}"
      end


      if $Industry.include?arg["IndustryHospitality"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryHospitality"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryHospitality"]} "
      end

      if $Industry.include?arg["IndustryInsurance"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryInsurance"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryInsurance"]}"
      end

      if $Industry.include?arg["IndustryMachinery"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMachinery"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMachinery"]}"
      end


      if $Industry.include?arg["IndustryManufacturing"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryManufacturing"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryManufacturing"]} "
      end

      if $Industry.include?arg["IndustryMedia"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMedia"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMedia"]}"
      end

      if $Industry.include?arg["IndustryNotForProfit"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryNotForProfit"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryNotForProfit"]}"
      end

      if $Industry.include?arg["IndustryOther"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryOther"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryOther"]} "
      end

      if $Industry.include?arg["IndustryRecreation"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryRecreation"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryRecreation"]}"
      end

      if $Industry.include?arg["IndustryRetail"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryRetail"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryRetail"]}"
      end


      if $Industry.include?arg["IndustryShipping"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryShipping"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryShipping"]} "
      end

      if $Industry.include?arg["IndustryTechnology"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryTechnology"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryTechnology"]}"
      end

      if $Industry.include?arg["IndustryTelecommunications"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryTelecommunications"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryTelecommunications"]}"
      end


      if $Industry.include?arg["IndustryTransportation"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryTransportation"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryTransportation"]} "
      end

      if $Industry.include?arg["IndustryUtilities"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryUtilities"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryUtilities"]}"
      end

      if $Industry.include?arg["IndustryAdvertising"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAdvertising"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAdvertising"]}"
      end


      if $Industry.include?arg["IndustryAerospace"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAerospace"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAerospace"]} "
      end

      if $Industry.include?arg["IndustryAirlines"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAirlines"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAirlines"]}"
      end

      if $Industry.include?arg["IndustryAutomobiles"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAutomobiles"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAutomobiles"]}"
      end

      sleep 4
      if $Industry.include?arg["IndustryAutomotiveService"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryAutomotiveService"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryAutomotiveService"]}"
      end

      if $Industry.include?arg["IndustryBatteries"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBatteries"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBatteries"]} "
      end

      if $Industry.include?arg["IndustryBoats"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBoats"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBoats"]}"
      end

      if $Industry.include?arg["IndustryBrokerage"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBrokerage"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBrokerage"]}"
      end

      if $Industry.include?arg["IndustryBuildingMaterials"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBuildingMaterials"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBuildingMaterials"]} "
      end

      if $Industry.include?arg["IndustryBusinessServices"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryBusinessServices"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryBusinessServices"]}"
      end

      if $Industry.include?arg["IndustryCreditCards"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryCreditCards"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryCreditCards"]}"
      end

      if $Industry.include?arg["IndustryCrops"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryCrops"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryCrops"]} "
      end

      if $Industry.include?arg["IndustryDebtCollection"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryDebtCollection"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryDebtCollection"]}"
      end

      if $Industry.include?arg["IndustryDrugManufacturing"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryDrugManufacturing"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryDrugManufacturing"]}"
      end

      if $Industry.include?arg["IndustryElectricityOil"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryElectricityOil"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryElectricityOil"]} "
      end

      if $Industry.include?arg["IndustryElectronicComponents"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryElectronicComponents"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryElectronicComponents"]}"
      end

      if $Industry.include?arg["IndustryEnergyUtilities"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryEnergyUtilities"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryEnergyUtilities"]}"
      end

      if $Industry.include?arg["IndustryFacilitiesManagement"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryFacilitiesManagement"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryFacilitiesManagement"]} "
      end

      if $Industry.include?arg["IndustryFreight"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryFreight"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryFreight"]}"
      end

      if $Industry.include?arg["IndustryHealthNutritionProducts"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryHealthNutritionProducts"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryHealthNutritionProducts"]}"
      end

      if $Industry.include?arg["IndustryHospitalsClinics"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryHospitalsClinics"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryHospitalsClinics"]} "
      end

      if $Industry.include?arg["IndustryIndustrialMachinery"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryIndustrialMachinery"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryIndustrialMachinery"]}"
      end

      if $Industry.include?arg["IndustryInformationCollection"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryInformationCollection"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryInformationCollection"]}"
      end

      if $Industry.include?arg["IndustryInvestmentBanking"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryInvestmentBanking"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryInvestmentBanking"]} "
      end

      if $Industry.include?arg["IndustrySchools"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustrySchools"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustrySchools"]}"
      end

      if $Industry.include?arg["IndustryLawFirms"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryLawFirms"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryLawFirms"]}"
      end

      if $Industry.include?arg["IndustryManagementConsulting"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryManagementConsulting"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryManagementConsulting"]} "
      end

      if $Industry.include?arg["IndustryMarineShipping"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMarineShipping"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMarineShipping"]}"
      end

      if $Industry.include?arg["IndustryMedicalDevices"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMedicalDevices"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMedicalDevices"]}"
      end

      if $Industry.include?arg["IndustryMedicalTesting"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMedicalTesting"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMedicalTesting"]} "
      end

      if $Industry.include?arg["IndustryMetalsMinerals"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryMetalsMinerals"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryMetalsMinerals"]}"
      end

      if $Industry.include?arg["IndustryOilGasExploration"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryOilGasExploration"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryOilGasExploration"]}"
      end

      if $Industry.include?arg["IndustryPharmaceuticals"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryPharmaceuticals"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryPharmaceuticals"]} "
      end

      if $Industry.include?arg["IndustryPlasticPackaging"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryPlasticPackaging"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryPlasticPackaging"]}"
      end

      if $Industry.include?arg["IndustryRealEstate"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryRealEstate"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryRealEstate"]}"
      end


      if $Industry.include?arg["IndustrySoftwareDevelopment"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustrySoftwareDevelopment"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustrySoftwareDevelopment"]} "
      end

      if $Industry.include?arg["IndustryVentureCapital"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryVentureCapital"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryVentureCapital"]}"
      end

      if $Industry.include?arg["IndustryWasteTreatment"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryWasteTreatment"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryWasteTreatment"]}"
      end

      if $Industry.include?arg["IndustryWaterTreatment"]
        puts "Successfully see the #{industry} pickList value: #{arg["IndustryWaterTreatment"]}"
      else
        putstr "Failed to see the #{industry} pickList value: #{arg["IndustryWaterTreatment"]}"
      end

      sleep 5
    else
      putstr "Failed to see the #{industry} pickList"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{industry} pickList values"
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


And(/^I verify "([^"]*)" field should be visible$/) do |sic_code|
  begin
    sleep 2
    $account_sic_code = false
    if page.has_content?(sic_code)
      puts "Successfully see the #{sic_code} field"
      if page.has_css?("#acc16")
        puts "Successfully see the #{sic_code} text box field is visible"
        $account_sic_code = true
      else
        putstr "Failed to see the #{sic_code} text box field is not visible"
      end
    else
      putstr "Failed to see the #{sic_code} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{sic_code} field is visible"
  end
end


And(/^I verify "([^"]*)" text field with valid edit permissions$/) do |field|
  begin
    sleep 3
    arg = getDetails 'NewAccountInformation'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      within all(".detailList")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        tr.each do |row|
          if row.all("td")[2].text == field
            if $account_sic_code == true
              if row.all("td")[3].first("input")[:type] == arg["AccountSICCodeTextBox"]
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
      if (ENV['UserRole'] == "SalesOperationSit")
        within all(".detailList")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          tr.each do |row|
            if row.all("td")[2].text == field
              if $account_zip_code == true
                if row.all("td")[3].first("input")[:type] == arg["AccountSICCodeTextBox"]
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


And(/^I verify "([^"]*)" is not include in the page$/) do |chanel|
  begin
    sleep 2
    unless page.has_content?(chanel)
      puts "#{chanel} field is not include in new account page"
    else
      putstr "Able to see the #{chanel} field in new account page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{chanel} field"
  end
end

And(/^I should not able to see the "([^"]*)" section visible$/) do |chanel|
  begin
    sleep 3
    unless page.has_content?(chanel)
      puts "#{chanel} section is not visible"
    else
      putstr "#{chanel} section is visible in new account page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{chanel} section should not visible"
  end
end

And(/^I enter account required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    $account_name = "#{arg["NewAccountName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#acc2")
      puts "Successfully see the #{arg["AccountName"]} field"
      find("#acc2").send_keys $account_name
    else
      putstr "Failed to find the #{arg["AccountName"]} field"
    end
    puts "Successfully fill the account required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the account required fields"
  end
end

Then(/^I able to see the account created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".topName")
      if find(".topName").text == $account_name
        puts "Successfully created the Account: #{$account_name}"
      else
        putstr "Failed to created the Account: #{$account_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#acc2_ileinner").text.include? $account_name
          puts "Successfully created the Account: #{$account_name}"
        else
          putstr "Failed to created the Account: #{$account_name}"
        end
      end
    else
      putstr "Failed to created the Account: #{$account_name}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Account record: #{$account_name}"
  end
end