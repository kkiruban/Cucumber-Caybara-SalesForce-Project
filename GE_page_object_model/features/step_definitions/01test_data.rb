
# step definition to login in with a valid user credentials to zenith saleforce application
# and clicking on opportunities tab in a homepage
Given(/^I should navigate to "([^"]*)" tab in saleforce application$/) do |tab|
  sleep 10
  step 'I enter the credentials to the Zenith application'
  sleep 10
  click_link(tab)
  sleep 6
end


# To create a new opportunity
When(/^I fill required values for mandantory fields to create a new opportunity$/) do
  begin
    ymlval= getCreateNewOpportunity "createopportunitytestdata"
    within all('.pbSubsection')[0] do
      sleep 10
      randomvalue=('aaaaa'..'zzzzz').to_a.sample
      fill_in("Opportunity Name", :with=>"")
      puts "i fill the opportunity name as #{randomvalue}"
      fill_in("Opportunity Name", :with => "01_#{randomvalue}")
      select(ymlval["Direct_Channel"], :from => "Direct/Channel")
      select(ymlval["Business_Line"], :from => "Business Line")
      select(ymlval["Opportunity_Type"], :from => "Opportunity Type")
      select(ymlval["Opportunity_Currency"], :from => "Opportunity Currency")
      select(ymlval["Stage"], :from => "opp11")
    end
    # snippet to select values from ssi theatre,client territory,client region,country picklists
    within all('.pbSubsection')[1] do
      select(ymlval["SSI_Theatre"], :from => "SSI Theatre")
      select(ymlval["Client_Territory"], :from => "Client Territory")
      select(ymlval["Client_Region"], :from => "Client Region")
      select(ymlval["Country"], :from => "Country")
    end
    within all('.pbSubsection')[2] do
      table = all("tbody")[0]
      sleep 2
      find_field("Estimated Close Date").set(ymlval["Estimated_Close_Date"])
    end
    within all('.pbSubsection')[9] do
      table = all("tbody")[0]
      sleep 2
      find(:id, "opp9").set(ymlval["Close_Date"])
    end
    #    #to choose a account name
    page.driver.browser.window_handles.first
    find(:css,"#opp4_lkwgt").click
    sleep 1
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      #      #      table.click_link(ymlval["Account Name"])
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  end
end


When(/^I fill required values for mandantory fields to create a new quote$/) do
  begin
    arg = getquotedetails "create_New_quote"
    sleep 2
    within all('.pbSubsection')[0] do
      select(arg["Quote_Type"], :from => "00Nj0000006ZGKn")
      sleep 2
      select(arg["Quote_Type_Year"], :from => "00Nj0000006ZGKm")
      sleep 2
    end
    within all('.pbSubsection')[1] do
      sleep 2
      find_field("Earliest New Start Date").set(arg["Earliest_New_Start_Date"])
      sleep 2
      find_field("Latest New End Date").set(arg["Latest_New_End_Date"])
      sleep 2
      find_field("00Nj0000006ZGKp").set(arg["Transaction_Amount"])
      sleep 2
    end
    sleep 2

    page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 10
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      #      #      table.click_link(ymlval["Account Name"])
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  end
end
