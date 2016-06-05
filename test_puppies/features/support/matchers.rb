
# pages 98-99
RSpec::Matchers.define :have_error_message do |message|
    match do |page| # the |page| block here is @current_page passed in from a step def
        # note we cant use matchers within matchers
        page.error_messages.include? message
    end


    # we can define custom messages
    failure_message do |page|
        "Expected '#{page.error_messages}' to include '#{message}'"
    end

    failure_message_when_negated do |page|
        "Expected '#{page.error_messages}' to not include '#{message}'"
    end
end
