class BetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_tool, only: [:edit, :create, :update, :destroy]
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  
  def create
    @bet = Bet.new bet_params
    @bet.user = current_user
    @bet.status = Bet::STATUS[:open]
    if @bet.save
      flash[:notice] = 'Ставка успешно сделана'
    end
  end
  
   
  private
   def set_tool
     @tool = Tool.find(params[:tool_id])
   end
   def set_bet
     @bet = Bet.find(params[:id])
   end
   def bet_params
     params.require(:bet).permit!
   end
  
end
