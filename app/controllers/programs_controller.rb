class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @programs = Program.all
  end

  def show
    @lesson = Lesson.new
  end

  def new
    @program = Program.new
  end

  def edit; end

  def update
    if @program.update(program_params)
      redirect_to program_path(@program), notice: 'Program was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_path, notice: 'Program was successfully deleted.'
  end

  def create
    @program = Program.new(program_params)
    @program.teacher = Teacher.find(current_user.teacher)
    if @program.save
      redirect_to program_path(@program), notice: 'Program was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def program_params
    params.require(:program).permit(:discipline, :level, :target, :duration, :price, :media, :description, :language)
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
