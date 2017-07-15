When(/^I click on any existing success plan playbook$/) do
  within all('.pbBody')[0] do
    table = all("tbody")[0]
    success_plan_blaybook = table.all('tr')[1].all('th')[0].find('a').text
    puts success_plan_blaybook
    table.all('tr')[1].all('th')[0].find('a').click
    puts "clicked on existing success plan playbook"
  end
end