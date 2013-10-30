class Bet < ActiveRecord::Base
  
  STATUS = { open: 1, close: 2, win: 3, lose: 4 }
  
  monetize :amount_cents
  belongs_to :user
  belongs_to :tool
  validates :time, :quote_start, :quote_final, :amount_cents, :tool, presence: true
  validates :amount_cents, numericality: { greater_than: 0 }
  
  validates :status, inclusion: {in: STATUS.values}
  
  validate :user_balance_must_be_greater_that_bet, :only_one_bet_allowed_at_time
  
  
  scope :actual, -> { where(status: STATUS[:open]) }
  
  
  private
  
  def user_balance_must_be_greater_that_bet
    errors.add(:low_balance, "Недостаточно средств на личном счету") if user.money_total_with_bets < amount
  end
  
  # Должна существовать только одна ставка на инструмент
  def only_one_bet_allowed_at_time
    errors.add(:already_bet, "Вы уже сделали ставку") if user.bets.actual.where(tool_id: self.tool).present?
  end
end
