module A
  def test
    "testo"
  end
end

class B
end

using(Module.new do
  refine B do
    include A
  end
end)

raise "Assertion failed" unless B.new.test == "testo"
