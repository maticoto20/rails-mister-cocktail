class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new(cocktail_id: @cocktail.id)
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    return redirect_to edit_cocktail_path(@dose.cocktail) if @dose.save

    render :new
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to edit_cocktail_path(@cocktail)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
