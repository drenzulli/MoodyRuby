class User < ActiveRecord::Base
	has_many :moods, :dependent => :destroy
end
