RSpec.describe Idea, type: :model do
  let(:user) { create(:user) }
  let(:idea) { create(:idea, user: user ) }

  describe '#Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user) }

    it '#Status should be active when creating it' do
      expect(idea[:status]).to eql(STATUS[:active])
    end
  end

  describe '#Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#Scopes' do
    it 'scopes #active ideas' do
      expect(Idea.active).to eq(Idea.where(status: STATUS[:active]))
    end
    
    it 'when create idea it will be scoped to active' do
      expect(Idea.active).to include(idea)
    end

    it 'get #newest ideas' do
      expect(Idea.ordered_by_date).to include(idea)
    end
  end

  describe '#Delegates' do
    it 'delegate username to user' do
      expect(idea.user_username).to eql(user.username)
    end

    it 'delegate email to user' do
      expect(idea.user_email).to eql(user.email)
    end
  end

  describe '#Act-As-Likeable' do
    it '#Like' do
      idea.like(user)
      expect(idea.get_likes.size).to eql(1)
    end

    it '#DisLike' do
      idea.like(user)
      idea.dislike(user)
      expect(idea.get_likes.size).to eql(0)
    end
  end

  describe '#Ability to change status' do
    it '#Hide idea' do
      idea.hide
      expect(idea.status).to eql(STATUS[:inactive])
    end

    it '#Activate idea' do
      idea2 = create(:idea, user: user, status: STATUS[:inactive]) 
      idea2.active
      expect(idea2.status).to eql(STATUS[:active])
    end
  end
end
