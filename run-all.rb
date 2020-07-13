require "open3"

Dir.chdir(__dir__)

failed = false

Dir.glob("examples/**/*") do |file|
  $stdout.print "Run #{file}: "

  out, err, status = Open3.capture3("ruby #{file}")
  next $stdout.puts " ✅ #{err}" if status.success?

  failed = true
  $stdout.puts " 💥 #{err}"
end

exit(1) if failed
