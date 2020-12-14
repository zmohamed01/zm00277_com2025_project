class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  #Show action: shows individual selections
  def show
  end

  #Index action which shows all selections to admin user but only their own selections for regular users.
  def index
    if (current_user && current_user.admin)
      @selection = Selection.all
      @selection = Selection.order(user_id: :asc)
    else
       @selection = current_user.selections
    end
  end

  #New action creates new Selection object
  def new
     @selection = Selection.new
  end

  #Create action saves new selection unless that selection title has already been chosen by that specific user. If selection has
  # already been chosen, it alerts the user to choose a different module
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

  #Regular users are able to update their selections and admin users are able to approve their choices.
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

  #Users are able to delete Selection choices.
  def destroy
    @selection.destroy
    redirect_to selections_path
  end

  private

  #Callback shares common function multiple actions such as show and edit. So rendered before those actions to limit repetition.
  def set_selection
    @selection = Selection.find(params[:id])
  end

  #Only accepting certain named paramters.
  def selection_params
       params.require(:selection).permit(:title,:reason, :user_id, :course_id)
  end

end
