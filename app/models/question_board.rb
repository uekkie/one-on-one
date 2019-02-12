class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :title, presence: true

  # before_validateを使う
  # after_initializeだとfindなどでも発動してしまう

  before_save :prepare_questions

  def prepare_questions
    # trueがいらない？
    return if self.persisted?
    self.questions = Question.where(id: 1..4)
  end
end
