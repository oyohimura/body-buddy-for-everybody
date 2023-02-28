class BatchesController < ApplicationController
  before_action :set_batch, only: []

  def index
    @program = Program.find(params[:program_id])
    @batches = Batch.where(program: @program)
  end

  def show
    @batch = Batch.find(params[:id])
    if current_user
      @your_slot_students = SlotStudent.where(user: current_user).where(slot: @batch.slots)
      @your_slot_students = @your_slot_students.sort_by { |ss| ss.slot.lesson.id }
    else
      @your_slot_students = []
    end
  end

  def new
    @batch = Batch.new
    @program = Program.find(params[:program_id])
  end

  def create
    @batch = Batch.new(batch_params)
    @program = Program.find(params[:program_id])
    @batch.program = @program
    if @batch.save
      redirect_to program_batch_path(program_id: @program.id, id: @batch.id), notice: 'Batch was successfully created.', status: :see_other
    else
      @batch = Batch.new
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @batch = Batch.find(params[:batch_id])
  end

  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      redirect_to program_batch_path(@batch), notice: 'Batch was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
    redirect_to programs_batches_path, notice: 'Batch was successfully deleted.'
  end

  private

  def batch_params
    params.require(:batch).permit(:start_time, :end_time, :max_students)
  end

  def set_batch
    @batch = Batch.find(params[:id])
  end
end
