res = `ruby -r #{File.join(__dir__, '../support/at_exit_typo_hook.rb')} #{File.join(__dir__, '../support/typo.rb')} 1 foo`.chomp
raise "Assertion failed: #{res}" unless res.include?('"1, foo"') && !res.include?("SyntaxError")

