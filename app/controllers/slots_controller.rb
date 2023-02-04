class SlotsController < ApplicationController
  before_action :set_lesson

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)
    @slot.lesson = Lesson.find(params[:lesson_id])
    if @slot.save
      redirect_to program_batch_path(@lesson.batch), notice: "Slot was successfully created."
    else
      render :new
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to program_batch_path(@lesson.batch), notice: "Slot was successfully destroyed."
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def slot_params
    params.require(:slot).permit(:start_time, :end_time)
  end
end
