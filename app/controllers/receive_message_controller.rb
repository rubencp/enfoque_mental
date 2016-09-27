class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    user        = User.new(number: from_number)

    user.increment_conversation

    render plain: user.next_message
  end
end
