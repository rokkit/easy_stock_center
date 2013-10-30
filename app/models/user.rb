class User < ActiveRecord::Base
  rolify
  monetize :money_total_cents
  
  has_many :bets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
    # Средства на счету, за вычетом удержанных в ставках
   def money_total_without_bets
     self.money_total - Money.new(money_in_bets, money_total.currency)
   end
   
   def money_in_bets
     money_in_bets = self.bets.actual.inject(0) { |sum, b| sum + b.amount_cents }
   end
end
