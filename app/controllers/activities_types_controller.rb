class ActivitiesTypesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_activities_type, only: [:show, :edit, :update, :destroy]

  # GET /activities_types
  # GET /activities_types.json
  def index
    @activities_types = ActivitiesType.all
  end

  # GET /activities_types/1
  # GET /activities_types/1.json
  def show
  end

  # GET /activities_types/new
  def new
    @activities_type = ActivitiesType.new
  end

  # GET /activities_types/1/edit
  def edit
  end

  # POST /activities_types
  # POST /activities_types.json
  def create
    @activities_type = ActivitiesType.new(activities_type_params)

    respond_to do |format|
      if @activities_type.save
        format.html { redirect_to @activities_type, notice: 'Activities type was successfully created.' }
        format.json { render :show, status: :created, location: @activities_type }
      else
        format.html { render :new }
        format.json { render json: @activities_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities_types/1
  # PATCH/PUT /activities_types/1.json
  def update
    respond_to do |format|
      if @activities_type.update(activities_type_params)
        format.html { redirect_to @activities_type, notice: 'Activities type was successfully updated.' }
        format.json { render :show, status: :ok, location: @activities_type }
      else
        format.html { render :edit }
        format.json { render json: @activities_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities_types/1
  # DELETE /activities_types/1.json
  def destroy
    @activities_type.destroy
    respond_to do |format|
      format.html { redirect_to activities_types_url, notice: 'Activities type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activities_type
      @activities_type = ActivitiesType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activities_type_params
      params.require(:activities_type).permit(:name)
    end
end
