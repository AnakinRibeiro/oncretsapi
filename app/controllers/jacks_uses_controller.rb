class JacksUsesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_jacks_use, only: [:show, :edit, :update, :destroy]

  # GET /jacks_uses
  # GET /jacks_uses.json
  def index
    @jacks_uses = JacksUse.all
  end

  # GET /jacks_uses/1
  # GET /jacks_uses/1.json
  def show
  end

  # GET /jacks_uses/new
  def new
    @jacks_use = JacksUse.new
  end

  # GET /jacks_uses/1/edit
  def edit
  end

  # POST /jacks_uses
  # POST /jacks_uses.json
  def create
    @jacks_use = JacksUse.new(jacks_use_params)

    respond_to do |format|
      if @jacks_use.save
        format.html { redirect_to @jacks_use, notice: 'Jacks use was successfully created.' }
        format.json { render :show, status: :created, location: @jacks_use }
      else
        format.html { render :new }
        format.json { render json: @jacks_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jacks_uses/1
  # PATCH/PUT /jacks_uses/1.json
  def update
    respond_to do |format|
      if @jacks_use.update(jacks_use_params)
        format.html { redirect_to @jacks_use, notice: 'Jacks use was successfully updated.' }
        format.json { render :show, status: :ok, location: @jacks_use }
      else
        format.html { render :edit }
        format.json { render json: @jacks_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jacks_uses/1
  # DELETE /jacks_uses/1.json
  def destroy
    @jacks_use.destroy
    respond_to do |format|
      format.html { redirect_to jacks_uses_url, notice: 'Jacks use was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jacks_use
      @jacks_use = JacksUse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jacks_use_params
      params.require(:jacks_use).permit(:jack_id, :spreadsheet_id, :start, :end, :elongations_number)
    end
end
