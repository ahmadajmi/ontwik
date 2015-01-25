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

  def body_css_class
    @body_css_classes ||= []
    view_css_class = [controller_path.split('/'), action_name, 'view'].flatten.join('-')

    @body_css_classes.unshift(view_css_class).join(' ')
  end

  def profile_show_path_helper(user_id)
    "/#{user_id.nickname}"
  end

end
