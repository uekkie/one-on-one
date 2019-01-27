class InviteMailer < ApplicationMailer
  def creation_email(invite)
    @board = invite.question_board
    @token = invite.survey_token
    mail(
      subject:  '質問が届きました',
      to:       invite.member.email,
      from:     invite.user.email
    )
  end
end
