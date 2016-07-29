module ApplicationHelper

  # Returns the full title for a page
  def full_title(page_title = '')
    base_title = "Tai Chi School"
    if page_title.empty?
      base_title
    else
      "#{page_title} | Tai Chi School"
    end
  end

  def markdown(text)
    return "" if text.class != String
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    md = Redcarpet::Markdown.new(HTMLWithPants, options).render(text).html_safe

  end

end

class HTMLWithPants < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
end
