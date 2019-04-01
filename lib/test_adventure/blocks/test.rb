class Test
  attr_accessor :name, :identifier, :features, :version

  def initialize(name, identifier, version = "v1")
    @name = name
    @identifier = identifier
    @version = version
    @features = []
  end

  def feature(name, &block)
    feat = Feature.new(name, generate_feature_id)
    feat.instance_eval(&block) if block_given?
    features << feat
  end

  def generate_feature_id
    "#{identifier}.F#{features.length}"
  end

end