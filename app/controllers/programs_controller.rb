class ProgramsController < ApplicationController
  before_action :set_program, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:search]
      filter_params = {}
      params[:search].each_key do |search_field|
        unless params[:search][search_field].length.zero?
          filter_params[search_field] = params[:search][search_field]
        end
      end
      @programs = Program.where(filter_params)
    else
      @programs = Program.all
    end
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
    @program.user = current_user
    current_user.teacher = true
    current_user.save!
    if @program.save
      redirect_to program_path(@program), notice: 'Program was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :discipline, :level, :target, :duration, :price, :medias, :description, :language)
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
