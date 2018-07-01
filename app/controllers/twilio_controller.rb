require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_action :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
    # Use <Say> to give the caller some instructions
    r.say('finally fucking yes hell yes!!!!', voice: 'alice')
  end
  render_twiml(response)
end
  #
  # def voice
  #   response = Twilio::TwiML::VoiceResponse.new do |r|
  #     r.say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
  #     r.play 'http://linode.rabasa.com/cantina.mp3'
  #   end
  #
  #   render_twiml response
  # end
end
