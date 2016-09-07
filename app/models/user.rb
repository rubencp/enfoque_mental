class User < ApplicationRecord


  MESSAGES = []
    MESSAGES << '¿Quién eres?'
    MESSAGES << '¿Cuál es tu propósito en esta vida?'
    MESSAGES << '¿Cuál es tu vocación?'
    MESSAGES << '¿Cómo te sientes?'
    MESSAGES << '¿Qué puedes y decides plasmar como tu obra maestra?'
    MESSAGES << '¿Qué canción te motiva a plasmar tu obra maestra?'
    MESSAGES << '¿Qué siguiente acción te necesita?'

  def initialize(someparams)
    super
    number = someparams[:number]
    message_nr = 0
    conversation_nr = 0
  end

  def increment_conversation
    self.message_nr += 1 
    if self.message_nr >= 7 
      self.message_nr = 0
      self.conversation_nr += 1
    end
    save
  end

  def self.new_conversation(phone_number)
    @user = User.find_or_create_by(number: phone_number)

  end

  def next
    increment_conversation
    MESSAGES[message_nr]
  end

  def last
    MESSAGES[message_nr]
  end

  def send_reminder_message
 
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH']

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    # @client.account.messages.create({
    #   :from => '+525549998395', 
    #   :to => self.number, 
    #   :body => last,  
    # }) 

    puts "Re-Sending :" + last + "to: " + self.number

  end

end
