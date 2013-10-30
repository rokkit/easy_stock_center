class Bet < ActiveRecord::Base
  monetize :amount_cents
  belongs_to :user
  validates :time, :quote_start, :quote_final, :amount_cents, presence: true
  validates :amount_cents, numericality: { greater_than: 0 }
  validate :user_balance_must_be_greater_that_bet
  
  private
  
  def user_balance_must_be_greater_that_bet
    errors.add(:low_balance, "Недостаточно средств на личном счету") if user.money_total < amount
  end
  
  # Должна существовать только одна ставка на инструмент
  def only_one_bet_allowed_at_time
    errors.add(:already_bet, "Вы уже сделали ставку")
  end
end
