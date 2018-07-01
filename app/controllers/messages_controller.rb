class MessagesController < ApplicationController
  def reply
    # byebug
    # = params[body]
    message_body = params["Body"]
    puts message_body
    boot_twilio
    options = message_body.downcase.split(' ')


    if message_body.split(' ').length >= 1
      if options.first == 'raid'
        # gsub(/\s+/, '')
        puts 'RAID!'
        raid_reply
        zip = options[1]
        Location.find_or_create_by(zip: zip.to_i)
        byebug
      elsif options.first == 'new'
        puts 'NEW SUBSCRIBER'
        welcome_reply
      elsif options.first == 'help'
        pust 'HELP'
      end
    else
      puts 'error'
      puts options.first
    end

  end

  def welcome_reply
    message_body = params["Body"]
    sender_number = params["From"]
    our_number = params["To"]

    boot_twilio
    sms = @client.messages.create(
      from: our_number,
      to: sender_number,
      body: "Hello there! Your number is #{sender_number}. And your area is _________... We will alert you with news happening in your area."
    )
  end

  def raid_reply
    # can have a list of clients from a query to the db and do a loop to iterate through them to mass send sms
    message_body = params["Body"]
    sender_number = params["From"]
    our_number = params["To"]

    boot_twilio
    sms = @client.messages.create(
      from: our_number,
      to: sender_number,
      body: "There's a potential raid in your area--please contact your region's ambassador for further guidance."
    )
  end

  def show

  end

  private

  def boot_twilio
    account_sid = 'AC1812bc86fdf2a2b09fa1da9551bc0307'
    auth_token = 'd957a2617b2a29e12ee126e142f4df62'
    # account_sid = Rails.application.secrets.twilio_sid
    # auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
