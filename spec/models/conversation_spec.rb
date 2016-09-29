require 'rails_helper'

RSpec.describe Conversation do
  let(:number)       { '+4917664825233' }
  let(:user)         { User.new(number: number) }
  let(:conversation) { Conversation.new(user) }

  describe '#next_message' do
    before { allow(user).to receive(:save!) }

    it 'responds with the first message of the conversation' do
      expect(conversation.next_message).to eq('¿Quién eres?')
    end

    it 'saves user to the database' do
      conversation.next_message

      expect(user).to have_received(:save!)
    end

    it 'gets different message on 2nd time' do
      conversation.next_message

      expect(conversation.next_message).to eq('¿Cuál es tu propósito en esta vida?')
    end

    it 'responds with the first message after all messages' do
      7.times { conversation.next_message }

      expect(conversation.next_message).to eq('¿Quién eres?')
      expect(user.conversation_nr).to eq(1)
    end

    it 'updates last message timestamp' do
      conversation.next_message

      expect(user.last_message_at).not_to be(nil)
    end
  end

  describe '#send_reminder_message' do
    let(:messages) { double('messages') }
    let(:account)  { OpenStruct.new(messages: messages) }
    let(:client)   { OpenStruct.new(account: account) }

    it 'sends call to twilio' do
      ENV['FROM_TWILIO_NUMBER'] = 'from'
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(messages).to receive(:create)
        .with(from: 'from', to: number, body: '¿Quién eres?')

      conversation.send_reminder
    end
  end
end
