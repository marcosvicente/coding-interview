# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateUserMailer, type: :mailer do
  describe 'send_email' do
    let(:email_to) { 'to@example.org' }
    let(:email_from) { 'from@example.com' }
    let(:mail) { CreateUserMailer.send_email(email_to) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to Tweets!')
      expect(mail.to).to eq([email_to])
      expect(mail.from).to eq([email_from])
    end
  end
end
