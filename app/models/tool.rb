class Tool < ActiveRecord::Base
  belongs_to :traderoom
  has_many :bets, dependent: :destroy
  
  validates :name, :symbol, presence: true
  mount_uploader :avatar, AvatarUploader
  
end
