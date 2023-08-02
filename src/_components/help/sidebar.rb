class Help::Sidebar < Bridgetown::Component
  def initialize(metadata:, resource:, sidebar:, page_list:)
    @metadata, @resource, @sidebar, @page_list = metadata, resource, sidebar, page_list
  end
end
