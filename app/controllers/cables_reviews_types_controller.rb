class CablesReviewsTypesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_cables_reviews_type, only: [:show, :edit, :update, :destroy]

  # GET /cables_reviews_types
  # GET /cables_reviews_types.json
  def index
    @cables_reviews_types = CablesReviewsType.all
  end

  # GET /cables_reviews_types/1
  # GET /cables_reviews_types/1.json
  def show
  end

  # GET /cables_reviews_types/new
  def new
    @cables_reviews_type = CablesReviewsType.new
  end

  # GET /cables_reviews_types/1/edit
  def edit
  end

  # POST /cables_reviews_types
  # POST /cables_reviews_types.json
  def create
    @cables_reviews_type = CablesReviewsType.new(cables_reviews_type_params)

    respond_to do |format|
      if @cables_reviews_type.save
        format.html { redirect_to @cables_reviews_type, notice: 'Cables reviews type was successfully created.' }
        format.json { render :show, status: :created, location: @cables_reviews_type }
      else
        format.html { render :new }
        format.json { render json: @cables_reviews_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cables_reviews_types/1
  # PATCH/PUT /cables_reviews_types/1.json
  def update
    respond_to do |format|
      if @cables_reviews_type.update(cables_reviews_type_params)
        format.html { redirect_to @cables_reviews_type, notice: 'Cables reviews type was successfully updated.' }
        format.json { render :show, status: :ok, location: @cables_reviews_type }
      else
        format.html { render :edit }
        format.json { render json: @cables_reviews_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cables_reviews_types/1
  # DELETE /cables_reviews_types/1.json
  def destroy
    @cables_reviews_type.destroy
    respond_to do |format|
      format.html { redirect_to cables_reviews_types_url, notice: 'Cables reviews type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cables_reviews_type
      @cables_reviews_type = CablesReviewsType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cables_reviews_type_params
      params.require(:cables_reviews_type).permit(:name)
    end
end
