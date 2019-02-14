class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :title, presence: true
  validates :user, presence: true

  before_validation :prepare_questions

  def prepare_questions
    return if self.persisted?

    [
      "この1週間で主に取り組んだことは何ですか？",
      "その中で、良かったこと、継続したいことは何ですか？",
      "逆に、困っていることは何ですか？",
      "その課題を解決するために、何か出来ることはありますか？",
    ].each do |title|
     self.questions.build(title: title)
    end
  end
end
