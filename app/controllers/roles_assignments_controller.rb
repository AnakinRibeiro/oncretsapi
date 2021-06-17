class RolesAssignmentsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_roles_assignment, only: [:show, :edit, :update, :destroy]

  # GET /roles_assignments
  # GET /roles_assignments.json
  def index
    @roles_assignments = RolesAssignment.all
  end

  # GET /roles_assignments/1
  # GET /roles_assignments/1.json
  def show
  end

  # GET /roles_assignments/new
  def new
    @roles_assignment = RolesAssignment.new
  end

  # GET /roles_assignments/1/edit
  def edit
  end

  # POST /roles_assignments
  # POST /roles_assignments.json
  def create
    @roles_assignment = RolesAssignment.new(roles_assignment_params)

    respond_to do |format|
      if @roles_assignment.save
        format.html { redirect_to @roles_assignment, notice: 'Roles assignment was successfully created.' }
        format.json { render :show, status: :created, location: @roles_assignment }
      else
        format.html { render :new }
        format.json { render json: @roles_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles_assignments/1
  # PATCH/PUT /roles_assignments/1.json
  def update
    respond_to do |format|
      if @roles_assignment.update(roles_assignment_params)
        format.html { redirect_to @roles_assignment, notice: 'Roles assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @roles_assignment }
      else
        format.html { render :edit }
        format.json { render json: @roles_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles_assignments/1
  # DELETE /roles_assignments/1.json
  def destroy
    @roles_assignment.destroy
    respond_to do |format|
      format.html { redirect_to roles_assignments_url, notice: 'Roles assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roles_assignment
      @roles_assignment = RolesAssignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def roles_assignment_params
      params.require(:roles_assignment).permit(:user_id, :role)
    end
end
