class Feature

  attr_accessor :name, :identifier, :scenarios

  def initialize(name, identifier)
    @name = name
    @identifier = identifier
    @scenarios = []
  end

  def scenario(name, &block)
    scene = Scenario.new(name, identifier)
    scene.instance_eval(&block) if block_given?
    scenarios << scene
  end

  def generate_scenario_id
    "#{identifier}.S#{scenarios.length}"
  end
end