class User < ApplicationRecord
    before_save {self.email = email.downcase} # this is used to save the entered email in downcase letters even if user enters any uppercase letter
    has_many :articles, dependent: :destroy

    validates :username, presence: true, uniqueness: { case_sensitive: false}, length: {minimum:3, maximum:25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i#format of email for email verification
    validates :email, presence: true, uniqueness: { case_sensitive: false}, length: { maximum:105},format: { with: VALID_EMAIL_REGEX }

    has_secure_password

end