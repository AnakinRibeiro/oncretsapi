class SpreadsheetsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_spreadsheet, only: [:show, :edit, :update, :destroy]

  # GET /spreadsheets
  # GET /spreadsheets.json
  def index
    if params[:construction_id]
      @construction = Construction.find(params[:construction_id])
      @spreadsheets = @construction.spreadsheets.order(id: :DESC)
    else
      @spreadsheets = Spreadsheet.all.order(id: :DESC)
    end
  end

def new_spreadsheet
    @spreadsheet = Spreadsheet.new
    @cable = Cable.new
    if params[:construction_id]
      @spreadsheet.construction_id = params[:construction_id]
    end
  end

  # GET /spreadsheets/1
  # GET /spreadsheets/1.json
  def show
  end

  # GET /spreadsheets/new
  def new
    @spreadsheet = Spreadsheet.new
    @cable = Cable.new
    if params[:construction_id]
      @spreadsheet.construction_id = params[:construction_id]
    end
  end

  # GET /spreadsheets/1/edit
  def edit
  end
  
  def create_cables
    params[:quantidade].to_i.times do
      @cable = Cable.new(cable_params)
      @cable.save
    end

    @spreadsheet = Spreadsheet.find(params[:cable][:spreadsheet_id])

    respond_to do |format|
      format.js { render inline: "
        document.getElementById('loader').style.display = 'none';
        document.getElementById('cables').innerHTML = '<%= escape_javascript(render partial: 'cables/cables') %>';
      "}
    end
  end

  # POST /spreadsheets
  # POST /spreadsheets.json
  def create
    @spreadsheet = Spreadsheet.new(spreadsheet_params)

    respond_to do |format|
      if @spreadsheet.save
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully created.' }
        format.json { render :show, status: :created, location: @spreadsheet }
        format.js { render inline: "
          document.getElementById('loader').style.display = 'none';
          document.getElementById('cable_spreadsheet_id').value = #{@spreadsheet.id};
          document.getElementById('new-spreadsheet-form-fieldset').setAttribute('disabled', 'disabled');
          document.getElementById('cable-form-fieldset').removeAttribute('disabled');
        "}
      else
        format.html { render :new }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
        format.js { render inline: "alert(#{@spreadsheet.errors});" }
      end
    end
  end

  # PATCH/PUT /spreadsheets/1
  # PATCH/PUT /spreadsheets/1.json
  def update
    respond_to do |format|
      if @spreadsheet.update(spreadsheet_params)
        format.html { redirect_to @spreadsheet, notice: 'Spreadsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @spreadsheet }
      else
        format.html { render :edit }
        format.json { render json: @spreadsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spreadsheets/1
  # DELETE /spreadsheets/1.json
  def destroy
    respond_to do |format|
      begin
        @spreadsheet.destroy
        format.html { redirect_to construction_spreadsheets_url(@construction), notice: 'Spreadsheet was successfully destroyed.' }
        format.json { head :no_content }
      rescue => exception
        format.html { redirect_to construction_spreadsheets_url(@construction), notice: 'Spreadsheet was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spreadsheet
      @spreadsheet = Spreadsheet.find(params[:id])
      @construction = Construction.find(params[:construction_id])
    end

    # Only allow a list of trusted parameters through.
    def spreadsheet_params
      params.require(:spreadsheet).permit(:construction_id, :name, :status, :requester, :resposible, :comments, :cable_numbering_type, :kg_m, :tip_size)
    end

    def cable_params
      params.require(:cable).permit(:spreadsheet_id, :positions_cable_id, :identification, :length, :predicted_elongation, :mask, :status, :construction_id, :quantity, :active_anchoring, :passive_anchoring)
    end
end