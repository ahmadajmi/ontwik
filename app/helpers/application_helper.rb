module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(:hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
      :filter_html => true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  # Body Class
  def body_class
    "#{@page_has_darker_background ? 'gray-bg' : 'white-bg'} #{controller.controller_name}-#{controller.action_name} #{page_id} #{user_signed_in? ? 'logged_in' : 'logged_out'}"
  end

  def controller_name
    controller.controller_path.gsub('/','-')
  end

  def page_id
    params['id']
  end
  # End Body Class

end