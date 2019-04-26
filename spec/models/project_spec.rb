RSpec.describe Project, type: :model do
  let(:project) { create(:project, user: create(:user) ) }

  describe '#Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:github_link) }

    it '#Status should be active when creating it' do
      expect(project[:status]).to eql(STATUS[:active])
    end
  end

  describe '#Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
