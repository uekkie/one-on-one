class AnswerBoardsController < ApplicationController
  before_action :set_token, :set_invite, :set_questions, except: %i(index show)
  # もう一つ認証のかかるapplication_controllerを作って切り分ける
  before_action :authenticate_user!, only: %i(index show)
  
  def index
    @boards = current_user.answer_boards.order(created_at: :desc)
  end

  def show
    @board = current_user.answer_boards.find(params[:id])
  end

  def new
    # exist?の方がいいかも
    # redirect系はbefore_actionにする（メインの処理ではないため）
    # before_actionだとcreateでも使いまわせる
    # 招待を判定するmodelにmethodを作った方がわかりやすくなる
    # @invite.answer_board.present?から判定する
    # has_one なので、 nil か オブジェクトが返るかになる
    # activerecord の方になる
    #  existは、 countよりももっとsql的には効率いいクエリになる
    if AnswerBoard.where(invite: @invite).count
      redirect_to thanks_url, notice: 'すでに回答済みです'
    end

    @answer_board = AnswerBoard.new
    
    @questions.each do |question|
      @answer_board.answers.new(question: question)
    end
  end

  def create
    # invite.answer_boards.createの方がしっくりする
    # invite.answer_boardsにinviteを引数で渡さない方法を探す
    # トランザクションが挟まないとデータがおかしくなるのでbuildする方がいい
    # この全体の処理をmodelに持ってきた方がスマート
    @answer_board = @invite.user.answer_boards.create(
      invite: @invite
    )
    # form objectやnestedを使う方がいいかも（nestedの方が望ましいかも）
    # answerを複数ビルドして最後に親をsaveすると保存されてない子がトランザクションをかけて一気に保存される
    @questions.each do |question|
      answer = @answer_board.answers.build(
        question: question,
        content: params[:answer_board][:answers][question.id.to_s][:content]
      )
      answer.save
    end

    if @answer_board.save
      redirect_to thanks_url, notice: '回答が送信されました'
    else
      render :new, token: @token
    end
  end

  private
  def set_token
    @token = params[:token] || params[:answer_board][:token]
  end

  def set_invite
    @invite = Invite.find_by(token: @token)
  end
  
  def set_questions
    @questions = @invite.question_board.questions
  end
end
