class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def show
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def destroy
    @registered_applications = RegisteredApplication.find(params[:id])
    
    if @registered_applications.destroy
      flash[:notice] = "\"#{@registered_applications.name}\" was deleted"
      redirect_to action: :index
    else
      flash.now[:alert] = "Error deleting app"
    end
  end

  def edit
    @registered_applications = RegisteredApplication.find(params[:id])
  end
  
  def update
    @registered_applications = RegisteredApplication.find(params[:id])
    @registered_applications.assign_attributes(registered_applications_params)
    
    if @registered_applications.save
      flash[:notice] = "App updated"
      redirect_to @registered_applications
    else
      flash.now[:alert] = "Error registering app"
      render :edit
    end
  end

  def create
    @registered_applications = RegisteredApplication.new(params[:id])
    @registered_applications.assign_attributes(registered_applications_params)
    
    if @registered_applications.save
      redirect_to @registered_applications, notice: "App was registered"
    else
      flash.now[:alert] = "Error registering app"
      render :new
    end
  end
  
  private
  
  def registered_applications_params
    params.require(:registered_application).permit(:name, :url)
  end
end
