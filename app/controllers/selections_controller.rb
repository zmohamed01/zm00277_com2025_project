class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @selection = Selection.all
  end

  def new
     @selection = Selection.new
  end

  def create
    @selection = Selection.new(parameters)
    if @selection.save
      flash[:notice] = "Your selection was successful!"
      redirect_to @selection
    else
      render 'new'
  end
  end

  def edit
  end

  def update
    if @selection.update(parameters)
      flash[:notice] = "You have successfully updated your module selection!"
      redirect_to @selection
    else
      render 'edit'
    end
  end

  def destroy
    @selection.destroy
    redirect_to selections_path
  end

  private

  def set_selection
    @selection = Selection.find(params[:id])
  end

  def parameters
  params.require(:selection).permit(:title,:reason)
  end
end
