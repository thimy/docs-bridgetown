class Help::SidebarItems < Bridgetown::Component
  def initialize(page:, page_list:)
    @page, @page_list = page, page_list
  end

  def resource
    @page_list.find { |page| page.relative_url.end_with?(@page) }
  end
end
