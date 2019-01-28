# board = QuestionBoard.new

questions_titles = [
  "この1週間で主に取り組んだことは何ですか？",
  "その中で、良かったこと、継続したいことは何ですか？",
  "逆に、困っていることは何ですか？",
  "その課題を解決するために、何か出来ることはありますか？",
]

questions_titles.each do |title|
  Question.new(title: title).save!
end
