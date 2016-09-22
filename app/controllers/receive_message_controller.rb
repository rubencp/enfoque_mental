class ReceiveMessageController < ApplicationController
  def receive
    from_number = params['From']
    message     = User.new_conversation(from_number).next

    render plain: message
  end
end
