class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board

  def index
    @questions = @board.questions
  end

  def show
  end

  def create
    @question = @board.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_question_board_url(current_user, @board), notice: 'Question Created!'}
      else
        format.html { render :new }
      end
    end
  end

  def update

  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def set_board
    @board = current_user.question_boards.find(params[:question_board_id])
  end

end
