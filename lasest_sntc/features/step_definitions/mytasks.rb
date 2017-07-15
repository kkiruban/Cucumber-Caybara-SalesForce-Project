#mytasks
When(/^I fill mandatory fields to create a new task with record type task health check$/) do
  fill_in "Comments",:with => "testing"
  $healthcheck="smoke-test-Health-check" + Random.new.rand(0001..10000).to_s
  puts $healthcheck
  fill_in "Subject",:with => $healthcheck
  select("Not Started", :from => 'Status')
  select("SNTC", :from => 'Product')
  #------------------------------------------------
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='whobtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  -----------------------------------------------------

  #-----------------------------------------------------
  #main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='whtbtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  --------------------------------------------------
end

When(/^I fill mandatory fields to create a new task with record type task lead$/) do
  fill_in "Comments",:with => "testing"
  fill_in "SREV Amount",:with => "500"
  $leadid =Random.new.rand(0001..10000).to_s
  fill_in "Lead ID",:with => $leadid
  $leadsubject="smoke-test-task-lead-" + Random.new.rand(0001..10000).to_s
  puts $leadsubject
  fill_in "Subject",:with => $leadsubject
  select("Not Started", :from => 'Status')
  select("SNTC", :from => 'Product')
  select("LDoS", :from => '00N3600000KNeSP')


  #------------------------------------------------
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='whobtn']/img").click
  sleep 4
 page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  -----------------------------------------------------

  #-----------------------------------------------------
  #main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='whtbtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
   sleep 5
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  --------------------------------------------------
end

When(/^I fill mandatory fields to create a new task with record type task standard$/) do
  fill_in "Comments",:with => "testing"
  $standard="smoke-test-standard" + Random.new.rand(0001..10000).to_s
  puts $standard
  fill_in "Subject",:with => $standard
  select("Not Started", :from => 'Status')
  select("SNTC", :from => 'Product')
  #------------------------------------------------
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='whobtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  #lksrch
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  -----------------------------------------------------

  #-----------------------------------------------------
  #main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='whtbtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 5
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  --------------------------------------------------
end


Then(/^I get the url$/) do
  url = URI.parse(current_url)
  puts url
  #  https://cs44.salesforce.com/0017A00000Hb2zi

  getid= url[30-44]
end

When(/^I fill mandatory fields to create a new task with record type task phone calls$/) do
  fill_in "Comments",:with => "testing"
  $phonecalls="smoke-test-PhoneCalls" + Random.new.rand(0001..10000).to_s
  puts $phonecalls
  fill_in "Subject",:with => $phonecalls
  select("Not Started", :from => 'Status')
  select("SNTC", :from => 'Product')
  select("Incoming", :from => 'Direction')

  #------------------------------------------------
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='whobtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  #lksrch
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #  -----------------------------------------------------

  #-----------------------------------------------------
  #main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='whtbtn']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 5
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I click on task health check just created$/) do
  if page.has_link?("View More")
    find(:xpath,"//a[contains(text(),'View More')]").click
    sleep 5
    click_on $healthcheck
    sleep 5
  else
    sleep 5
    click_on $healthcheck
    sleep 5
  end
end

When(/^I click on task lead just created$/) do
  if page.has_link?("View More")
    find(:xpath,"//a[contains(text(),'View More')]").click
    sleep 5
    click_on $leadsubject
    sleep 5
  else
    sleep 5
    click_on $leadsubject
    sleep 5
  end
end

When(/^I click on task standard just created$/) do
  if page.has_link?("View More")
    find(:xpath,"//a[contains(text(),'View More')]").click
    sleep 5
    click_on $standard
    sleep 5
  else
    sleep 5
    click_on $standard
    sleep 5
  end
end

When(/^I get account name just created$/) do
  $getaccountname = find(:xpath,".//*[@id='contactHeaderRow']/div[2]/h2").text
  puts $getaccountname
end

When(/^I click on task phone calls just created$/) do
  if page.has_link?("View More")
    find(:xpath,"//a[contains(text(),'View More')]").click
    sleep 5
    click_on $phonecalls
    sleep 5
  else
    sleep 5
    click_on $phonecalls
    sleep 5
  end
end

When(/^I click on home tab$/) do
  find(:xpath,".//*[@id='home_Tab']/a").click
  sleep 5
end

When(/^I click on Save button from top row$/) do
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button,"Save").visible?
      click_on "Save"
    end
  end
end

Then(/^I should see set play outcome buttton$/) do
  if page.has_button?("Set Play Outcome")
    puts "Set Play Outcome button is visible"
  else
    fail(ArgumentError.new('Set Play Outcome button is not visible'))
  end
end

When(/^I click on existing task under my tasks section$/) do
  if page.has_link?("View More")
    find(:xpath,"//a[contains(text(),'View More')]").click
    sleep 5
    find(:xpath,"//*[@id='actionForm']/div[2]/table/tbody/tr[2]/td[3]/a").click
    sleep 2
  else
    sleep 5
    find(:xpath,"//*[@id='actionForm']/div[2]/table/tbody/tr[2]/td[3]/a").click
    sleep 2
  end
end

When(/^I login as opsmanager to approve the escalation request$/) do
  visit env
  fill_in "Username",:with => 'ciscoadopt.opsmgr@servicesource.com.sitadopt'
  fill_in "Password",:with => 'testciscoadopt123!'
  find(:id,"Login").click
  sleep 3
end
