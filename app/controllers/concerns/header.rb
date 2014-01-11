module Header
  extend ActiveSupport::Concern

  private

  def header_items

  rescue ActiveRecord::RecordNotFound
    @header = []
  end
end