require 'twilio-ruby' 
 
# put your own credentials here 
# LIVE
# account_sid = 'AC0314fc9f3347bfed7a8c9e90a34e51ce' 
# auth_token = '964873b981b78439c4a71228f1e38d00'

# TEST
account_sid = 'AC0314fc9f3347bfed7a8c9e90a34e51ce' 
auth_token = '964873b981b78439c4a71228f1e38d00'


# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
  :from => '+4915735996394', 
  :to => '+5213333595696', 
  :body => 'Ya hice mi tarea, que sigue ahora?',  
}) 