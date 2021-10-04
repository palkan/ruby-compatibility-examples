at_exit do
  if SyntaxError === $!
    $stderr.puts "We caught it!"
    exit!(0)
  end
end

require_relative "../support/invalid_syntax"
