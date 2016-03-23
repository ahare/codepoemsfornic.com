class Person
  attr_accessor :heart
  def walk_by
    yield
  end
end

you = Person.new
me = Person.new

you.walk_by do
  you.heart = me.heart
end
