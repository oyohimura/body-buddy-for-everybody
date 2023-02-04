class LessonsController < ApplicationController
  before_action :set_lesson, only: [:destroy]

  def new
    @lesson = Lesson.new
    @batch = Batch.find(params[:batch_id])
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @batch = Batch.find(params[:batch_id])
    @lesson.batch = @batch
    if @lesson.save
      redirect_to batch_path(@batch), notice: "Lesson was successfully created."
    else
      render :new
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path, notice: "Lesson was successfully destroyed."
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :number)
  end
end
