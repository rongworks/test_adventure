class Scenario
  attr_accessor :name, :identifier, :conditions, :actions, :expectations

  def initialize(name, identifier)
    @name = name
    @identifier = identifier
    @conditions = []
    @actions = []
    @expectations = []
  end

  def is_given(content)
    add_element(conditions, content)
  end

  def is_done(content)
    add_element(actions, content)
  end

  def is_expected(content)
    add_element(expectations, content)
  end

  def add_element(collection, element)
    collection << element
  end

end