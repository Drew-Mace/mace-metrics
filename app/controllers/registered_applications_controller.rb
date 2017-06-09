class RegisteredApplicationsController < ApplicationController
  
  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name) 
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
    @registered_application = RegisteredApplication.find(params[:id])
  end
  
  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)
    
    if @registered_application.save
      flash[:notice] = "App updated"
      redirect_to @registered_application
    else
      flash.now[:alert] = "Error registering app"
      render :edit
    end
  end

  def create
    @registered_application = RegisteredApplication.new(params[:id])
    @registered_application.assign_attributes(registered_application_params)
    
    if @registered_application.save
      redirect_to @registered_application, notice: "App was registered"
    else
      flash.now[:alert] = "Error registering app"
      render :new
    end
  end
  
  private
  
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
