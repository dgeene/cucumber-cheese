When(/^I open my shows xml$/) do
    the_file = File.open('../shows.xml')
    @xml_doc = Nokogiri::XML(the_file)
    the_file.close
    puts @xml_doc
end

Then(/^I should see (\d+) sitcoms$/) do |num_sitcoms|
    sitcoms = @xml_doc.xpath('//sitcom')
    expect(sitcoms.length).to eql num_sitcoms.to_i
end

Then(/^I should see (\d+) drama$/) do |num_dramas|
    dramas = @xml_doc.xpath('//dramas')
    expect(dramas.length).to eql num_dramas.to_i
end
