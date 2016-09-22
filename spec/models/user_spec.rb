require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#next' do
    let(:from_number) { '+4917664825233' }
    let(:user_conversation) { User.new_conversation(from_number) }

    it 'responds with the first message of the conversation' do
      expect(user_conversation.next).to eq('¿Quién eres?')
    end

    it 'gets different message on 2nd time' do
      user_conversation.next
      expect(user_conversation.next).to eq('¿Cuál es tu propósito en esta vida?')
    end

    it 'responds with the first message after all messages' do
      7.times { user_conversation.next }

      expect(user_conversation.next).to eq('¿Quién eres?')
    end
  end
end
