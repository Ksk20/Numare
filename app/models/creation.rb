class Creation < ApplicationRecord
	belongs_to :customer
	belongs_to :person
	attachment :image
	attachment :cartoon

	validates :image, presence:true
end
