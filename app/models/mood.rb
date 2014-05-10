class Mood < ActiveRecord::Base
  belongs_to :user

  moodFormatValidation = /\D+/
  phoneValidation 	   = /\d{10,11}/
  
  validates :feeling, length: {within: 3..20}, presence: true, format: {with: moodFormatValidation}, uniqueness: true
  validates :adjective, presence: true, format: {with: moodFormatValidation}
  validates :phonenumber, presence: true, format: {with: phoneValidation}
end