class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:new, :create, :edit, :update, :destroy, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
    @portfolio_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    # 3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    # @technology = @portfolio_item.technologies.new(id: params[:id])

    # byebug
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end

  def update
    
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Your portfolio item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "Record was removed." }
    end
  end

  private def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle,
                                      :main_image,
                                      :thumb_image, 
                                      :body, 
                                      technologies_attributes: [:id, :name, :_destroy]
                                     )
  end

  private def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
end
