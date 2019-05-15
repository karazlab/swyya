RSpec.describe User, type: :model do
  let(:user)      { create(:user) }
  let(:auth_hash) { OmniAuth::AuthHash.new({
    provider: 'github',
    uid:      '1234',
    info: {
      email:    Faker::Internet.email,
      name:     Faker::Name.name,
      nickname: Faker::Internet.username
    }
  }) }

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
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
  
  describe '#from_omniauth' do
      it 'retrieves an existing user' do
        password = Faker::Internet.password
        user = User.new(
          provider:              'github', 
          uid:                   '1234',
          username:              Faker::Internet.username,
          email:                 Faker::Internet.email,
          password:              password, 
          password_confirmation: password
        )
        user.save
        omniauth_user = User.from_omniauth(auth_hash)

        expect(user).to eq(omniauth_user)
    end
  
    it 'creates a new user if one doesnt already exist' do
      expect(User.count).to eq(0)
  
      omniauth_user = User.from_omniauth(auth_hash)
      expect(User.count).to eq(1)
    end
  end
end