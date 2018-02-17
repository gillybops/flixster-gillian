class Instructor::LessonsController < ApplicationController
=begin
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section
=end    

  def new
    @section = Section.find(params[:section_id])
    @lesson = Lesson.new
  end
   
  def create
    @section = Section.find(params[:section_id])
    @lesson = current_section.lessons.create(lesson_params)
    redirect_to instructor_course_path(current_section.course)
  end
      
  private
     
=begin
  def require_authorized_for_current_section
    if current_section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end
=end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end
end
