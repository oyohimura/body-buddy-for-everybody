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
    @programs = Program.all
    @user = current_user
    @students = Student.where(user_id: current_user.id)
    @batchs = []
    @students.each do |student|
      @batchs << student.batch
    end0
    @programs_students =[]
    @batchs.each do |batch|
      @programs_students << batch.program
    end
  end
end
