class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def index
    @batch = Batch.find(params[:batch_id])
    @students = Student.where(batch: @batch)
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @student = Student.new(student_params)
    @student.user = current_user
    @student.batch = @batch
    if @student.save
      redirect_to  batch_students(@batch), notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to batch_students(@batch), notice: 'Student was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:status)
  end
end
