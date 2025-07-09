require "rails_helper"

RSpec.describe CreateUserMailer, type: :mailer do
  describe "send_email" do
    let(:email) { "to@example.org"}
    let(:mail) { CreateUserMailer.send_email(email) }

    it "renders the headers" do
      expect(mail.subject).to eq("Send email")
      expect(mail.to).to eq([email])
      expect(mail.from).to eq([email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
