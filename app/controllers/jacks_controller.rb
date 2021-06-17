class JacksController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_jack, only: [:show, :edit, :update, :destroy]

  # GET /jacks
  # GET /jacks.json
  def index
    @company = Company.find(params[:company_id])
    @jacks = current_user.company.jacks.order(id: :DESC)
  end

  # GET /jacks/1
  # GET /jacks/1.json
  def show
    @company = Company.find(params[:company_id])
  end

  # GET /jacks/new
  def new
    @company = Company.find(params[:company_id])
    @jack = Jack.new
  end

  # GET /jacks/1/edit
  def edit
    @company = Company.find(params[:company_id])
  end

  # POST /jacks
  # POST /jacks.json
  def create
    @jack = Jack.new(jack_params)
    @jack.company = current_user.company

    respond_to do |format|
      if @jack.save
        format.html { redirect_to company_jacks_path, notice: 'Jack was successfully created.' }
        format.json { render :show, status: :created, location: @jack }
      else
        format.html { render :new }
        format.json { render json: @jack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jacks/1
  # PATCH/PUT /jacks/1.json
  def update
    respond_to do |format|
      if @jack.update(jack_params)
        format.html { redirect_to company_jacks_path, notice: 'Jack was successfully updated.' }
        format.json { render :show, status: :ok, location: @jack }
      else
        format.html { render :edit }
        format.json { render json: @jack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jacks/1
  # DELETE /jacks/1.json
  def destroy
    @jack.destroy
    respond_to do |format|
      format.html { redirect_to company_jacks_path, notice: 'Jack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jack
      @jack = Jack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jack_params
      params.require(:jack).permit(:identification, :name, :company_id)
    end
end
