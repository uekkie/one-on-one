class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :title, presence: true

  before_validation :prepare_questions

  def prepare_questions
    return if self.persisted?
    self.questions = Question.where(id: 1..4)
  end
end
