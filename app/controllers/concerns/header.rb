module Header
  extend ActiveSupport::Concern

  private

  def fetch_header_items
     @header_items = Navbar.get_navbar_root_items
  rescue ActiveRecord::RecordNotFound
    @header_items = []
  end
end