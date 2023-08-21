class Help::Sidebar::Item < Bridgetown::Component
  def initialize(page:, page_list:, current:)
    @page, @page_list, @current = page, page_list, current
  end

  def resource
    @page_list.find { |page| page.relative_url.end_with?(@page.link) } if @page.link.present?
  end

  def is_category?
    @page.type == "category"
  end

  def is_current?
    if resource.present?
      @current.path == resource.path
    end
  end
end
