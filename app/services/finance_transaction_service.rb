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
      #validate_transference
      @lines.each do |line|
        CreateTransactionService.new(line)
      end
    end
  end