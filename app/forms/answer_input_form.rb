class AnswerInputForm
  include ActiveModel::Model

  attr_accessor :answers, :invite

  def answers_attributes=(attributes)
    @answers ||= []
    attributes.each do | i, answer_param |
      @answers.push(Answer.new(answer_param))
    end
  end

  def to_model
    @invite.user.answer_boards.build(invite: @invite, answers: @answers)
  end

  def save
    answer_board = to_model
    return false if answer_board.invalid?
    answer_board.save
    true
  end
end
