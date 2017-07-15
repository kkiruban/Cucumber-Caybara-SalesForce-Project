

When(/^I select "([^"]*)" from product field picklist under task information$/) do |value|
  select(value, :from => 'Product')
end

When(/^I enter comments and subject under task details$/) do
  fill_in "Comments",:with => "testing"
  $healthcheck="Health-check" + Random.new.rand(0001..10000).to_s
  puts $healthcheck
  fill_in "Subject",:with => $healthcheck
end

When(/^I choose contact name under task information$/) do
  #to choose name
  #  main = page.driver.browser.window_handles.first
  #  find(:xpath,".//*[@id='whobtn']/img").click
  #  sleep 1
  #  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  #  lookup = page.driver.browser.window_handles.last
  #  page.driver.browser.switch_to.frame("resultsFrame")
  #  within('.pbBody') do
  #    table=all("tbody")[0]
  #    table.all('tr')[1].all('th')[0].find('a').click
  #  end
  #  page.driver.browser.switch_to.window(main)
  #  sleep 10
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='whobtn']/img").click
  sleep 1
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
end

When(/^I create a random account$/) do
  sleep 10
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 2
  find(:xpath,"//a[@class='listRelatedObject accountBlock title']").click
  sleep 5
  find(:xpath,"//input[@name='new']").click
  sleep 2
  $randomaccount = "smoke-testing-account-" + Random.new.rand(0001..10000).to_s
  fill_in("Name", :with => $randomaccount)
  sleep 2
  select("NALA", :from => "00N3600000EeE7h")
  sleep 2
  fill_in "Client Company ID",:with => "01"
  puts "Client Company ID is entered"

  select("APAC", :from => "00N3600000EeE7h")
  puts "value for Client Theatre picklist is selected"

  fill_in "00N3600000JH0Zp",:with => "10"
  puts "SNTC SREV Health Score is entered"

  fill_in "00N3600000JH0dr",:with => "10"
  puts "SNTC Cisco Health Score is entered"
  sleep 2

  page.find_by_id('00N3600000JH1SQ_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH1SQ_right_arrow").click
  sleep 2
  puts "value for SNTC Inhibitors multi picklist is selected"

  page.find_by_id('00N3600000JH1Sa_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH1Sa_right_arrow").click
  puts "value for SNTC Achieved Outcomes multi picklist is selected"
  sleep 2

  page.find_by_id('00N3600000JH1Zv_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH1Zv_right_arrow").click
  puts "value for SNTC Desired Outcomes multi picklist is selected"
  sleep 2

  page.find_by_id('00N3600000JH2IO_unselected').find("option[value='1']").select_option
  sleep 5
  find(:id, "00N3600000JH2IO_right_arrow").click
  puts "value for SNTC Features multi picklist is selected"
  sleep 2

  select("Competitive Service Loss", :from => "00N3600000JH2iR")
  puts "value for SNTC At Risk Reason picklist is selected"

  select("Very Likely to Renew", :from => "00N3600000JH2q6")
  puts "value for SNTC Customer Sentiment picklist is selected"

  select("Healthy", :from => "00N3600000GvtnL")
  puts "value for SNTC SREV Health Status picklist is selected"

  fill_in "00N3600000JH2qf",:with => "7/27/2016"
  puts "SNTC Last Health Status is entered"

  select("Healthy", :from => "00N3600000GvtnJ")
  puts "value for SNTC Cisco Health Status picklist is selected"

  select("Active", :from => "00N3600000JH2qz")
  puts "value for SNTC Stage picklist is selected"

  fill_in "00N3600000JH2qu",:with => "7/27/2016"
  puts "AMP Last Health Status is entered"

  select("Healthy", :from => "00N3600000GvtnD")
  puts "value for AMP SREV Health Status picklist is selected"

  select("Very Likely to Renew", :from => "00N3600000JH42D")
  puts "value for AMP Customer Sentiment picklist is selected"

  select("Competitive Service Loss", :from => "00N3600000JH42I")
  puts "value for AMP At Risk Reason picklist is selected"

  page.find_by_id('00N3600000JH43p_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH43p_right_arrow").click
  sleep 2
  puts "value for AMP Features multi picklist is selected"

  page.find_by_id('00N3600000JH5zV_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH5zV_right_arrow").click
  sleep 2
  puts "value for AMP Achieved Outcomes multi picklist is selected"

  page.find_by_id('00N3600000JH4yg_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH4yg_right_arrow").click
  sleep 2
  puts "value for AMP Desired Outcomes multi picklist is selected"

  fill_in "00N3600000JH9QA",:with => "10"
  puts "AMP SREV Health Score is entered"

  page.find_by_id('00N3600000JH700_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH700_right_arrow").click
  sleep 2
  puts "value for AMP Inhibitors multi picklist is selected"

  fill_in "00N3600000JH9QP",:with => "10"
  puts "AMP Cisco Health Score is entered"

  select("Healthy", :from => "00N3600000GvtnB")
  puts "value for AMP Cisco Health Status picklist is selected"


  select("Active", :from => "00N3600000JH2qB")
  puts "value for AMP Stage picklist is selected"

  fill_in "00N3600000JH2rJ",:with => "10"
  puts "NOS SREV Health Score is entered"

  fill_in "00N3600000JH2rO",:with => "10"
  puts "NOS Cisco Health Score is entered"

  page.find_by_id('00N3600000JH42N_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH42N_right_arrow").click
  sleep 2
  puts "value for NOS Inhibitors multi picklist is selected"

  page.find_by_id('00N3600000JH42S_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH42S_right_arrow").click
  sleep 2
  puts "value for NOS Achieved Outcomes multi picklist is selected"

  page.find_by_id('00N3600000JH42X_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH42X_right_arrow").click
  sleep 2
  puts "value for NOS Desired Outcomes multi picklist is selected"

  page.find_by_id('00N3600000JH43u_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH43u_right_arrow").click
  puts "value for NOS Features multi picklist is selected"

  select("Competitive Service Loss", :from => "00N3600000JH4WX")
  puts "value for NOS At Risk Reason picklist is selected"

  select("Very Likely to Renew", :from => "00N3600000JH4yM")
  puts "value for NOS Customer Sentiment picklist is selected"

  select("Healthy", :from => "00N3600000GvtnI")
  puts "value for NOS SREV Health Status picklist is selected"

  fill_in "00N3600000JH4yl",:with => "7/27/2016"
  puts "NOS Last Health Status is entered"

  select("Healthy", :from => "00N3600000GvtnH")
  puts "value for NOS Cisco Health Status picklist is selected"

  select("Active", :from => "00N3600000JH4zt")
  puts "value for NOS Stage picklist is selected"

  fill_in "00N3600000JH51G",:with => "10"
  puts "Collab ELA SREV Health Score is entered"

  fill_in "00N3600000JH51a",:with => "10"
  puts "Collab ELA Cisco Health Score is entered"

  page.find_by_id('00N3600000JH5xo_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH5xo_right_arrow").click
  sleep 2
  puts "value for Collab ELA Inhibitors multi picklist is selected"

  page.find_by_id('00N3600000JH60Y_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH60Y_right_arrow").click
  sleep 2
  puts "value for Collab ELA Achieved Outcomes multi picklist is selected"

  page.find_by_id('00N3600000JH6Yp_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH6Yp_right_arrow").click
  sleep 2
  puts "value for Collab ELA Desired Outcomes multi picklist is selected"

  page.find_by_id('00N3600000JH6vF_unselected').find("option[value='1']").select_option
  sleep 2
  find(:id, "00N3600000JH6vF_right_arrow").click
  sleep 2
  puts "value for Collab ELA Features multi picklist is selected"

  select("Very Likely to Renew", :from => "00N3600000JHxf5")
  puts "value for Collab ELA Customer Sentiment picklist is selected"

  select("Healthy", :from => "00N3600000GvtnG")
  puts "value for Collab ELA SREV Health Status picklist is selected"

  fill_in "00N3600000JHz3S",:with => "7/27/2016"
  puts "Collab ELA Last Health Status is entered"

  select("Competitive Service Loss", :from => "00N3600000JH721")
  puts "value for Collab ELA At Risk Reason picklist is selected"

  select("Healthy", :from => "00N3600000GvtnE")
  puts "value for Collab ELA Cisco Health Status picklist is selected"

  select("Tier 1", :from => "00N3600000GvtnK")
  puts "value for SNTC Engagement Tier picklist is selected"

  select("Tier 1", :from => "00N3600000GvtnC")
  puts "value for AMP Engagement Tier picklist is selected"

  select("Tier 1", :from => "00N3600000GvtnF")
  puts "value for Collab ELA Engagement Tier picklist is selected"
  sleep 2
  find(:xpath,"//*[@id='topButtonRow']/input[1]").click
  sleep 2
end

When(/^I get the account id that generated$/) do
  $accounturl = URI.parse(current_url)
  puts $accounturl
  #  puts url.split(//).last(15).join
  #  myString.gsub("PHP", "Ruby")
  #  $url.gsub("https://cs44.salesforce.com/","")
  #  myString.replace "Goodbye to PHP!"
  #  $url['https://cs44.salesforce.com/'] = ""
  #  puts $url
  #  a.gsub!(/[^0-9A-Za-z]/, '')
  #  $url.sub!("https://cs44.salesforce.com/","")
  #  puts $url
  #  puts $geturl
end

When(/^I get the task id that generated$/) do
  $taskurl = URI.parse(current_url)
  puts $taskurl
end

When(/^I visit task id url that generated$/) do
  visit($taskurl)
  sleep 5
end

When(/^I click on just created task$/) do
  click_link($healthcheck)
  sleep 5
end

When(/^I search and click on just created account$/) do
  visit($accounturl)
  sleep 5
end

When(/^I click on account Name from related to field$/) do
   find(:xpath,".//*[@id='tsk3_ilecell']/div/a").click
   sleep 5
end
