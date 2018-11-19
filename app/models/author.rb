class Author < ApplicationRecord
  validates :email, :allow_blank => false, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :fname, :presence => true
  validates :lname, :presence => true
  has_many :posts
  
end
