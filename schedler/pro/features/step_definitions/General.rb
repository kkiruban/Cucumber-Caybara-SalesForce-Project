
Given(/^I login to the "([^"]*)" application$/) do |application|
  begin
    visit env
    sleep 8
    arg = getCredentialInfo
    fill_in "Username",:with => arg["Username"]
    fill_in "Password",:with => arg["Password"]
    sleep 5
    find(:id,"Login").click
    sleep 3
    puts "Logged in successfully"
    sleep 3
  rescue Exception => ex
    raise "Error occurred while entering #{application} user credentials"
  end
end


Then(/^I able to see the logged in to "([^"]*)" application$/) do |app|
  sleep 2
  if page.has_css?("#userNav")
    puts "Successfully logged in to #{app} application"
  else
    raise "Failed to logged in to #{app} application"
  end
end


When(/^I click on the "([^"]*)" tab$/) do |tab|
  begin
    sleep 5
    first(:link, tab).click
    sleep 10
    puts "Successfully navigated to #{tab} tab"
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end


And(/^I click on the "([^"]*)" button$/) do |button_text|
  begin
    sleep 3
    if page.has_button?(button_text)
      click_on button_text
      sleep 2
      puts "Successfully click the #{button_text} button"
    else
      putstr "Failed to see the #{button_text} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
  end
end




When(/^I click on "([^"]*)" link from user menu$/) do |setup|
  begin
    sleep 2
    find("#userNavButton").click
    sleep 2
    within("#userNav-menuItems") do
      click_on setup
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{setup} link"
  end
end


Then(/^I able to see the "([^"]*)" home page$/) do |name|
  begin
    sleep 2
    if page.has_content? name
      puts "Successfully see the the #{name} page"
    else
      raise "Failed to see the #{name} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} page"
  end
end


Then(/^I able to see the "([^"]*)" page$/) do |content|
  begin
    sleep 2
    if page.has_content? content
      puts "Successfully see the the #{content} page"
    else
      raise "Failed to see the #{content} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} page"
  end
end

When(/^I click on "([^"]*)" link$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
      click_on name
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{name} link"
  end
end


Then(/^I able to see the "([^"]*)" name$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} link"
  end
end


Then(/^I following "([^"]*)" details should be visible:$/) do |business_hours, text|
  begin
    sleep 3
    if page.has_content? text
      puts "Successfully see the the #{business_hours} name"
    else
      raise "Failed to see the #{business_hours} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{business_hours} name"
  end
end


And(/^I verify users profile$/) do
  begin
    sleep 3
    within(".listElementBottomNav") do
      find(".listItemSelected.listItemLast").click
      puts "Successfully navigate to the all pagination page"
    end
    sleep 2
    within(".list") do
      if first("tbody").all(".dataRow").count > 0
        tr = first("tbody").all(".dataRow")
        $full_name = []
        sleep 3
        tr.each do |row|
          $full_name << row.first("th").first("a").text
        end
        sleep 2
        users_actions = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[1]/input')
        users_alias = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[2]/a')
        user_name = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[3]/a')
        user_role = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[5]/a')
        user_profile = all(:xpath, '//div[5]/div/form/div[2]/table/tbody/tr/td[6]/a')
        $active_users = []
        sleep 3
        users_actions.each_with_index do |product , i|
          $active_users << {
              'users_actions' => users_actions[i],
              'users_alias' => users_alias[i].text,
              'user_name' => user_name[i].text,
              'user_role' => user_role[i],
              'user_profile' => user_profile[i].text,
          }
        end
        $active_users
      else
        putstr "Failed to see the all users"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while reading the users information"
  end
end


