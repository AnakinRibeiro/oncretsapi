class ConstructionsActivitiesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_constructions_activity, only: [:show, :edit, :update, :destroy]

  # GET /constructions_activities
  # GET /constructions_activities.json
  def index
    @constructions_activities = ConstructionsActivity.all
  end

  # GET /constructions_activities/1
  # GET /constructions_activities/1.json
  def show
  end

  # GET /constructions_activities/new
  def new
    @constructions_activity = ConstructionsActivity.new
  end

  # GET /constructions_activities/1/edit
  def edit
  end

  # POST /constructions_activities
  # POST /constructions_activities.json
  def create
    @constructions_activity = ConstructionsActivity.new(constructions_activity_params)

    respond_to do |format|
      if @constructions_activity.save
        format.html { redirect_to @constructions_activity, notice: 'Constructions activity was successfully created.' }
        format.json { render :show, status: :created, location: @constructions_activity }
      else
        format.html { render :new }
        format.json { render json: @constructions_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constructions_activities/1
  # PATCH/PUT /constructions_activities/1.json
  def update
    respond_to do |format|
      if @constructions_activity.update(constructions_activity_params)
        format.html { redirect_to @constructions_activity, notice: 'Constructions activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @constructions_activity }
      else
        format.html { render :edit }
        format.json { render json: @constructions_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constructions_activities/1
  # DELETE /constructions_activities/1.json
  def destroy
    @constructions_activity.destroy
    respond_to do |format|
      format.html { redirect_to constructions_activities_url, notice: 'Constructions activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constructions_activity
      @constructions_activity = ConstructionsActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def constructions_activity_params
      params.require(:constructions_activity).permit(:construction_id, :activities_type_id, :user_id)
    end
end
