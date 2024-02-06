class A
  def self.call(data)
    case data
    in [String, /\d+/ => id]
      id.to_i
    in {id:}
      id
    end
  end
end

raise "Assertion failed" unless A.call(["x", "45"]) == 45 && A.call({id: 42}) == 42
