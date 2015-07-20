class Message < ActiveRecord::Base
  before_create :send_message

  private

  def send_message
    begin
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/AC89f9295f454ac3921f0a8d055aa04b35/Messages.json',
    :user => ENV['TWILIO_ACCOUNT_SID'],
    :password => ENV['TWILIO_AUTH_TOKEN'],
    :payload => { :Body => body,
                  :To => to,
                  :From => from }
      ).execute
    rescue
      false
    end
  end
end
