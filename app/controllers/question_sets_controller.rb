class QuestionSetsController < ApplicationController
  before_action :set_question_set, only: [:show, :edit, :update, :destroy]

  def index
    @question_sets = QuestionSet.all
  end

  def show
    @question_set = QuestionSet.find(params[:id])
  end

  def new
    @question_set = QuestionSet.new()
    @questions = @question_set.questions.build
    10.times { @question_set.questions.build }
  end
  # POST /question_sets
  # POST /question_sets.json
  def create
    @question_set = QuestionSet.new(question_set_params)
    if @question_set.save
      flash[:notice] = "QuestionSet created successfully"
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @question_set = QuestionSet.find(params[:id])
  end

  def update
    @question_set = QuestionSet.find(params[:id])
    if @question_set.update_attributes(question_set_params)
      flash[:notice] = "QuestionSet updated successfully"
      redirect_to(:action => 'show', :id => @question_set.id)
    else
      render('edit')
    end
  end

  def delete
    @question_set = QuestionSet.find(params[:id])
  end

  def destroy
      question_set = QuestionSet.find(params[:id]).destroy
      flash[:notice] = "QuestionSet '#{question_set.content}' has been destroyed successfully"
      redirect_to(:action => 'index')
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_set
      @question_set = QuestionSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_set_params
      params.require(:question_set).permit(:subject_id, :user_id, :difficulty, :visible, :locked, :position, :content, :questions_attributes => [:id, :difficulty, :visible, :locked, :position,:content, :value, :_destroy])
    end

end
