class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)

    redirect_to cocktails_path if @cocktail.save
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    @dose = @cocktail
  end

  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
