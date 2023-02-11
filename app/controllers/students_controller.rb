class StudentsController < ApplicationController
  # before_action :set_student, only: [:show, :edit, :update]

  def index
    @batch = Batch.find(params[:batch_id])
    @users = User.where(batch: @batch)
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    user = current_user
    if user.update(batch: Batch.find(params[:batch_id]))
      redirect_to dashboard_path, notice: 'You were successfully registered.'
    else
      render program_batch_path(params[:batch].program, params[:batch]), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    current_user.batch = params[:batch]
    raise
    if current_user.update
      redirect_to dashboard, notice: 'You were successfully registered.'
    else
      render program_batch_path(params[:batch].program, params[:batch]), status: :unprocessable_entity
    end
  end

  # private

  # def set_student
  #   @student = Student.find(params[:id])
  # end

  # def student_params
  #   params.require(:student).permit(:status)
  # end
end
