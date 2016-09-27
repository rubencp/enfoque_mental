class ReceiveMessageController < ApplicationController
  def receive
    user          = User.find_or_create_by(number: params['From'])
    conversation  = Conversation.new(user)

    render plain: conversation.next_message
  end
end
