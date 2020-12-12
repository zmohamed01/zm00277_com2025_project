class CoursesController < ApplicationController
  def courses
  end

  def search_courses
    if params[:course].present?
      @course = Course.search(params[:course])

    if @course
      render 'courses/courses'
    else
        flash[:alert] = "Uh oh, you must enter a valid module code."
        redirect_to courses_path
      end
    else
        flash[:alert] = "Uh oh, you must enter a module code."
        redirect_to courses_path
    end
    end
end
