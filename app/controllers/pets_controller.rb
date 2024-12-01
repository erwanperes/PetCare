class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :verify_pet_owner, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    # crée un nouveau pet déjà associé au current_user 
    @pet = current_user.pets.build
  end

  def edit
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to dashboard_path, notice: 'Pet successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet successfully updated.'  
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to dashboard_path, notice: 'Animal supprimé avec succès.'
  end
  
  private
  
  def pet_params
    params.require(:pet).permit(:name, :specie, :breed, :birth_day, :gender)
  end
  
  def set_pet
    @pet = Pet.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Pet not found"
    redirect_to dashboard_path
  end
  
  def verify_pet_owner
    unless @pet.user == current_user
      flash[:alert] = "Vous n'êtes pas autorisé à accéder à cet animal"
      redirect_to dashboard_path
    end
  end
end
