require_relative '../vendor/bundle/ruby/2.5.0/gems/twilio-ruby-5.29.0/lib/twilio-ruby'

class TwilioClient
  def self.notify(receiver)
    begin
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

      client.messages.create(
        body: 'Your ' + '🚽' + ' code is ' + '💩',
        from: 'whatsapp:' + ENV['TWILIO_PHONE_NUMBER'],
        to:   'whatsapp:' + ENV[receiver + '_PHONE_NUMBER']
      ).sid

    rescue Exception => e
      puts e

    end
  end
end
