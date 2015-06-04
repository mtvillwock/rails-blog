class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(params[:title])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to '/projects'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name,
                                      :month,
                                      :tagline,
                                      :description,
                                      :summary,
                                      :github_url,
                                      :img_src,
                                      :deploy_url)
    end
end
