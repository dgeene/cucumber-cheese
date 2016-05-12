require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'

include AdoptionHelper

@browser = Watir::Browser.new :chrome



@browser.goto 'http://puppies.herokuapp.com'
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
checkout_with('Cheezy', '123 Main St', 'cheezy@foo.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'

