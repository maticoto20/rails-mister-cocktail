class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    return redirect_to cocktail_path(@cocktail) if @cocktail.save

    render :new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show; end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to edit_cocktail_path(@cocktail)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end
  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
