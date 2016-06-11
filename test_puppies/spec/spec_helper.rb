# This configuration is for running rspec tests
# it is like cucumber's hooks.rb
# We don't need cucumber to run rspec tests. That's why
# our page objects have been moved to lib/

require 'rspec'
require 'page-object'
require 'data_magic'
require 'require_all'

require_all 'lib'

# page 112
RSpec.configure do |config|
    config.include PageObject::PageFactory

    config.before do
        @browser = Watir::Browser.new :chrome
    end

    config.after do
        @browser.close
    end
end
