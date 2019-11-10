require 'date'
require_relative 'lib/twilio_client'

def lambda_handler(event:, context:)
  today       = Date.today
  start_date  = Date.parse(ENV['START_DATE'])

  TwilioClient.notify(
    ((today - start_date).to_i % 2) == 0 ? 'EVEN' : 'ODD'
  )
end
