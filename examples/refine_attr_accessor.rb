class Foo
  def initialize(val)
    @bar = val
  end
end

using(Module.new do
  refine Foo do
    attr_accessor :bar
  end
end)

raise "Assertion failed" unless Foo.new("testo").bar == "testo"
