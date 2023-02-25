class BeersController < ApplicationController
  
  def index

    @beers = Beer.all
    @beers = Beer.by_query_param(params[:query]) if params[:query].present?
    @beers = @beers.order(sort_column => sort_direction) 

    @pagy, @beers = pagy(@beers)
    
    respond_to do |format|
      format.html
      format.json {render json: {entries: render_to_string(TableBodyComponent.new(collection: @beers), formats: [:html], layout:false), pagination: view_context.pagy_nav(@pagy) }}
    end

  end
  
  def show
  end

  private

  def sort_column
    ["name", "brewery", "country", "configuration", "abv", "beer_type", "category"].include?(params[:sort]) ? params[:sort] : "name" 
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc" 
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery, :abv, :beer_type, :category, :size, :country)

  end

end
