# frozen_string_literal: true

class TableBodyComponent < ViewComponent::Base
  
  include ApplicationHelper
  
  # renders_many :tableRows, TableRowComponent

  def initialize(collection:)
    @collection = collection
  end

end
