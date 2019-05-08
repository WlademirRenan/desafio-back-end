class FinanceController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    
  end

  def create
    @finance_transaction = ::FinanceTransactionService.new(finance_params)
    @finance_transaction.call
    if @finance_transaction.errors.empty?
      render :index
    else
      flash[:message] = @finance_transaction.errors
      render :index
    end
  end

  def transactions
    @shops = Shop.all
  end

  def show
    @shop = Shop.where(id: params[:id]).first
    @finances = @shop.finances
    @total = @shop.calculate_total
  end

  private
    # Only allow a trusted parameter "white list" through.
    def finance_params
      params.permit(:file)
    end
end
