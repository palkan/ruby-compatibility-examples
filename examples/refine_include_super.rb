module KernelExt
  def eval(*args)
    super * 2
  end
end

using(Module.new do
  refine Kernel do
    begin
      import_methods KernelExt
    rescue NoMethodError
      include KernelExt
    end
  end
end)

raise "Assertion failed" unless eval("2") == 4
