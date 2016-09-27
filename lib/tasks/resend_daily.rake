namespace :resend_daily do
  desc 'Re-Send SMS to users without activity'

  task re_send: :environment do
    User.older_than_hours(24).each { |user| user.send_reminder_message }
  end
end
