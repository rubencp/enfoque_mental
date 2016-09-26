class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    user        = User.new_conversation(from_number)
    message     = user.next_message

    user.increment_conversation

    render plain: message
  end
end
