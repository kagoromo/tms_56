class Supervisor::CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @courses = @courses.page(params[:page]).per Settings.courses.per_page
    @course = Course.new
    @course.build_course_subjects @course.subjects
    @search = @courses.ransack params[:q]
    unless params[:q].nil?
      @courses = @search.result
    end
  end

  def show
  end

  def new
    @course = Course.new
    @course.build_course_subjects
  end

  def create
    @course.user = current_user
    if @course.save
      flash[:success] = t "courses.create_success"
      redirect_to supervisor_course_path @course
    else
      flash.now[:danger] = t "courses.create_error"
      @course.build_course_subjects
      render :new
    end
  end

  def edit
    @course.build_course_subjects @course.subjects
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "courses.update_success"
      redirect_to supervisor_course_path @course
    else
      @courses = Course.all.page(params[:page]).per Settings.courses.per_page
      flash.now[:danger] = t "courses.update_error"
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = t "courses.delete_success"
    else
      flash[:danger] = t "courses.delete_error"
    end
    redirect_to supervisor_courses_path
  end

  private
  def course_params
    params.require(:course).permit :content, :description, :status, :start_date,
      :end_date, course_subjects_attributes: [:id, :subject_id, :course_id,
      :status, :_destroy]
  end
end
