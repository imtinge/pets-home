class ReportersController < ApplicationController
  before_action :set_reporter, only: [:show, :edit, :update, :destroy, :has_found]
  before_action :authenticate_user!, only: %i[new edit create update]
  before_action :owner_user, only: %i[edit update]

  # GET /reporters
  # GET /reporters.json
  def index
    @reporters = Reporter.all
  end

  # GET /reporters/1
  def show
  end

  # GET /reporters/new
  def new
    @reporter = Reporter.new
  end

  # GET /reporters/1/edit
  def edit
  end

  # POST /reporters
  def create
    @reporter = Reporter.new(reporter_params)
    @reporter.user = current_user
    if @reporter.save
      redirect_to @reporter, notice: 'Reporter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reporters/1
  def update
    if @reporter.update(reporter_params)
      redirect_to @reporter, notice: 'Reporter was successfully updated.' 
    else
      render :edit
    end
  end

  # DELETE /reporters/1
  def destroy
    @reporter.destroy
    redirect_to reporters_url, notice: 'Reporter was successfully destroyed.'
  end
  
  def has_found
    @reporter.update_attribute(:is_found, true)
    redirect_to @reporter
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporter
      @reporter = Reporter.find(params[:id])
    end
    
    def owner_user
      unless current_user == @reporter.user
        redirect_to root_path, danger: 'You are not the owner of this reporter.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporter_params
      params.require(:reporter).permit(:pet_name, :pet_photo, :pet_species, :pet_gender, :pet_breed, :pet_color, :lost_date, :lost_city, :lost_place, :extra_info, :contact, :email, :phone_number)
    end
end
