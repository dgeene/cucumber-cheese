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



Given(/^I have a phone book$/) do |table|
    # table is a Cucumber::Core::Ast::DataTable
    builder = Builder::XmlMarkup.new
    @xml = builder.contacts do |contacts|
        table.hashes.each do |row|
            contacts.contact do |contact|
                contact.name row['name']
                contact.phone row['phone']
            end
        end
    end

    puts @xml
end

When(/^I look up the phone number for "([^"]*)"$/) do |name|
    doc = Nokogiri::XML(@xml)
    contacts = doc.xpath('//contact')
    @node = contacts.find { |row| row.content.include? name }
end

Then(/^I should see the phone number "([^"]*)"$/) do |phone_number|
    expect(@node.at_xpath('.//phone').content).to eql phone_number
end
