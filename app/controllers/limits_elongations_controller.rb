class LimitsElongationsController < ApplicationController
  before_action :set_limits_elongation, only: [:show, :edit, :update, :destroy]

  # GET /limits_elongations
  # GET /limits_elongations.json
  def index
    @limits_elongations = LimitsElongation.all
  end

  # GET /limits_elongations/1
  # GET /limits_elongations/1.json
  def show
  end

  # GET /limits_elongations/new
  def new
    @limits_elongation = LimitsElongation.new
  end

  # GET /limits_elongations/1/edit
  def edit
  end

  # POST /limits_elongations
  # POST /limits_elongations.json
  def create
    @limits_elongation = LimitsElongation.new(limits_elongation_params)

    respond_to do |format|
      if @limits_elongation.save
        format.html { redirect_to @limits_elongation, notice: 'Limits elongation was successfully created.' }
        format.json { render :show, status: :created, location: @limits_elongation }
      else
        format.html { render :new }
        format.json { render json: @limits_elongation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /limits_elongations/1
  # PATCH/PUT /limits_elongations/1.json
  def update
    respond_to do |format|
      if @limits_elongation.update(limits_elongation_params)
        format.html { redirect_to @limits_elongation, notice: 'Limits elongation was successfully updated.' }
        format.json { render :show, status: :ok, location: @limits_elongation }
      else
        format.html { render :edit }
        format.json { render json: @limits_elongation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /limits_elongations/1
  # DELETE /limits_elongations/1.json
  def destroy
    @limits_elongation.destroy
    respond_to do |format|
      format.html { redirect_to limits_elongations_url, notice: 'Limits elongation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_limits_elongation
      @limits_elongation = LimitsElongation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def limits_elongation_params
      params.require(:limits_elongation).permit(:initial_length, :final_length, :inferior_limit, :upper_limit)
    end
end
