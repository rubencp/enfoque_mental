class User < ApplicationRecord
  MESSAGES = []
  MESSAGES << '¿Quién eres?'
  MESSAGES << '¿Cuál es tu propósito en esta vida?'
  MESSAGES << '¿Cuál es tu vocación?'
  MESSAGES << '¿Cómo te sientes?'
  MESSAGES << '¿Qué decides plasmar como tu obra maestra?'
  MESSAGES << '¿Qué canción te motiva?'
  MESSAGES << '¿Qué siguiente acción te necesita?'

  scope :older_than_hours, -> (n) { where('last_message_at < ?', Time.now - n.hours) }

  def initialize(someparams)
    super
    self.number = someparams[:number]
    self.message_nr = 0
    self.conversation_nr = 0
    self.last_message_at = Time.now
  end

  def increment_conversation
    self.message_nr += 1
    if self.message_nr >= 7
      self.message_nr = 0
      self.conversation_nr += 1
    end
    update_last_message_timestamp
  end

  def update_last_message_timestamp
    self.last_message_at = Time.now
    save
  end

  def self.new_conversation(phone_number)
    @user = User.find_or_create_by(number: phone_number)
  end

  def next_message
    MESSAGES[message_nr]
  end

  def send_reminder_message
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(from: ENV['FROM_TWILIO_NUMBER'],
                                    to: number,
                                    body: next_message)

    puts 'Re-Sending:' + next_message + ' to: ' + number
  end
end
