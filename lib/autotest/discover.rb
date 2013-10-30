if File.directory?('features')
  if ENV.has_key?('AUTOFEATURE')
    Autotest.add_discovery {"cucumber"} if (ENV['AUTOFEATURE'] =~ /true/i)
  else
    help_message = 
%q{Not running features.
To run features in autotest, set AUTOFEATURE=true.
To remove this message, set AUTOFEATURE=false.}
    puts help_message
  end
end
