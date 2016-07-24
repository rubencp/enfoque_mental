class ReceiveMessageController < ApplicationController

  def receive
   next_message = Conversation.new(params['phone']).next


   user = User.first
   sms_count = user.message_nr
   user.message_nr += 1
   user.save

   message = Conversation.messages[sms_count]

   twiml = Twilio::TwiML::Response.new do |r|
    r.Message message 
   end
   twiml.text

   #debug = message +  sms_count.to_s + " "
   render plain: message
  end

  private

  def twilio_xml(message)
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Message>"+message+"</Message></Response>"
  end

  



end


