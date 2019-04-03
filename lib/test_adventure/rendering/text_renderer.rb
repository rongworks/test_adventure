class TextRenderer < Renderer

  def render_header(text, level)
    "\n #{'.'*level} #{text} \n"
  end

  def render_list(title, list, level = 4)
    result = render_header(title, level)
    list.each do |element|
      result += "* #{element} \n"
    end
    result
  end
end