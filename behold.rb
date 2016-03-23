class Nic
  class << self
    attr_accessor :beauty
  end
  @beauty = 1_000_000
end

class Me
  def self.behold(nic)
    nic.beauty += 1_000_000
  end
end
