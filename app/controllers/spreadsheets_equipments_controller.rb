class SpreadsheetsEquipmentsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_spreadsheets_equipment, only: [:show, :edit, :update, :destroy]

  # GET /spreadsheets_equipments
  # GET /spreadsheets_equipments.json
  def index
    @spreadsheets_equipments = SpreadsheetsEquipment.all
  end

  # GET /spreadsheets_equipments/1
  # GET /spreadsheets_equipments/1.json
  def show
  end

  # GET /spreadsheets_equipments/new
  def new
    @spreadsheets_equipment = SpreadsheetsEquipment.new
  end

  # GET /spreadsheets_equipments/1/edit
  def edit
  end

  # POST /spreadsheets_equipments
  # POST /spreadsheets_equipments.json
  def create
    @spreadsheets_equipment = SpreadsheetsEquipment.new(spreadsheets_equipment_params)

    respond_to do |format|
      if @spreadsheets_equipment.save
        format.html { redirect_to @spreadsheets_equipment, notice: 'Spreadsheets equipment was successfully created.' }
        format.json { render :show, status: :created, location: @spreadsheets_equipment }
        format.js { render inline: "
          document.getElementById('loader').style.display = 'none';
          document.getElementById(
            'fieldset-table-elongations').removeAttribute('disabled');
        "}
      else
        format.html { render :new }
        format.json { render json: @spreadsheets_equipment.errors, status: :unprocessable_entity }
        format.js { render inline: "alert('Erro');"}
      end
    end
  end

  # PATCH/PUT /spreadsheets_equipments/1
  # PATCH/PUT /spreadsheets_equipments/1.json
  def update
    respond_to do |format|
      if @spreadsheets_equipment.update(spreadsheets_equipment_params)
        format.html { redirect_to @spreadsheets_equipment, notice: 'Spreadsheets equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @spreadsheets_equipment }
      else
        format.html { render :edit }
        format.json { render json: @spreadsheets_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreadsheets_equipments/1
  # DELETE /spreadsheets_equipments/1.json
  def destroy
    @spreadsheets_equipment.destroy
    respond_to do |format|
      format.html { redirect_to spreadsheets_equipments_url, notice: 'Spreadsheets equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spreadsheets_equipment
      @spreadsheets_equipment = SpreadsheetsEquipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spreadsheets_equipment_params
      params.require(:spreadsheets_equipment).permit(:spreadsheet_id, :pump_id, :jack_id, :start, :end, :elongations_number)
    end
end
