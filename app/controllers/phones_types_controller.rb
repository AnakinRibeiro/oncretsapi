class PhonesTypesController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_phones_type, only: [:show, :edit, :update, :destroy]

  # GET /phones_types
  # GET /phones_types.json
  def index
    @phones_types = PhonesType.all
  end

  # GET /phones_types/1
  # GET /phones_types/1.json
  def show
  end

  # GET /phones_types/new
  def new
    @phones_type = PhonesType.new
  end

  # GET /phones_types/1/edit
  def edit
  end

  # POST /phones_types
  # POST /phones_types.json
  def create
    @phones_type = PhonesType.new(phones_type_params)

    respond_to do |format|
      if @phones_type.save
        format.html { redirect_to @phones_type, notice: 'Phones type was successfully created.' }
        format.json { render :show, status: :created, location: @phones_type }
      else
        format.html { render :new }
        format.json { render json: @phones_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones_types/1
  # PATCH/PUT /phones_types/1.json
  def update
    respond_to do |format|
      if @phones_type.update(phones_type_params)
        format.html { redirect_to @phones_type, notice: 'Phones type was successfully updated.' }
        format.json { render :show, status: :ok, location: @phones_type }
      else
        format.html { render :edit }
        format.json { render json: @phones_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones_types/1
  # DELETE /phones_types/1.json
  def destroy
    @phones_type.destroy
    respond_to do |format|
      format.html { redirect_to phones_types_url, notice: 'Phones type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phones_type
      @phones_type = PhonesType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phones_type_params
      params.require(:phones_type).permit(:name)
    end
end
