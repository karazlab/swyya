RSpec.describe Project, type: :model do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user ) }

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

  describe '#Scopes' do
    it 'scopes #active projects' do
      expect(Project.active).to eq(Project.where(status: STATUS[:active]))
    end
    
    it 'when create project it will be scoped to active' do
      expect(Project.active).to include(project)
    end

    it 'get #newest projects' do
      expect(Project.ordered_by_date).to include(project)
    end
  end

  describe '#Delegates' do
    it 'delegate username to user' do
      expect(project.user_username).to eql(user.username)
    end

    it 'delegate email to user' do
      expect(project.user_email).to eql(user.email)
    end
  end

  describe '#Act-As-Likeable' do
    it '#Like' do
      project.like(user)
      expect(project.get_likes.size).to eql(1)
    end

    it '#DisLike' do
      project.like(user)
      project.dislike(user)
      expect(project.get_likes.size).to eql(0)
    end
  end

  describe '#Ability to change status' do
    it '#Hide Project' do
      project.hide
      expect(project.status).to eql(STATUS[:inactive])
    end

    it '#Activate Project' do
      project2 = create(:project, user: user, status: STATUS[:inactive]) 
      project2.active
      expect(project2.status).to eql(STATUS[:active])
    end
  end
end
