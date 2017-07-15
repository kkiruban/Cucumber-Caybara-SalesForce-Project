# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"

When(/^I press "(.*?)" link$/) do |link|
  @mybrowser.a(:xpath,"//a[contains(text(),'#{link}')]").click()
end


When(/^I should get the current url$/) do
  puts @mybrowser.url
end

When(/^I switch to newly opened window and url should match "(.*?)"$/) do |matchurl|
  @mybrowser.windows.last.use do
    puts @mybrowser.url
    puts @mybrowser.url == matchurl
  end
end

When(/^I switch to iframe and fill a search value as "(.*?)"$/) do |searchvalue|
  @mybrowser.frame(:id, "iframe").text_field(:name, "search").when_present.set searchvalue
end