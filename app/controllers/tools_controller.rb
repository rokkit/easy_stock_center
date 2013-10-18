class ToolsController < ApplicationController
  # load_and_authorize_resource
  before_filter :authenticate_user!
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  
  # before_filter :load_traderoom, only: [:create]
  
  def index
    @tools = Tool.all
  end
  
  def new
    @tool = Tool.new params[:tool]
  end
  
  def edit
  end
  
  def create
    @tool = Tool.new(tool_params)

    respond_to do |format|
      if @tool.save
        format.html { redirect_to traderoom_tools_path(params[:traderoom_id], @tool), notice: 'Traderoom was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def show
  end
  
  def destroy
    if @tool.destroy
      redirect_to tools_url 
    else
      redirect_to @tool
    end
  end
  
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool, notice: 'Traderoom was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def load_domain
     @traderoom = Traderoom.find params[:traderoom_id]
  end
   
  private
   def set_tool
     @tool = Tool.find(params[:id])
   end
   def tool_params
     params.require(:tool).permit(:name, :avatar,:symbol, :traderoom_id)
   end
end
