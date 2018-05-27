require 'sinatra/base'
require 'json'
require_relative 'ledger'

module ExpenseTracker #Module ~ Namespaces
        class API < Sinatra::Base
            
            def initialize(ledger: Ledger.new)
                @ledger = ledger
                super()
            end

            post'/expenses' do #POST method mapped to expenses
            expense =JSON.parse(request.body.read) #POST call to expenses generates JSON K,V 
            result = @ledger.record(expense)
            if result.success?
            JSON.generate('expense_id'=> result.expense_id)
            else
                status 422
                JSON.generate('error'=> result.error_message)
            end        
        end

            get '/expenses/:date' do
                JSON.generate([]) 
        end
    end
end
