class ProjectsController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"], except: [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(params[:name])
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
