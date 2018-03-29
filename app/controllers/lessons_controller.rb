class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def show

  end

  private
   
=begin
  def require_authorized_for_current_course
    if current_lesson.section.course.user != current_user && 
        !current_user.enrolled_in?(current_lesson.section.course)
    redirect_to course_path(current_lesson.section.course), alert: 'Access will be granted, when you enroll.'
    end
  end
=end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_current_course
    @course = current_lesson.section.course
    if current_user.enrolled_in?(@course) == false 
      redirect_to course_path(@course), :alert => 'Please enroll to access lesson?'
    end
  end
end
