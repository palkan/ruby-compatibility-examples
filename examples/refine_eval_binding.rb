using(Module.new do
  refine Kernel do
    def eval(source, bind, *other)
      new_source = source.gsub(/\bin\b/, "when")
      super new_source, bind, *other
    end
  end
end)

refinery = Module.new do
  refine Array do
    def deconstruct
      [0]
    end
  end
end

result = nil
Module.new do
  using refinery

  result = eval(<<~RUBY, binding)
    case "1"
    in String
      [1].deconstruct
    end
  RUBY
end

raise "Assertion failed. Actual: #{result}" unless result == [0]
