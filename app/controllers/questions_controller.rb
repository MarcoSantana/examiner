class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new()
    5.times { @question.distractors.build }
  end
  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(questions_params)
    if @question.save
      flash[:notice] = "Question created successfully"
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(questions_params)
      flash[:notice] = "Question updated successfully"
      redirect_to(:action => 'show', :id => @question.id)
    else
      render('edit')
    end
  end

  def delete
    @question = Question.find(params[:id])
  end

  def destroy
      question = Question.find(params[:id]).destroy
      flash[:notice] = "Question '#{question.content}' has been destroyed successfully"
      redirect_to(:action => 'index')
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def questions_params
      params.require(:question).permit(:question_set_id, :difficulty, :visible, :locked, :position, :content, :value, :distractors_attributes => [:id, :question_id, :option, :difficulty, :visible, :locked, :content, :right, :_destroy]  )
    end

  end
