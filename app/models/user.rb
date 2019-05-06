class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_attached_file :personal_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: "/images/missing.png"
  validates_attachment_content_type :personal_photo, content_type: /\Aimage/

  has_many :projects, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  before_create :assign_role_to_user

  # after_create :send_welcome_email, unless: Proc.new { Rails.env.eql?('test') }

  acts_as_voter

  private

  def assign_role_to_user
    add_role(ROLES[:user]) if roles.blank?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end
