class User < ApplicationRecord
 before_save  :increment_conversation

  def initialize (someparams)
    super
    self.number = someparams[:number]
    self.message_nr = 0
    self.conversation_nr = 0
  end

 
 def increment_conversation
  if self.message_nr >= 6
    self.message_nr = 0
    self.conversation_nr += 1
  end
 end

end
