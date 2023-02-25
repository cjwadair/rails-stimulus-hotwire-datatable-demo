# frozen_string_literal: true

class DataTableComponent < ViewComponent::Base

  include ApplicationHelper
  include Turbo::FramesHelper
  include Pagy::Frontend
  
  def initialize(pagy:)
    @pagy = pagy
  end 

  # renders_one :header
  renders_one :header, TableHeaderComponent
  renders_one :body, TableBodyComponent
  renders_one :footer

end
