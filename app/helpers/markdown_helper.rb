module MarkdownHelper
  def markdown(text)
    options = {
      filter_html: true,
      hard_wrap: true
    }

    extensions = {
      no_intraemphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      space_after_headers: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
