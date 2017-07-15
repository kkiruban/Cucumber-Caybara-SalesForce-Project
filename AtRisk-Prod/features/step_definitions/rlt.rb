
Then(/^I should not see ssi sub result reason field$/) do
  if page.has_content?("SSI Sub Result Reason")
    writeFailure  "SSI Sub Result Reason field is visible"
  else
    puts "SSI Sub Result Reason field is not visible"
  end
end

When(/^I double click on batch type field and verify values$/) do
 element = page.find(:xpath,".//*[@id='00N3600000PVaJx_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
end

When(/^I double click on Renewal Status field and verify values$/) do
  element = page.find(:xpath,".//*[@id='00N3600000PVaJx_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
end
