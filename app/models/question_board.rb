class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions

  before_save :prepare_questions

  def prepare_questions
    return true if self.id.present?
    self.questions = Question.where(id: 1..4)
  end
end
