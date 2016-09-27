require 'rails_helper'

RSpec.describe ReceiveMessageController, type: :controller do
  describe '#receive' do
    let(:first_message) { '¿Quién eres?' }

    let(:number) { '+5213333595550' }

    before do
      allow_any_instance_of(Conversation).to receive(:next_message) { first_message }
      allow(User).to receive(:find_or_create_by)
    end

    subject! { process :receive, method: :post, params: { From: number } }

    it 'returns expected body first time' do
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(first_message)
    end

    it 'gets correct user' do
      expect(User).to have_received(:find_or_create_by).with(number: number)
    end
  end
end
