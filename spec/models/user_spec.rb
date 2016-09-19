require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#next' do
    let(:from_number)  { '+4917664825233' }
    let(:user_conversation) { User.new_conversation(from_number) }

    it 'responds with the first message of the conversation' do
      expect(user_conversation.message).to eq('¿Quién eres?')
    end

    it 'gets different message on 2nd time' do
      user_conversation.message
      user_conversation.increment_conversation
      expect(user_conversation.message).to eq('¿Cuál es tu propósito en esta vida?')
    end

    it 'responds with the first message after all messages' do
      7.times { user_conversation.increment_conversation }

      expect(user_conversation.message).to eq('¿Quién eres?')
    end

    it 'gets last message sent' do
      expect(user_conversation.message).to eq('¿Quién eres?')
      expect(user_conversation.message).to eq('¿Quién eres?')
      user_conversation.increment_conversation   
      expect(user_conversation.message).to eq('¿Cuál es tu propósito en esta vida?')
      expect(user_conversation.message).to eq('¿Cuál es tu propósito en esta vida?')
    end
  end
end