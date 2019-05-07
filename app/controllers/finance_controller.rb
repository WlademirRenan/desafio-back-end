class FinanceController < ApplicationController
  def index
    
  end

  def create
    @finance_transaction = FinanceTransactionService.new(finance_params)
    @finance_transaction.call
    if @finance_transaction.errors.empty?
      render json: @finance_transaction, status: :created
    else
      render json: @finance_transaction, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def finance_params
      params.permit(:file)
    end
end
