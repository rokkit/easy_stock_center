class Tool < ActiveRecord::Base
  belongs_to :traderoom
  has_many :bets, dependent: :destroy
  
  validates :name, :symbol, presence: true
  mount_uploader :avatar, AvatarUploader
  
  def actual_bets_for(current_user)
    self.bets.actual.where(user_id: current_user).first
  end
  
end
