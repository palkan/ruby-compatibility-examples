module A
  def test
    "testo"
  end
end

class B
end

using(Module.new do
  refine B do
    begin
      import_methods A
    rescue NoMethodError
      include A
    end
  end
end)

raise "Assertion failed" unless B.new.test == "testo"
