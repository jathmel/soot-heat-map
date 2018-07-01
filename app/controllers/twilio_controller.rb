require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable
  protect_from_forgery with: :exception

  after_action :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
    r.say('Welcome to the ICE alert system.', voice: 'alice')
  end
  render_twiml(response)
end

end
