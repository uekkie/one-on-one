class InviteMailer < ApplicationMailer
  def creation_email(invite)
    @board = invite.question_board
    mail(
      subject:  '質問が届きました',
      to:       invite.member.email,
      from:     invite.user.email
    )
  end
end
