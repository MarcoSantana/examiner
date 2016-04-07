class QuizzesController < ApplicationController
  
  
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new()
  end
  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quizzes_params)
    if @quiz.save
      flash[:notice] = "Quiz created successfully"
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(quizzes_params)
      flash[:notice] = "Quiz updated successfully"
      redirect_to(:action => 'show', :id => @quiz.id)
    else
      render('edit')
    end
  end

  def delete
    @quiz = Quiz.find(params[:id])
  end

  def destroy
      quiz = Quiz.find(params[:id]).destroy
      flash[:notice] = "Quiz '#{quiz.name}' has been destroyed successfully"
      redirect_to(:action => 'index')
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_params
      params.require(:quiz).permit(:description, :application_date, :difficulty, :visible, :locked, :visible, :duration)
    end
end
