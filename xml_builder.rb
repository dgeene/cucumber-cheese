require 'builder'

builder = Builder::XmlMarkup.new
xml = builder.person do |p|
    p.name = 'Cheezy'
    p.phone = '555-1234'
end
