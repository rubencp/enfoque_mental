require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#next_message' do
    let(:from_number) { '+4917664825233' }
    let(:user)        { User.new(number: from_number) }

    it 'responds with the first message of the conversation' do
      expect(user.next_message).to eq('¿Quién eres?')
    end

    it 'gets different message on 2nd time' do
      user.next_message
      user.increment_conversation
      expect(user.next_message).to eq('¿Cuál es tu propósito en esta vida?')
    end

    it 'responds with the first message after all messages' do
      7.times { user.next_message }

      expect(user.next_message).to eq('¿Quién eres?')
    end
  end
end
