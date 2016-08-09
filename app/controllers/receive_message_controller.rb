class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    message = Conversation.new(from_number).next

    render plain: message
  end
end
