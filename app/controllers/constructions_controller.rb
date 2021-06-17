include ActionView::Helpers::DateHelper

class ConstructionsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_construction, only: [:show, :edit, :update, :destroy]

  def constructions_dashboard 
    @construction = current_user.company.constructions.find(params[:id])
  end

  # GET /constructions
  # GET /constructions.json
  def index
    @constructions = current_user.company.constructions.where(is_active: true)
    
    respond_to do |format|
      format.json { render json: @constructions.map { |c| c.as_json.merge({cover_image_key: (c.image.key rescue nil), last_change: time_ago_in_words(c.updated_at),
        spreadsheet_count: c.spreadsheets.count, cable_count: c.cables_count, elongation_count: c.elongations_count, project_count: c.projects.count}) }, status: 200 }
      format.html
    end
  end

  # GET /constructions/1
  # GET /constructions/1.json
  def show
  end

  # GET /constructions/new
  def new
    @construction = Construction.new
  end

  # GET /constructions/1/edit
  def edit
  end

  # POST /constructions
  # POST /constructions.json
  def create
    @construction = Construction.new(construction_params)
    @construction.company = current_user.company
    @construction.image.attach(params[:construction][:image])

    respond_to do |format|
      if @construction.save
        format.html { redirect_to @construction, notice: 'Construction was successfully created.' }
        format.json { render :show, status: :created, location: @construction }
      else
        format.html { render :new }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constructions/1
  # PATCH/PUT /constructions/1.json
  def update
    respond_to do |format|
      if @construction.update(construction_params)
        format.html { redirect_to @construction, notice: 'Construction was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction }
      else
        format.html { render :edit }
        format.json { render json: @construction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constructions/1
  # DELETE /constructions/1.json
  def destroy
    respond_to do |format|
      Construction.transaction do
        begin
          @construction.image.purge
          @construction.destroy
          
          format.html { redirect_to constructions_url, notice: 'Construction was successfully destroyed.' }
          format.json { head :no_content }
        rescue Exception => exception
          format.html { redirect_to constructions_url, notice: "This construction can't be deleted." }
          format.json { head :no_content, status: 400 }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction
      @construction = Construction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def construction_params
      params.require(:construction).permit(:name, :company_id, :image, :is_active)
    end
end
