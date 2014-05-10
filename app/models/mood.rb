class Mood < ActiveRecord::Base
  belongs_to :user

  moodFormatValidation = /\D+/
  phoneValidation 	   = /\d/
  
  validates :feeling, length: {within: 3..20}, presence: true, format: {with: moodFormatValidation}, uniqueness: true
  validates :adjective, presence: true, format: {with: moodFormatValidation}
  validates :phonenumber, presence: true, length: {within: 10..11}, format: {with: phoneValidation}
end