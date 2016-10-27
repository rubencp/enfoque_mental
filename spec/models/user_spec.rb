require 'rails_helper'

RSpec.describe User do

 let(:pasive_users) { User.older_than_hours(23) }

  describe 'older_than_hours' do
   before { allow(pasive_users).to receive(:each) }

   it 'returns users without activity' do
    expect(pasive_users).not_to be(nil)
  end

   it 'is each-able' do
    expect(pasive_users).to have_received(:each)
   end

end

end


# Attempting to test this behavior from lib/tasks/resend_daily.rake
# User.older_than_hours(23).each
