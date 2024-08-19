module DataCatalog
  class MarkdownService

    def self.call(md)
      @service ||= Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(filter_html: true,
                                    safe_links_only: true))

      @service.render(md)
    end
  end
end