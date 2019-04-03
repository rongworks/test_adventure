class TextileRenderer < Renderer

  def render_header(text, level)
    "\n h#{level}. #{text} \n\n"
  end

  def render_list(title, list, level = 1)
    result = render_header(title, level)
    list.each do |element|
      result += "* #{element} \n"
    end
    result
  end

end