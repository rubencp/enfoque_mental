namespace :resend_daily do

 desc "Re-Send SMS to users without activity"

 task :re_send => :environment do

   @users_to_resend = User.older_than_hours(24)

   @users_to_resend.each do |user|
    user.send_reminder_message
   end

 end

end
