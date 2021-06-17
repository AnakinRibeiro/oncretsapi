class CablesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_cable, only: [:show, :edit, :update, :destroy]

  # GET /cables
  # GET /cables.json
  def index
    @spreadsheet = Spreadsheet.find(params[:spreadsheet_id])
    @cable = Cable.new

    if params[:spreadsheet_id]
      @cables = Cable.where(spreadsheet_id: params[:spreadsheet_id])
      @cable.spreadsheet_id = params[:spreadsheet_id]
      @cable.construction_id = params[:construction_id]
    else
      @cables = Cable.all
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /cables/1
  # GET /cables/1.json
  def show
  end

  # GET /cables/new
  def new
    @cable = Cable.new
  end

  # GET /cables/1/edit
  def edit
  end

  # POST /cables
  # POST /cables.json
  def create
    params[:quantidade].to_i.times do
      @cable = Cable.new(cable_params)
      @cable.save
    end

    @spreadsheet = Spreadsheet.find(params[:cable][:spreadsheet_id])

    respond_to do |format|
        format.html { redirect_to construction_spreadsheet_cables_path(params[:cable][:construction_id],params[:cable][:spreadsheet_id]), notice: 'Cable was successfully created.' }
        format.json { render :show, status: :created, location: @cable }
        format.js { render inline: "document.getElementById('new-spreadsheet-form-fieldset').setAttribute('disabled', 'disabled'); document.getElementById('table_cables').html('<%= escape_javascript(render partial: 'cables/cables') %>');" }
    end
  end

  # PATCH/PUT /cables/1
  # PATCH/PUT /cables/1.json
  def update
    respond_to do |format|
      if @cable.update(cable_params)
        format.html { redirect_to @cable, notice: 'Cable was successfully updated.' }
        format.json { render :show, status: :ok, location: @cable }
      else
        format.html { render :edit }
        format.json { render json: @cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cables/1
  # DELETE /cables/1.json
  def destroy
    @cable.destroy
    respond_to do |format|
      format.html { redirect_to cables_url, notice: 'Cable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cable
      @cable = Cable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cable_params
      params.require(:cable).permit(:spreadsheet_id, :positions_cable_id, :identification, :length, :predicted_elongation, :mask, :status, :construction_id, :quantity, :active_anchoring, :passive_anchoring)
    end
end
