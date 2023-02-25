class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home ]

  def home
    @programs = Program.all
    render layout: 'homepage'
  end

  def index
    @users = User.where(teacher: true)
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
    lessons = Lesson.where(program: @programs)
    # The batch I am currently registered on
    @batch = current_user.batch # @batch.program to get the program
    start_date = params.fetch(:start_date, Date.today).to_date

      @slots = current_user.slots.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
