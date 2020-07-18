require 'stringio'

stderr = StringIO.new

orig_stderr, $stderr = $stderr, stderr

at_exit do
  $stderr = orig_stderr

  puts "AT EXIT EXCEPTION: #{$!}"

  if SyntaxError === $!
    puts "FAILED FILE: #{$0}"

    contents = File.read($0)
    contents.gsub!(/^.*:delete$/, "")
    eval(contents)

    exit!(0)
  end
end
