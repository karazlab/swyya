RSpec.describe Comment, type: :model do
  describe '#Validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:idea) }
  end

  describe '#Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:idea) }
  end
end
