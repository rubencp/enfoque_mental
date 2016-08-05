class Conversation

  def initialize(phone_number)
    @user = User.find_or_create_by(:number => phone_number)
    @messages = []
    @messages << "¿Quién eres?"
    @messages << "¿Cuál es tu propósito en esta vida?"
    @messages << "¿Cuál es tu vocación?"
    @messages << "¿Cómo te sientes?"
    @messages << "¿Qué meta puedes y decides plasmar como tu obra maestra?"
    @messages << "¿Qué canción te motiva a plasmar tu obra maestra?"
    @messages << "¿Qué siguiente acción te necesita?"
  end

  def next
   sms_count = @user.message_nr
   @user.message_nr += 1
   @user.save
   @messages[sms_count]
  end

  def with
    @user
  end

end


   


