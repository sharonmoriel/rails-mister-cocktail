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

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    @dose = @cocktail
  end

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
