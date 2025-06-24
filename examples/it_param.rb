begin
  eval("proc { it }")
rescue SyntaxError
  return
end

begin
  eval("proc { |x| it }")
  raise "Expected syntax error, but got none"
rescue SyntaxError => e
  raise "Assertion failed" unless e.message.include?("ordinary parameter is defined")
end
