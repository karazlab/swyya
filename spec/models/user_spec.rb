RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe '#Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }

    it 'expect User has a role' do
      expect(user.has_role?(ROLES[:user])).to eql(true)
    end
  end

  describe '#Associations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
    it { is_expected.to have_many(:ideas).dependent(:destroy) }
  end
end