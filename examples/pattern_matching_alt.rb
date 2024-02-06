class Cards
  def self.value(id)
    case id
    in "2" | "3" | "4" | "5" | "6" | "7" | "9" | "10"
      id.to_i
    in "jack" | "queen" | "king"
      10
    in "ace"
      11
    end
  end
end

raise "Assertion failed" unless Cards.value("king") == 10
