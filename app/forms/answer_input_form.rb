class AnswerInputForm
  include ActiveModel::Model

  attr_accessor :answers, :invite

  def answers_attributes=(attributes)
    @answers ||= []
    attributes.each_value do | answer_param |
      @answers.push(Answer.new(answer_param))
    end
  end

  def to_model
    @invite.build_answer_board(answers: @answers)
  end

  def save
    answer_board = to_model
    return false if answer_board.invalid?
    answer_board.save
    true
  end
end
