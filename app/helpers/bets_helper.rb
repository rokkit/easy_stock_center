module BetsHelper
  def humanized bet
    bet_description = String.new
    if bet.quote_start < bet.quote_final
      bet_description += "Рост"
    else
      bet_description += "Падение"
    end
    
    bet_description += " С #{bet.quote_start} до #{bet.quote_final}"
  end
end
