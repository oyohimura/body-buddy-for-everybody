class SlotsStudentsController < ApplicationController
  before_action :set_slot_student, only: [:destroy]

  # def create
  #   @slot_student.user = current_user
  #   @slot_student.slot = Slot.find(params[:slot_id])
  #   if @slot_student.save
  #     redirect_to @slot_student.student, notice: 'Slot was successfully added.'
  #   else
  #     redirect_to @slot_student.student, alert: 'Something went wrong.'
  #   end
  # end

  def create_all
    @batch = Batch.find(params[:batch_id])
    all_slots_to_book = []
    @batch.program.lessons.each do |lesson|
      lesson.slots.where(batch: @batch).each { |slot| all_slots_to_book << slot }
    end
    params[:selected_slots].each_key do |k|
      unless params[:selected_slots][k] == ""
        slotstudent = SlotStudent.new
        slotstudent.user = current_user
        lesson_param = Lesson.find(k.to_i)
        slotstudent.slot = Slot.where(lesson: lesson_param, batch: @batch).first
        slotstudent.save!
      end
    end
    redirect_to program_batch_path(@batch.program, @batch)
  end

  def destroy
    @slot_student = SlotStudent.find(params[:id])
    batch = @slot_student.slot.batch
    @slot_student.destroy
    redirect_to program_batch_path(batch.program, batch), notice: 'You have un-registered successfully.'
  end

  private

  def set_slot_student
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  # def slot_student_params
  #   params.require(:slots_student).permit(:slot_id, :student_id)
  # end
end
