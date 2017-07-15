require 'rubygems'
require 'rspec/expectations'
require 'Capybara'


def getCredentialInfo
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[ENV['UserRole']]
end

def getDetails(yamlInfo)
	yamlinput = "./features/support/test_data/OpportunityAsset.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def writeFailure(data)
  puts "<span style='color:red'>#{data}</span>"
end


def getCaseDetails(yamlInfo)
	yamlinput = "./features/support/test_data/case.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getaccountdetails(accountdetails)
  yamlinput = "./features/support/test_data/accounts.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[accountdetails]
   
end


def getquotedetails(create_New_quote)
  yamlinput = "./features/support/test_data/Quote.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[create_New_quote]
end


def getCreateNewOpportunity(createopportunitytestdata)
  yamlinput = "./features/support/test_data/opportunites.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[createopportunitytestdata]
end

def gettestdata(picklistvalues)
  yamlinput = "./features/support/test_data/opportunites.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[picklistvalues]
end


def select_option(value)
  #  option_xpath = "//*[@id='#{id}']/option[2]"
  #  option = find(:xpath, second_option_xpath).text
  select(value, :from => "opp11")
end

def getCreateNewTask(requiredtestdataformandatoryfields)
  yamlinput = "./features/support/test_data/newtask_openactivities.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[requiredtestdataformandatoryfields]
end


