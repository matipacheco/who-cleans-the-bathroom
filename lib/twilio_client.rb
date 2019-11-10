require 'twilio-ruby'

class TwilioClient
  def self.notify(receiver)
    begin
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      client.messages.create(
        body: 'Your ' + '🚽' + ' code is ' + '💩',
        from: 'whatsapp:' + ENV['TWILIO_PHONE_NUMBER'],
        to:   'whatsapp:' + ENV[receiver + '_PHONE_NUMBER']
      ).sid

    rescue
      raise 'Unable to notify'

    end
  end
end
