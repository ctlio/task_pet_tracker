class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]
  helper_method :get_random_image_path

  # GET /pets or /pets.json
  def index
    @pets = current_user.own_pets
    @pets.each do |pet|
      pet.status
    end
    
  end

  # GET /pets/1 or /pets/1.json
  def show
    @pets = current_user.own_pets
    @pets.each do |pet|
      pet.status
    end
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  
  end
  
  def get_random_image_path
    images = Dir.glob(Rails.root.join('app', 'assets', 'images', 'pets', '*.{jpg,jpeg,png,gif}'))
    images.sample.split('/').last
  end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.pet_owner = current_user
    @pet.image = params[:pet][:image]
    if @pet.happiness >= 40
      @pet.status = "neutral"
    end

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pet_url(@pet), notice: "You got a task pet! Please start making them happy by completing tasks." }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url, alert: "Pet was released." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:pet_owner_id, :name, :status, :image)
    end
end
