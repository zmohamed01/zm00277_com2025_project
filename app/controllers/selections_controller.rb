class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def index
    if (current_user && current_user.admin)
      @selection = Selection.all
    else
       @selection = current_user.selections
    end
  end

  def new
     @selection = Selection.new
  end

  def create
    @selection = Selection.new(selection_params)
    @selection.user = current_user
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
    if @selection.update(selection_params)
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

  def selection_params
  params.require(:selection).permit(:title,:reason, :user_id)
  end

end
