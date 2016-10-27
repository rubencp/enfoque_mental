namespace :resend_daily do
  desc 'Re-Send SMS to users without activity'

  task re_send: :environment do
    User.older_than_hours(23).each { |u| Conversation.new(u).send_reminder }
  end
end
