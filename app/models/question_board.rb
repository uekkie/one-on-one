class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :questions, length: {minimum: 1}
  after_initialize :build_default_questions, only: :create

  def build_default_questions
    self.questions = Question.where(id: 1..4)
  end
end
