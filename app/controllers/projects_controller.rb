class ProjectsController < ApplicationController
  before_action :verify_jwt_token
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if params[:construction_id]
      @construction = Construction.find(params[:construction_id])
      @projects = Project.where(construction: params[:construction_id]).order(id: :DESC)
    else
      @projects = Project.all.order(id: :DESC)
    end

    respond_to do |format|
      format.html 
      format.json { render json: @projects.map { |c| c.as_json.merge({file_key: (c.file.key rescue nil ) }) }, status: 200 }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    if params[:construction_id]
      @construction = Construction.find(params[:construction_id])
      @project.construction_id = params[:construction_id]
    end
  end

  # GET /projects/1/edit
  def edit
    @construction = Construction.find(params[:construction_id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @construction = Construction.find(params[:construction_id])
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to construction_projects_path(@construction), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @construction = Construction.find(params[:construction_id])
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to construction_projects_path(@construction.id), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @construction = Construction.find(params[:construction_id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to construction_projects_path(@construction.id), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :version, :construction_id, :file)
    end
end
