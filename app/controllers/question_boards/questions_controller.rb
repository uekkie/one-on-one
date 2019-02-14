class QuestionBoards::QuestionsController < ApplicationController
  before_action :set_question_board, only: %i(new create)

  def new
    @question = Question.new
  end

  def create
    @question = @question_board.questions.build(question_params)

    if @question.save
      redirect_to question_board_url(@question_board), notice: "「#{@question.title}」を追加しました🚀"
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def set_question_board
    @question_board = current_user.question_boards.find(params[:question_board_id])
  end

end
