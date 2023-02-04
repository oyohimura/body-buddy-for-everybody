class SlotsStudentsController < ApplicationController
  before_action :set_slot_student, only: [:destroy]
  before_action :set_student, only: [:create]

  def create
    @slot_student = SlotsStudent.new()
    @slot_student.student = @student
    @slot_student.slot = Slot.find(params[:slot_students][:slot_id])
    if @slot_student.save
      redirect_to @slot_student.student, notice: 'Slot was successfully added.'
    else
      redirect_to @slot_student.student, alert: 'Something went wrong.'
    end
  end

  def destroy
    @slot_student.destroy
    redirect_to @slot_student.student, notice: 'Slot was successfully removed.'
  end

  private

  def set_slot_student
    @slot_student = SlotsStudent.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  # def slot_student_params
  #   params.require(:slots_student).permit(:slot_id, :student_id)
  # end
end

@plant_tag = PlantTag.new()
@plant_tag.plant = @plant
@plant_tag.tag = Tag.find(params[:plant_tag][:tag_id])
if @plant_tag.save!
  redirect_to garden_path(@plant.garden)
