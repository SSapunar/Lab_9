class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @species_list = policy_scope(Pet).distinct.pluck(:species)
    @species = params[:species]
    @pets = @species.present? ? policy_scope(Pet).by_species(@species).includes(:owner) : policy_scope(Pet).includes(:owner)
    authorize Pet
  end

  def show
    authorize @pet
    @pet = Pet.includes(appointments: [:vet, :treatments]).find(params[:id])
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    if @pet.save
      redirect_to @pet, notice: "Pet created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @pet
  end

  def update
    authorize @pet
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Pet updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to pets_path, notice: "Pet deleted successfully."
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(policy(@pet || Pet.new).permitted_attributes)
  end
end