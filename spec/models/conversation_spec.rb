require 'rails_helper'

RSpec.describe Conversation, type: :controller do
  describe '#next' do
    let(:from_number)  { '+4917664825233' }
    let(:conversation) { Conversation.new(from_number) }

    it 'responds with the first message of the conversation' do
      expect(conversation.next).to eq('¿Quién eres?')
    end

    it 'gets different message on 2nd time' do
      conversation.next
      expect(conversation.next).to eq('¿Cuál es tu propósito en esta vida?')
    end

    it 'responds with the first message after all messages' do
      conversation.next
      conversation.next
      conversation.next
      conversation.next
      conversation.next
      conversation.next
      conversation.next

      expect(conversation.next).to eq('¿Quién eres?')
    end
  end
end
