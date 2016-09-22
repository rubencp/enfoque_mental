class User < ApplicationRecord

  MESSAGES = []
    MESSAGES << '¿Quién eres?'
    MESSAGES << '¿Cuál es tu propósito en esta vida?'
    MESSAGES << '¿Cuál es tu vocación?'
    MESSAGES << '¿Cómo te sientes?'
    MESSAGES << '¿Qué puedes y decides plasmar como tu obra maestra?'
    MESSAGES << '¿Qué canción te motiva a plasmar tu obra maestra?'
    MESSAGES << '¿Qué siguiente acción te necesita?'


  scope :older_than, -> (days) { where("last_message_at < ?", Date.today-days) }
  scope :older_than_hours, -> (hours) { where("last_message_at < ?", Time.now-hours) }


  def initialize(someparams)
    super
    default_values
  end

  def increment_conversation
    self.message_nr += 1 
    if self.message_nr >= 7 
      self.message_nr = 0
      self.conversation_nr += 1
    end
    self.last_message_at = Time.now
    save
  end

  def self.new_conversation(phone_number)
    @user = User.find_or_create_by(number: phone_number)

  end

  def message
    message = MESSAGES[message_nr]
  end


  def send_reminder_message
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH'] 
     
    @client.account.messages.create({
       :from => '+525549998395', 
       :to => self.number, 
       :body => message,  
     }) 

    puts "Re-Sending:" + message + " to: " + self.number

  end


  private
    def default_values
      self.message_nr ||= 0
      self.conversation_nr ||= 0
      self.last_message_at ||= Time.now
    end

end
