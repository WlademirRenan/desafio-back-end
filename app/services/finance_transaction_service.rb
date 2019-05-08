class FinanceTransactionService

    def initialize(params = {})
      if params[:file]
        @file = params[:file].read
        @lines = @file.force_encoding('utf-8').split("\n")
      end
      @errors = []
    end
  
    attr_accessor :file, :lines, :errors
  
    def call
      @lines.each do |line|
        transaction = CreateTransactionService.new(line)
        transaction.call
        @errors.concat transaction.errors
      end
    end
  end