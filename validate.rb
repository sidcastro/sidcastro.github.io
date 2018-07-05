#!/usr/bin/env ruby

require 'w3c_validators'

dir = File.expand_path(File.dirname(__FILE__));
RED = "\e[31m"
GREEN = "\e[32m"
BLUE = "\e[34m"
CLEAR = "\e[0m"

Dir.glob(File.join(dir, '*.html')).each do |file|
  begin
    results = ::W3CValidators::MarkupValidator.new.validate_file(file)
  rescue Net::HTTPFatalError
    begin
      results = ::W3CValidators::MarkupValidator.new.validate_file(file)
    rescue Net::HTTPFatalError
      begin
        results = ::W3CValidators::MarkupValidator.new.validate_file(file)
      rescue Net::HTTPFatalError
        # puts "#{set_color('HTTP ERROR', :red)}: #{file}"
        puts "#{RED}HTTP ERROR: #{file}#{CLEAR}"
        next
      end
    end
  end
  if results.errors.empty?
    # puts "#{set_color('PASSED', :green)}: #{file}"
    puts "#{GREEN}PASSED: #{file}#{CLEAR}"
  else
    # puts "#{set_color('FAILED', :red)}: #{file}"
    puts "#{RED}FAILED: #{file}"
    results.errors.each do |e|
      desc = e.message.gsub(%r{\s+}, ' ').strip
      # say(desc, :blue)
      puts "#{RED}#{desc}: #{file}#{CLEAR}"
    end
  end
end