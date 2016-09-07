class User < ApplicationRecord
  before_save :increment_conversation

  def initialize(someparams)
    super
    self.number = someparams[:number]
    self.message_nr = 0
    self.conversation_nr = 0
  end

  def increment_conversation
    if message_nr >= 7
      self.message_nr = 0
      self.conversation_nr += 1
    end
  end

  def new_conversation(phone_number)
    @user = User.find_or_create_by(number: phone_number)
    @messages = []
    @messages << '¿Quién eres?'
    @messages << '¿Cuál es tu propósito en esta vida?'
    @messages << '¿Cuál es tu vocación?'
    @messages << '¿Cómo te sientes?'
    @messages << '¿Qué puedes y decides plasmar como tu obra maestra?'
    @messages << '¿Qué canción te motiva a plasmar tu obra maestra?'
    @messages << '¿Qué siguiente acción te necesita?'
  end

  def next
    sms_count = @user.message_nr
    @user.message_nr += 1
    @user.save
    @messages[sms_count]
  end

  def self.send_reminder_message
 
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH']

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
      :from => '+525549998395', 
      :to => '+4917664825244', 
      :body => 'Ya hice mi tarea, que sigue ahora?',  
    }) 

  end

end
