class MessagesController < ApplicationController
  def reply
    message_body = params["Body"]
    sender_number = params["From"]
    our_number = params["To"]
    puts message_body
    boot_twilio
    sms = @client.messages.create(
      from: our_number,
      to: sender_number,
      body: "Hello there, thanks for texting me. Your number is #{sender_number}."
    )
  end

  def show
    #code
  end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
