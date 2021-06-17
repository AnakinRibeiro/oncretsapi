class PositionsCablesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_positions_cable, only: [:show, :edit, :update, :destroy]

  # GET /positions_cables
  # GET /positions_cables.json
  def index
    @positions_cables = PositionsCable.all
  end

  # GET /positions_cables/1
  # GET /positions_cables/1.json
  def show
  end

  # GET /positions_cables/new
  def new
    @positions_cable = PositionsCable.new
  end

  # GET /positions_cables/1/edit
  def edit
  end

  # POST /positions_cables
  # POST /positions_cables.json
  def create
    @positions_cable = PositionsCable.new(positions_cable_params)

    respond_to do |format|
      if @positions_cable.save
        format.html { redirect_to @positions_cable, notice: 'Positions cable was successfully created.' }
        format.json { render :show, status: :created, location: @positions_cable }
      else
        format.html { render :new }
        format.json { render json: @positions_cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions_cables/1
  # PATCH/PUT /positions_cables/1.json
  def update
    respond_to do |format|
      if @positions_cable.update(positions_cable_params)
        format.html { redirect_to @positions_cable, notice: 'Positions cable was successfully updated.' }
        format.json { render :show, status: :ok, location: @positions_cable }
      else
        format.html { render :edit }
        format.json { render json: @positions_cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions_cables/1
  # DELETE /positions_cables/1.json
  def destroy
    @positions_cable.destroy
    respond_to do |format|
      format.html { redirect_to positions_cables_url, notice: 'Positions cable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_positions_cable
      @positions_cable = PositionsCable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def positions_cable_params
      params.require(:positions_cable).permit(:name)
    end
end
