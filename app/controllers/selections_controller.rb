class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
  end

  def index
    if (current_user && current_user.admin)
      @selection = Selection.all
      @selection = Selection.order(user_id: :asc)
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
    if Selection.in_db(@selection.title, @selection.user_id) != nil
      flash[:alert] = "Sorry, you've already chosen that module! Please choose another module."
      redirect_to new_selection_path
    else
    course = Course.find_by_title(@selection.title)
    @selection.course_id = course.id
    if @selection.save
      flash[:notice] = "Your selection was successful!"
      redirect_to @selection
    else
      render 'new'
  end
  end
    end
  def edit
  end

  def update
    if current_user.admin
      @selection.update_attribute :approved, params[:approve]
      flash[:notice] =  "You have successfully approved this module selection!"
      redirect_to @selection
    else
      course = Course.find_by_title(@selection.title)
      @selection.course_id = course.id
       if @selection.update(selection_params)
      flash[:notice] =  "You have successfully updated your module selection!"
      redirect_to @selection
    else
      render 'edit'
  end
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
       params.require(:selection).permit(:title,:reason, :user_id, :course_id)
  end

end