And(/^I "([^"]*)" should match "([^"]*)" tab in config guid$/) do |user_profile, users|
  begin
    sleep 5
    counter = 0
    arg = getGeneralDetails 'AdminUsers'
    excel = WIN32OLE.new('Excel.Application')
    excel.visible = true
    dir_path = Dir.pwd.gsub('/','\\')
    file_path = "#{dir_path}#{arg["File_Path"]}"
    puts file_path

    workbook = excel.Workbooks.Open(file_path)
    worksheet = workbook.WorkSheets(arg["SheetName"])
    worksheet.select

    i = arg["Start_Row"]
    Capybara.default_max_wait_time = 5


    for counter in i..worksheet.UsedRange.Rows.Count

      lastName=arg["LastName"]+i.to_s
      lastName=worksheet.Range(lastName).Value

      if lastName.nil?
        putstr "Last Name is not found under cell: #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=worksheet.Range(firstName).Value

      if firstName.nil?
        putstr "First Name is not found under cell: #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=worksheet.Range(userName).Value

      if userName.nil?
        putstr "User Name is not found under cell: #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      persona=arg["Persona"]+i.to_s
      persona=worksheet.Range(persona).Value

      if persona.nil? == false
        persona=persona.strip
      end

      # if persona=="Sales Rep"
      #   persona="WW Exec"
      # end

      profile=arg["Profile"]+i.to_s
      profile=worksheet.Range(profile).Value

      if profile.nil?
        putstr "Profile is not found under cell: #{arg["Profile"]+i.to_s}"
      else
        profile=profile.strip
      end

      excel_full_name = "#{lastName}, #{firstName}"

      # excel_full_name = lastName+", "+firstName

      if $full_name.include? excel_full_name
        puts "Successfully see the Full Name: #{excel_full_name}"
      else
        putstr "Failed to see the Full Name: #{excel_full_name}"
      end

      user_name = "#{userName}#{arg["UserRefer"]}"

      result = false
      $active_users.each do |product|
        if product['user_name'] == user_name
          result = true
          puts "Successfully see the User Name: #{user_name}"
          unless profile.nil?
            if product['profile'] == profile
              puts "Successfully see the User Profile: #{profile}"
            else
              putstr "Failed to see the User Profile: #{profile}"
            end
          else
            putstr "User Profile is not found under cell: #{arg["Profile"]+i.to_s}"
          end
         end
       end
       putstr "Failed to see the User Name: #{user_name}" unless result
       sleep 3

      i=i+1
    end
    excel.Quit();
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying #{user_profile} the #{users} config data"
  end
end


Then(/^I able to see the "([^"]*)" section$/) do |section|
  begin
    sleep 2
    if page.has_content? section
      puts "Successfully see the the #{section} section"
    else
      raise "Failed to see the #{section} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{section} section"
  end
end


And(/^I user should see "([^"]*)" as based currency$/) do |currency|
  begin
    sleep 2
    if page.has_content? currency
      puts "Successfully see the the #{currency} code"
      within(".list") do
       if first("tbody").all(".dataRow").count > 0
        tr = first("tbody").all(".dataRow")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("th")[0].text == currency
            result = true
            if row.all("td")[2].first("img")[:title] == "Checked"
               puts "Successfully see the #{currency} as based currency"
            else
               putstr "Failed to see the #{currency} as based currency"
            end
          end
        end
        putstr "Failed to find the #{currency} code" unless result
      else
        raise "No #{currency} codes are available"
      end
     end
    else
      raise "Failed to see the #{currency} code"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{currency} as based currency"
  end
end


And(/^"([^"]*)" is listed as the other currency with the exchange rate of "([^"]*)"$/) do |currency, conversion_rate|
  begin
    sleep 2
    within(".list") do
     if first("tbody").all(".dataRow").count > 0
        tr = first("tbody").all(".dataRow")
        sleep 3
        result = false
        tr.each do |row|
          if row.first("th").text == currency
            result = true
            if row.all("td")[3].text == conversion_rate
              puts "Successfully see the #{currency} with the exchange rate of #{conversion_rate}"
            else
              putstr "Failed to see the #{currency} with the exchange rate of #{conversion_rate}"
            end
          end
        end
        putstr "Failed to find the #{currency} code" unless result
     else
       raise "No #{currency} codes are available"
     end
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{currency} with the exchange rate of #{conversion_rate}"
  end
end

When(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |name, currency|
  begin
    sleep 3
    if page.has_button? name
      puts "Successfully see the #{name} button"
      find(:xpath,"//input[@title='#{name}']").click
      sleep 2
      puts "Successfully click the #{name} button"
    else
      putstr "Failed to see the #{name} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{name} button from #{currency} page"
  end
end

Then(/^I able to see fiscal calendar should shows:$/) do |text|
  begin
    sleep 3
    if page.has_content? text
      puts "Successfully see the the fiscal calendar"
    else
      raise "Failed to see the fiscal calendar"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the fiscal calendar"
  end
end

