class LessonsController < ApplicationController
  before_action :set_lesson, only: [:destroy]

  def new
    @lesson = Lesson.new
    @program = Program.find(params[:program_id])
  end

  def create
    @program = Program.find(params[:program_id])
    @lesson = Lesson.new(lesson_params)
    @lesson.number = @program.lessons.count + 1
    @lesson.program = @program
    respond_to do |format|
      if @lesson.save
        # format.html { redirect_to program_path(@program), notice: "Lesson was successfully created." }
        # format.html { render :new }
        format.html { render :new }
        format.json
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.html { render :new, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @lesson.destroy
    redirect_to programs_path, notice: "Lesson was successfully destroyed."
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :number)
  end
end
