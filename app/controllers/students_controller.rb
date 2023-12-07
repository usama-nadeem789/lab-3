class StudentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @student = Student.all
  end

  def new
    @student = Student.new
    @books = Book.all
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end


  def edit
    @student = Student.find(params[:id])
    @books = Book.all
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to students_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to student_path
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name,:cnic)
  end

end
