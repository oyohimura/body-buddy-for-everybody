class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @programs = Program.all
  end

  def index
  end

  def show
  end

  def profile
    @user = User.find(params[:user_id])
  end

  def dashboard
    # @programs = Program.all
    @user = current_user
    # @students = User.where(user_id: current_user.id)
    # All my programs (as a teacher)
    @programs = Program.where(user: current_user)
    # The batch I am currently registered on
    @batch = current_user.batch # @batch.program to get the program
  end
end
