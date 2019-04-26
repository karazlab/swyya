RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '#Validations' do
    it { is_expected.to validate_presence_of(:email) }

    it 'expect User has a role' do
      expect(user.has_role?(ROLES[:user])).to eql(true)
    end
  end
end