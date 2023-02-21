class ReviewsController < ApplicationController
  def new
  end

  def edit
  end

  def update
  end

  def create
    @review = Review.new(review_params)
    @program = Program.find(params[:program_id])
    @review.program = @program
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to program_path(@program) }
        format.json
      else
        # flash[:alert] = "Something went wrong."
        format.html { render "programs/show", status: :unprocessable_entity }
        format.json 
      end
    end


  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to program_path(@review.program)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
