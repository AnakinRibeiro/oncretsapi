class ElongationsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_elongation, only: [:show, :edit, :update, :destroy]

  # GET /elongations
  # GET /elongations.json
  def index
    @elongations = Elongation.all
  end

  def report_elongations
    respond_to do |format|
      @cables = Spreadsheet.find(params[:spreadsheet_id]).cables
        format.html
      end
  end

  def show_elongations
    @elongation = Elongation.new
    @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
    if SpreadsheetsEquipment.where(spreadsheet_id: params[:spreadsheet_id]).exists?
      @disabled = true
      @equips = SpreadsheetsEquipment.where(spreadsheet_id: params[:spreadsheet_id]).last
    else
      @equips = SpreadsheetsEquipment.new
      @equips.spreadsheet_id = params[:spreadsheet_id]
      @disabled = false  
    end
  end

  # GET /elongations/1
  # GET /elongations/1.json
  def show
  end

  # GET /elongations/new
  def new
    @elongation = Elongation.new
  end

  # GET /elongations/1/edit
  def edit
  end

  # POST /elongations
  # POST /elongations.json
  def create
    @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
    @elongation = Elongation.new(elongation_params)
    @elongation.cable_id = params[:cable_id]
    #@elongation.cables_reviews_type = CablesReviewsType.find(6)

    respond_to do |format|
      if @elongation.save
        format.html { redirect_to @elongation, notice: 'Elongation was successfully created.' }
        format.json { render json: @elongation, include: { cables_reviews_type: { only: [:id, :name] } }, status: :created }
      else
        format.html { render :new }
        format.json { render json: @elongation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elongations/1
  # PATCH/PUT /elongations/1.json
  def update
    respond_to do |format|
      if @elongation.update(elongation_params)
        format.html { redirect_to @elongation, notice: 'Elongation was successfully updated.' }
        format.json { render :show, status: :ok, location: @elongation }
      else
        format.html { render :edit }
        format.json { render json: @elongation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elongations/1
  # DELETE /elongations/1.json
  def destroy
    @elongation.destroy
    respond_to do |format|
      format.html { redirect_to elongations_url, notice: 'Elongation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elongation
      @elongation = Elongation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def elongation_params
      params.require(:elongation).permit(:cable_id, :elongation, :status, :deviation, :elongation_meter, :cables_reviews_type_id, :jacking_mode, :correction_value, :wedgeslip_check, :wedgeslip_value)
    end
end
