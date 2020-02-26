RSpec.describe UserMailer, type: :mailer do
  describe 'Welcome Email' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq("Warm Welcome, It's time to share your work")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["hello@sawia.xyz"])
    end
  end
end
