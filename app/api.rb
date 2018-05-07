require 'sinatra/base'
require 'json'

module ExpenseTracker #Module ~ Namespaces
        class API < Sinatra::Base
            post'/expenses' do #POST method mapped to expenses
            JSON.generate('expense_id' => 42) #POST call to expenses generates JSON K,V 
            end

            get '/expenses/:date' do
                JSON.generate([]) 
        end
    end
end
