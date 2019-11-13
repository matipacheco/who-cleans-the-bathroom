const accountSid    = process.env['TWILIO_ACCOUNT_SID'];
const authToken     = process.env['TWILIO_AUTH_TOKEN'];
const twilioClient  = require('twilio')(accountSid, authToken);

const _MS_PER_DAY = 1000 * 60 * 60 * 24;

function getReceiver(today, startDate) {
  return (Math.floor((today - startDate) / _MS_PER_DAY) % 2 === 0) ? 'EVEN' : 'ODD'
}

exports.handler = async function(event) {
  let today     = new Date();
  let startDate = new Date(process.env['START_DATE']);

  twilioClient.messages
    .create({
      from: 'whatsapp:' + process.env['TWILIO_PHONE_NUMBER'],
      to: 'whatsapp:' + process.env[getReceiver(today, startDate) + '_PHONE_NUMBER'],
      body: 'Your ' + '🚽' + ' code is ' + '💩'
    })
    .then(message => {
      console.log(message.sid)
    });
};