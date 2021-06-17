class PumpsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_pump, only: [:show, :edit, :update, :destroy]

  # GET /pumps
  # GET /pumps.json
  def index
    @pumps = current_user.company.pumps.order(id: :DESC)
  end

  # GET /pumps/1
  # GET /pumps/1.json
  def show
  end

  # GET /pumps/new
  def new
    @company = Company.find(params[:company_id])
    @pump = Pump.new
    @pump.company_id = current_user.company.id
  end

  # GET /pumps/1/edit
  def edit
  end

  # POST /pumps
  # POST /pumps.json
  def create
    @pump = Pump.new(pump_params)
    @pump.company_id = current_user.company.id

    respond_to do |format|
      if @pump.save
        format.html { redirect_to company_pumps_path, notice: 'Pump was successfully created.' }
        format.json { render :show, status: :created, location: @pump }
      else
        format.html { render :new }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pumps/1
  # PATCH/PUT /pumps/1.json
  def update
    respond_to do |format|
      if @pump.update(pump_params)
        format.html { redirect_to company_pumps_path, notice: 'Pump was successfully updated.' }
        format.json { render :show, status: :ok, location: @pump }
      else
        format.html { render :edit }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pumps/1
  # DELETE /pumps/1.json
  def destroy
    @pump.destroy
    respond_to do |format|
      format.html { redirect_to company_pumps_path, notice: 'Pump was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pump
      @company = Company.find(params[:company_id])
      @pump = Pump.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pump_params
      params.require(:pump).permit(:identification, :name, :company_id)
    end
end
