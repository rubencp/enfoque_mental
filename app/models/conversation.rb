class Conversation
  MESSAGES = [
    '¿Quién eres?',
    '¿Cuál es tu propósito en esta vida?',
    '¿Cuál es tu vocación?',
    '¿Cómo te sientes?',
    '¿Qué decides plasmar como tu obra maestra?',
    '¿Qué canción te motiva?',
    '¿Qué acción te necesita?'
  ].freeze

  def initialize(user)
    @user = user
  end

  def next_message
    update_message_nr
    @user.last_message_at = Time.now
    @user.save!

    MESSAGES[@user.message_nr - 1]
  end

  def send_reminder
    client  = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH']
    message = next_message

    client.account.messages.create(from: ENV['FROM_TWILIO_NUMBER'],
                                   to: @user.number, body: message)
  end

  def self.message(number)
    MESSAGES[number]
  end

  private

  def update_message_nr
    if @user.message_nr >= 6
      @user.message_nr = 0
      @user.conversation_nr += 1
    else
      @user.message_nr += 1
    end
  end
end
