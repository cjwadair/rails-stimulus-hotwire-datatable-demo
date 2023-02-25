# frozen_string_literal: true

class TableHeaderComponent < ViewComponent::Base

  def initialize(labels:)
    @labels = labels
  end 
end
