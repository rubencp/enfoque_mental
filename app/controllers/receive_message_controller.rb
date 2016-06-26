class ReceiveMessageController < ApplicationController

  def receive
   next_message = Conversation.new(params['phone']).next
   
   render plain: twilio_xml(next_message)
  end

  private

  def twilio_xml(message)
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Message>"+message+"</Message></Response>"
  end

end