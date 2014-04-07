class Mood < ActiveRecord::Base
  belongs_to :user

  moodFormatValidation = /\D+/
  
  validates :feeling, length: {within: 3..20}, presence: true, format: {with: moodFormatValidation}, uniqueness: true
  validates :adjective, length: {within: 3..20}, presence: true, format: {with: moodFormatValidation}
end