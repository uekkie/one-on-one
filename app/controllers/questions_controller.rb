class QuestionsController < ApplicationController
  before_action :set_board, only: %i(show create)

  def index
  end

  def show
  end


  def new
    @question = Question.new
  end

  def create
    @question = @board.questions.build(question_params)

    if @question.save
      redirect_to question_board_url(@board), notice: 'Question Created!'
    else
      render :new
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
