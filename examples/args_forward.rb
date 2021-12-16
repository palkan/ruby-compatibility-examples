class A
  def bar(p, k:)
    [p, k, yield]
  end

  def foo(...)
    bar(...)
  end
end

raise "Assertion failed" unless A.new.foo(1, k: "a") { :x } == [1, "a", :x]
