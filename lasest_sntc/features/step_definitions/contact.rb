Then(/^I fill all the mandantory fields to create a account "([^"]*)"$/) do |value|
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = value
    fill_in "acc2",:with => $account_name
    puts $account_name
    puts "account name is: #{$account_name} "

    if page.has_field?("00N3600000EeE7h")
      select("APAC", :from => "00N3600000EeE7h")
      puts "value for Client Theatre picklist is selected"
    else
      writeFailure "Client Theatre field is not available"
    end

    if page.has_field?("Client Company ID")
      fill_in "Client Company ID",:with => "01"
      puts "Client Company ID is entered"
    else

    end

    if page.has_field?("00N3600000JH0Zp")
      fill_in "00N3600000JH0Zp",:with => "10"
      puts "SNTC SREV Health Score is entered"
    else

      puts "SNTC SREV Health Score field is not availabe"
    end

    if page.has_field?("00N3600000JH0dr")
      fill_in "00N3600000JH0dr",:with => "10"
      puts "SNTC Cisco Health Score is entered"
      sleep 2
    else
      writeFailure "SNTC Cisco Health Score field is not available"
    end

    if page.has_field?("00N3600000JH1SQ_unselected")
      page.find_by_id('00N3600000JH1SQ_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH1SQ_right_arrow").click
      sleep 2
      puts "value for SNTC Inhibitors multi picklist is selected"
    else
      writeFailure "SNTC Inhibitors multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH1Sa_unselected")
      page.find_by_id('00N3600000JH1Sa_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH1Sa_right_arrow").click
      puts "value for SNTC Achieved Outcomes multi picklist is selected"
      sleep 2
    else
      writeFailure "SNTC Achieved Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH1Zv_unselected")
      page.find_by_id('00N3600000JH1Zv_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH1Zv_right_arrow").click
      puts "value for SNTC Desired Outcomes multi picklist is selected"
      sleep 2
    else
      writeFailure "SNTC Desired Outcomes multi picklist is not available"
    end

    if page.has_field?("00N3600000JH2IO_unselected")
      page.find_by_id('00N3600000JH2IO_unselected').find("option[value='1']").select_option
      sleep 5
      find(:id, "00N3600000JH2IO_right_arrow").click
      puts "value for SNTC Features multi picklist is selected"
      sleep 2
    else
      writeFailure "SNTC Features multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH2iR")
      select("Competitive Service Loss", :from => "00N3600000JH2iR")
      puts "value for SNTC At Risk Reason picklist is selected"
    else
      writeFailure "SNTC At Risk Reason picklist field is not available"
    end

    if page.has_field?("00N3600000JH2q6")
      select("Very Likely to Renew", :from => "00N3600000JH2q6")
      puts "value for SNTC Customer Sentiment picklist is selected"
    else
      writeFailure "SNTC Customer Sentiment picklist is not available"
    end

    if page.has_field?("00N3600000JH2qV")
      select("Healthy", :from => "00N3600000JH2qV")
      puts "value for SNTC SREV Health Status picklist is selected"
    else
      writeFailure "SNTC SREV Health Status picklist is not available"
    end

    if page.has_field?("00N3600000JH2qf")
      fill_in "00N3600000JH2qf",:with => "7/27/2016"
      puts "SNTC Last Health Status is entered"
    else
      writeFailure "SNTC Last Health Status field is not availble"
    end

    if page.has_field?("00N7A000000Y2Oq")
      select("Healthy", :from => "00N7A000000Y2Oq")
      puts "value for SNTC Cisco Health Status picklist is selected"
    else
      writeFailure "SNTC Cisco Health Status picklist field is not available"
    end

    if page.has_field?("00N3600000JH2qz")
      select("Active", :from => "00N3600000JH2qz")
      puts "value for SNTC Stage picklist is selected"
    else
      writeFailure "SNTC Stage picklist field is not available"
    end

    if page.has_field?("00N3600000JH2qu")
      fill_in "00N3600000JH2qu",:with => "7/27/2016"
      puts "AMP Last Health Status is entered"
    else
      writeFailure "AMP Last Health Status field is not available"
    end

    if page.has_field?("00N3600000JH428")
      select("Healthy", :from => "00N3600000JH428")
      puts "value for AMP SREV Health Status picklist is selected"
    else
      writeFailure "AMP SREV Health Status picklist field is not available"
    end

    if page.has_field?("00N3600000JH42D")
      select("Very Likely to Renew", :from => "00N3600000JH42D")
      puts "value for AMP Customer Sentiment picklist is selected"
    else
      writeFailure "AMP Customer Sentiment picklist is not available"
    end

    if page.has_field?("00N3600000JH42I")
      select("Competitive Service Loss", :from => "00N3600000JH42I")
      puts "value for AMP At Risk Reason picklist is selected"
    else
      writeFailure "AMP At Risk Reason picklist is not available"
    end

    if page.has_field?("00N3600000JH43p_unselected")
      page.find_by_id('00N3600000JH43p_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH43p_right_arrow").click
      sleep 2
      puts "value for AMP Features multi picklist is selected"
    else
      writeFailure "AMP Features multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH5zV_unselected")
      page.find_by_id('00N3600000JH5zV_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH5zV_right_arrow").click
      sleep 2
      puts "value for AMP Achieved Outcomes multi picklist is selected"
    else
      writeFailure "AMP Achieved Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH4yg_unselected")
      page.find_by_id('00N3600000JH4yg_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH4yg_right_arrow").click
      sleep 2
      puts "value for AMP Desired Outcomes multi picklist is selected"
    else
      writeFailure "AMP Desired Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH9QA")
      fill_in "00N3600000JH9QA",:with => "10"
      puts "AMP SREV Health Score is entered"
    else
      writeFailure "AMP SREV Health Score field is not available"
    end

    if page.has_field?("00N3600000JH700_unselected")
      page.find_by_id('00N3600000JH700_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH700_right_arrow").click
      sleep 2
      puts "value for AMP Inhibitors multi picklist is selected"
    else
      writeFailure "AMP Inhibitors multi picklist is not available"
    end

    if page.has_field?("00N3600000JH9QP")
      fill_in "00N3600000JH9QP",:with => "10"
      puts "AMP Cisco Health Score is entered"
    else
      writeFailure "AMP Cisco Health Score field is not available"
    end

    if page.has_field?("00N7A000000Y2PA")
      select("Healthy", :from => "00N7A000000Y2PA")
      puts "value for AMP Cisco Health Status picklist is selected"
      select("Active", :from => "00N3600000JH2qB")
      puts "value for AMP Stage picklist is selected"
    else
      writeFailure "AMP Stage picklist field is not available"
    end

    if page.has_field?("00N3600000JH2rJ")
      fill_in "00N3600000JH2rJ",:with => "10"
      puts "NOS SREV Health Score is entered"
    else
      writeFailure "NOS SREV Health Score field is not available"
    end

    if page.has_field?("00N3600000JH2rO")
      fill_in "00N3600000JH2rO",:with => "10"
      puts "NOS Cisco Health Score is entered"
    else
      writeFailure "NOS Cisco Health Score field is not available"
    end

    if page.has_field?("00N3600000JH42N_unselected")
      page.find_by_id('00N3600000JH42N_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH42N_right_arrow").click
      sleep 2
      puts "value for NOS Inhibitors multi picklist is selected"
    else
      writeFailure "NOS Inhibitors multi picklist is not available"
    end

    if page.has_field?("00N3600000JH42S_unselected")
      page.find_by_id('00N3600000JH42S_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH42S_right_arrow").click
      sleep 2
      puts "value for NOS Achieved Outcomes multi picklist is selected"
    else
      writeFailure "NOS Achieved Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH42X_unselected")
      page.find_by_id('00N3600000JH42X_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH42X_right_arrow").click
      sleep 2
      puts "value for NOS Desired Outcomes multi picklist is selected"
    else
      writeFailure "NOS Desired Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH43u_unselected")
      page.find_by_id('00N3600000JH43u_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH43u_right_arrow").click
      puts "value for NOS Features multi picklist is selected"
    else
      writeFailure "NOS Features multi picklist is not available"
    end

    if page.has_field?("00N3600000JH4WX")
      select("Competitive Service Loss", :from => "00N3600000JH4WX")
      puts "value for NOS At Risk Reason picklist is selected"
    else
      writeFailure "NOS At Risk Reason picklist is not available"
    end

    if page.has_field?("00N3600000JH4yM")
      select("Very Likely to Renew", :from => "00N3600000JH4yM")
      puts "value for NOS Customer Sentiment picklist is selected"
    else
      writeFailure "NOS Customer Sentiment picklist field is not available"
    end

    if page.has_field?("00N3600000JH4yb")
      select("Healthy", :from => "00N3600000JH4yb")
      puts "value for NOS SREV Health Status picklist is selected"
    else
      writeFailure "NOS SREV Health Status picklist is not available"
    end

    if page.has_field?("00N3600000JH4yl")
      fill_in "00N3600000JH4yl",:with => "7/27/2016"
      puts "NOS Last Health Status is entered"
    else
      writeFailure "NOS Last Health Status field is not available"
    end

    if page.has_field?("00N7A000000Y2Ov")
      select("Healthy", :from => "00N7A000000Y2Ov")
      puts "value for NOS Cisco Health Status picklist is selected"
    else
      writeFailure "NOS Cisco Health Status picklist field is not available"
    end

    if page.has_field?("00N3600000JH4zt")
      select("Active", :from => "00N3600000JH4zt")
      puts "value for NOS Stage picklist is selected"
    else
      writeFailure "NOS Stage picklist field is not available"
    end

    if page.has_field?("00N3600000JH51G")
      fill_in "00N3600000JH51G",:with => "10"
      puts "Collab ELA SREV Health Score is entered"
    else
      writeFailure "Collab ELA SREV Health Score is not available"
    end

    if page.has_field?("00N3600000JH51a")
      fill_in "00N3600000JH51a",:with => "10"
      puts "Collab ELA Cisco Health Score is entered"
    else
      writeFailure "Collab ELA Cisco Health Score is not available"
    end

    if page.has_field?("00N3600000JH5xo_unselected")
      page.find_by_id('00N3600000JH5xo_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH5xo_right_arrow").click
      sleep 2
      puts "value for Collab ELA Inhibitors multi picklist is selected"
    else
      writeFailure "Collab ELA Inhibitors multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH60Y_unselected")
      page.find_by_id('00N3600000JH60Y_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH60Y_right_arrow").click
      sleep 2
      puts "value for Collab ELA Achieved Outcomes multi picklist is selected"
    else
      writeFailure "Collab ELA Achieved Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH6Yp_unselected")
      page.find_by_id('00N3600000JH6Yp_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH6Yp_right_arrow").click
      sleep 2
      puts "value for Collab ELA Desired Outcomes multi picklist is selected"
    else
      writeFailure "value for Collab ELA Desired Outcomes multi picklist field is not available"
    end

    if page.has_field?("00N3600000JH6vF_unselected")
      page.find_by_id('00N3600000JH6vF_unselected').find("option[value='1']").select_option
      sleep 2
      find(:id, "00N3600000JH6vF_right_arrow").click
      sleep 2
      puts "value for Collab ELA Features multi picklist is selected"
    else
      writeFailure "Collab ELA Features multi picklist field is not available"
    end

    if page.has_field?("00N3600000JHxf5")
      select("Very Likely to Renew", :from => "00N3600000JHxf5")
      puts "value for Collab ELA Customer Sentiment picklist is selected"
    else
      writeFailure "Collab ELA Customer Sentiment picklist field is not available"
    end

    if page.has_field?("00N3600000JHyQG")
      select("Healthy", :from => "00N3600000JHyQG")
      puts "value for Collab ELA SREV Health Status picklist is selected"
    else
      writeFailure "Collab ELA SREV Health Status picklist field is not available"
    end

    if page.has_field?("00N3600000JHz3S")
      fill_in "00N3600000JHz3S",:with => "7/27/2016"
      puts "Collab ELA Last Health Status is entered"
    else
      writeFailure "Collab ELA Last Health Status field is not available"
    end

    if page.has_field?("00N3600000JH721")
      select("Competitive Service Loss", :from => "00N3600000JH721")
      puts "value for Collab ELA At Risk Reason picklist is selected"
    else
      writeFailure "Collab ELA At Risk Reason picklist field is not available"
    end

    if page.has_field?("00N7A000000Y2PP")
      select("Healthy", :from => "00N7A000000Y2PP")
      puts "value for Collab ELA Cisco Health Status picklist is selected"
    else

      writeFailure "ollab ELA Cisco Health Status picklist field is not available"
    end

    if page.has_field?("00N7A000000YUKS")
      select("Tier 1", :from => "00N7A000000YUKS")
      puts "value for SNTC Engagement Tier picklist is selected"
    else

      writeFailure "SNTC Engagement Tier picklist field is not available"
    end

    if page.has_field?("00N7A000000YUKX")
      select("Tier 1", :from => "00N7A000000YUKX")
      puts "value for AMP Engagement Tier picklist is selected"
    else

      writeFailure "AMP Engagement Tier picklist field is not available"
    end

    if page.has_field?("00N7A000000YUKc")
      select("Tier 1", :from => "00N7A000000YUKc")
      puts "value for Collab ELA Engagement Tier picklist is selected"
    else

      writeFailure "Collab ELA Engagement Tier field is not available"
    end
  end
end

Then(/^I fill all mandantory fields to create a contact "([^"]*)"$/) do |value|
     randomvalue=('aaaaa'..'zzzzz').to_a.sample
  contactvalue = value + randomvalue
  fill_in("Last Name", :with => contactvalue)
  sleep 5
  #to select a account from look field
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='con4_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  select("Client", :from => "Type")
  sleep 5
end

#contact
Then(/^I should see type picklist under contact information$/) do
  if page.has_select?("Type", :selected => "--None--")
    puts "type picklist is visible"
  else
    fail(ArgumentError.new('type pick list not visible under contact information'))
  end
end

Then(/^I should see verify type picklist values under contact information$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000D0q65']").all('option').collect(&:text)
  puts "actual values = #{actualvalues}"
  expectedvalues = ["--None--","Client", "Distributor", "End User", "Reseller"]
  puts "expectedvalues =  #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in type picklist"
  else
    fail(ArgumentError.new('expected values are not visible in type picklist'))
  end
end

Then(/^I should not see type picklist under contact information$/) do
  if page.has_select?("Type", :selected => "--None--")
    fail(ArgumentError.new('type pick list is visible under contact information'))
  else
    puts "type pick list not visible"
  end
end

Then(/^I see the role picklist and there values under contact information row$/) do
  if page.has_select?("Role", :selected => "--None--")
    actualvalues =find(:xpath,"//*[@id='00N3600000D0q62']").all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Account Manager", "Account Team", "BDM", "CSM","CuSM","Delivery Manager","Engineer","EPM","NCE","Project Manager","PSDM","PSM","PSS","SOM","Other"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues == expectedvalues
      puts "expected values are visible in role picklist"
    else
      fail(ArgumentError.new('expected values are not visible in role picklist'))
    end
  else
    fail(ArgumentError.new('role picklist is not visible'))
  end
end
