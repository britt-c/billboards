class BillboardsController < ApplicationController
before_action :authenticate_user!  
  def index
    @billboards = Billboard.all
  end
  
  def show
  end
  
  def new
    if current_user && current_user.admin?
      @billboard = Billboard.new    
    else
      redirect_to(billboards_path, alert: "You must be an admin to create a new billboard.")
    end
  end
  
  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to(billboards_path)
    else
      render(:new)
    end
  end
  
  def edit
    if current_user && current_user.admin?
      @billboard = Billboard.find(params[:id]) 
    else
      redirect_to(billboards_path, alert: "You must be an admin to edit a billboard.")
    end
  end

  def update 
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to(billboards_path)
    else 
      render(:edit)
    end
  end
  
  def destroy
    if current_user && current_user.admin?
      @billboard = Billboard.find(params[:id])
      @billboard.destroy
      redirect_to(billboards_path)
    else
      redirect_to(billboards_path, alert: "You must be an admin to edit a billboard.")
    end
  end
  
  private

  def billboard_params
  params.require(:billboard).permit(:title, :country)
  end

end
