class Renderer
  attr_accessor :text
  def self.get_renderer(name)
    return TextRenderer.new if name.to_s == 'text'
    return TextileRenderer.new if name.to_s == 'textile'
  end

  def render(test)
    text = render_header(test.name, 1)
    test.features.each do |f|
      text += render_feature(f)
    end
    text
  end

  def render_feature(feature)
    result = render_header(feature.name, 2)
    feature.scenarios.each do |s|
      result += render_scenario(s)
    end
    result
  end

  def render_scenario(scenario)
    result = render_header(scenario.name,3)
    result += render_list('conditions',scenario.conditions, 4)
    result += render_list('actions',scenario.actions, 4)
    result += render_list('expectations', scenario.expectations, 4)
    result
  end


end