
When(/^I select "([^"]*)" from "([^"]*)" field$/) do |value, locator|
  select(value, :from => locator)
end

Then(/^I should see following error:$/) do |string|
  page.should have_content(string)
  sleep 5
#  string.split(/\n/).each do |phrase|
#    phrase.strip!
#    page.last_response.body.should include(phrase)
#  end

end