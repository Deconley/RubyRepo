class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships, :foreign_key => "user_id", :class_name => "Friendship"
  has_many :friends, :through => :friendships, source: :friend

  has_many :friended, :foreign_key => "friend_id", :class_name => "Friendship"
  has_many :friended_by, :through => :friended, source: :user


  has_many :invites, :foreign_key => "user_id", :class_name =>"Invite"
  has_many :invitees, :through => :invites, source: :contact

  has_many :invited, :foreign_key => "contact_id", :class_name => "Invite"
  has_many :invited_by, :through => :invited, source: :user

  before_save :downcase_fields

  validates :first_name, :last_name, presence: true, length: 2..30
  validates_format_of :first_name, :last_name, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, length: { minimum: 4 }

  def downcase_fields
        self.first_name.downcase!
        self.last_name.downcase!
        self.email.downcase!
    end
end
