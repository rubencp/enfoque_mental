class User < ApplicationRecord
  scope :older_than_hours, -> (n) { where('last_message_at < ?', Time.now - n.hours) }

  def initialize(someparams)
    super
    self.number = someparams[:number]
    self.message_nr = 0
    self.conversation_nr = 0
  end
end
