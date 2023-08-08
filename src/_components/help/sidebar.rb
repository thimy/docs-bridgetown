class Help::Sidebar < Bridgetown::Component
  def initialize(metadata:, resource:, sidebar:, page_list:, current:)
    @metadata, @resource, @sidebar, @page_list, @current = metadata, resource, sidebar, page_list, current
  end
end
