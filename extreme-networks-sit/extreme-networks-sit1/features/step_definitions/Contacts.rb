

And(/^I fill the all contact required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewContactInformation'

    $contact_name = "#{arg["ContactLastName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#name_lastcon2")
      puts "Successfully see the Last Name field"
      find("#name_lastcon2").send_keys $contact_name
    else
      putstr "Failed to find the Last Name field"
    end

    if page.has_css?("#con4")
      puts "Successfully see the Account Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Account Name Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["ContactAccountName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        table=all("tbody")[0]
        table.all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Account Lookup field"
    end
    puts "Successfully fill the all contact required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the all contact required fields"
  end
end


And(/^I able to see the contact created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewContactInformation'

    unless page.has_content?(arg["NoContactsMessage"])
      result = false
      all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |contact|
        if contact.text.include? $contact_name
          puts "Successfully find the contact record: #{$contact_name}"
          contact.click
          puts "Successfully click the contact: #{$contact_name}"
          result = true
          break
        end
      end
      putstr "Failed to find the contact record: #{$contact_name}" unless result
      sleep 3
    else
      putstr "No contacts found"
    end
  rescue Exception => ex
    putstr "Error occurred while opening the contact: #{$contact_name}"
  end
end

Then(/^I able to see the "([^"]*)" created successfully$/) do |contact|
  begin
   sleep 3
   if page.has_css?(".topName")
     if find(".topName").text == $contact_name
       puts "Successfully created the #{contact}: #{$contact_name}"
     else
       putstr "Failed to created the #{contact}: #{$contact_name}"
     end
     within all(".pbSubsection")[0] do
      if find("#con2_ileinner").text == $contact_name
        puts "Successfully created the #{contact}: #{$contact_name}"
      else
        putstr "Failed to created the #{contact}: #{$contact_name}"
      end
     end
   else
     putstr "Failed to created the #{contact}: #{$contact_name}"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the created #{contact} record: #{$contact_name}"
  end
end


And(/^I verify the contact "([^"]*)" pickList field should be visible in the left column under "([^"]*)"$/) do |type, contact_details|
  begin
    sleep 2
    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")

      if page.has_xpath?("//label[text() = '#{type}']/preceding::h3[text() = '#{contact_details}']")
        puts "Successfully see the #{type} pickList field is visible in the left column under #{contact_details}"
        within all(".pbSubsection")[2] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == type
              health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
              if health_status.count > 0
                puts "#{type} pickList field is visible in the left column with edit permissions"
                result = true
                break
              else
                putstr "#{type} pickList field is visible in the left column with read only permissions"
              end
            end
          end
          putstr "Failed to see the #{type} pickList field" unless result
          sleep 3
        end
      else
        putstr "#{type} pickList field is not visible in the left column under #{contact_details}"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")

        if page.has_xpath?("//label[text() = '#{type}']/preceding::h3[text() = '#{contact_details}']")
          puts "Successfully see the #{type} pickList field is visible in the left column under #{contact_details}"
          within all(".pbSubsection")[2] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == type
                begin
                  health_status = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if health_status.count > 0
                    putstr "#{type} pickList field is visible in the left column with edit permissions"
                    result = true
                    break
                  end
                rescue
                  puts "#{type} pickList field is visible in the left column with read only permissions"
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{type} pickList field" unless result
            sleep 3
          end
        else
          putstr "#{type} pickList field is not visible in the left column under #{contact_details}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} field is visible in the left column under #{contact_details}"
  end
end


And(/^I verify the contact "([^"]*)" PickList values$/) do |type|
  begin
    sleep 3
    arg = getDetails 'ContactTypePickListValues'

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      if page.has_select?(type)
        puts "Successfully see the #{type} field"
        within all(".pbSubsection")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == type

              result = true
              if page.has_xpath?("//label[text()='#{type}']/parent::td/following-sibling::td[1]//select")
                puts "Successfully see the #{type} pickList field is visible with edit permissions"

                $contacts_pickList_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                  if $contacts_pickList_values.include?arg["ContactTypeClient"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeClient"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeClient"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeDistributor"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeDistributor"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeDistributor"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeEndUser"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeEndUser"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeEndUser"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeReseller"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeReseller"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeReseller"]}"
                  end

                  break
              else
                putstr "Contact #{type} pickList field is not visible with read only permissions"
              end
            end
          end
          putstr "Failed to see the #{type} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{type} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_select?(type)
          puts "Successfully see the #{type} field"
          within all(".pbSubsection")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == type

                result = true
                if page.has_xpath?("//label[text()='#{type}']/parent::td/following-sibling::td[1]//select")
                    putstr "#{type} pickList field is visible with edit permissions"

                  $contacts_pickList_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)


                  if $contacts_pickList_values.include?arg["ContactTypeClient"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeClient"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeClient"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeDistributor"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeDistributor"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeDistributor"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeEndUser"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeEndUser"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeEndUser"]}"
                  end

                  if $contacts_pickList_values.include?arg["ContactTypeReseller"]
                    puts "Successfully see the #{type} pickList value: #{arg["ContactTypeReseller"]}"
                  else
                    putstr "Failed to see the #{type} pickList value: #{arg["ContactTypeReseller"]}"
                  end

                  break
                else
                  puts "Contact #{type} pickList field is not visible with read only permissions"
                end
              end
            end
            putstr "Failed to see the #{type} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{type} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the from #{type} pickList values"
  end
end


And(/^I verify "([^"]*)" PickList field should be editable for all excepts SalesOps$/) do |type|
  begin
    sleep 3

    if (ENV['UserRole'] == "OperationManagerSit") || (ENV['UserRole'] == "OperationRepSit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "SalesManagerSit") || (ENV['UserRole'] == "SalesRepSit")
      if page.has_select?(type)
        puts "Successfully see the #{type} field"
        within all(".detailList")[0] do
          tr = first("tbody").all("tr")
          sleep 3
          tr.each do |row|
            if row.all("td")[0].text == type
              if page.has_xpath?("//label[text()='#{type}']/parent::td/following-sibling::td[1]//select")
                contacts_pickList_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                if contacts_pickList_values.count > 0
                  puts "Contact #{type} pickList field is visible in the left column with editable permissions"
                  break
                else
                  putstr "Contact #{type} pickList field is visible in the left column with read only permissions"
                end
              else
                putstr "Contact #{type} pickList field is visible in the left column with read only permissions"
              end
            end
          end
        end
      else
        putstr "Failed to see the #{type} field"
      end
    else
      if (ENV['UserRole'] == "SalesOperationSit")
        if page.has_select?(type)
          puts "Successfully see the #{type} field"
          within all(".detailList")[0] do
            tr = first("tbody").all("tr")
            sleep 3
            tr.each do |row|
              if row.all("td")[0].text == type
                if page.has_xpath?("//label[text()='#{type}']/parent::td/following-sibling::td[1]//select")
                  contacts_pickList_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if contacts_pickList_values.count > 0
                    putstr "Contact #{type} pickList field is visible in the left column with editable permissions"
                    break
                  else
                    puts "Contact #{type} pickList field is visible in the left column with read only permissions"
                  end
                else
                  puts "Contact #{type} pickList field is visible in the left column with read only permissions"
                end
              end
            end
          end
        else
          putstr "Failed to see the #{type} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{type} pickList field is editable permissions"
  end
end
