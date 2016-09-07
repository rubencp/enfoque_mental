namespace :resend_daily do

 desc "Re-Send SMS to users without activity"

 task: :re_send => :production do
   User.without_activity.send
 end

 task: :re_send => :development do
   puts "Re-Sending SMS..."

 end

end
