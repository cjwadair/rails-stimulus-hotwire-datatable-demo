class Beer < ApplicationRecord


  def self.by_query_param(param)
    param = param.downcase
    where('LOWER(name) LIKE ?', "%#{param}%")
    .or(Beer.where('LOWER(brewery) LIKE ?', "%#{param}%"))
  end


end