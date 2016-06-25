require 'rspec'
require 'page-object'
require 'faker' # this gem can provide random data
require 'data_magic'
require 'require_all'
require 'nokogiri'
require 'builder'

require_all 'lib' # require_all method includes all files in dir

World(PageObject::PageFactory)

