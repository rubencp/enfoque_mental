require 'rails_helper'

RSpec.describe ReceiveMessageController, type: :controller do
  describe '#receive' do
    let(:first_message) { '¿Quién eres?' }

    let(:phone_number) { '+5213333595550' }

    before do

      allow_any_instance_of(User).to receive(:next) { first_message }


      process :receive, method: :post, params: { from: phone_number }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns expected body first time' do
      expect(response.body).to eq(first_message)
    end

    # TODO: Test that Conversation is created with phone_number param
  end
end
