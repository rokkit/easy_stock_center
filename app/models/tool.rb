class Tool < ActiveRecord::Base
  belongs_to :traderoom
  
  validates :name,:symbol, presence: true
  mount_uploader :avatar, AvatarUploader
  
  def quote
  end
end
