load_paths = Dir['./vendor/bundle/ruby/2.5.0/gems/**/lib/']
$LOAD_PATH.unshift(*load_paths)

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

    rescue Exception => e
      puts e

    end
  end
end
