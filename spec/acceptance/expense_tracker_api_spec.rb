require 'rack/test'
require 'json'
require_relative '../../app/api' #Requires relative to test dirs api class

module ExpenseTracker
    
    RSpec.describe 'Expense Tracker API' do #Testing the API 
        include Rack::Test::Methods 
        def app 
            ExpenseTracker::API.new
        end

        def post_expense(expense) #Refactored to make helper method containing logic 
            
            post '/expenses', JSON.generate(expense) # Calls POST in API with coffee converted to JSON
            expect(last_response.status).to eq(200) # Check that response from server is 200(valid)

            parsed = JSON.parse(last_response.body) #Parses the response body to JSON
            expect(parsed).to include('expense_id' => a_kind_of(Integer)) #Checks expense id Key has an Integer value
            expense.merge('id'=>parsed['expense_id'])#Merge adds an id Key to the hash auto-assigned from DB
        end
        
        it 'records submitted expenses' do
                pending 'Need to persist using DB'
            
            coffee = post_expense(
                'payee' => 'Covfefe Coffee',
                'amount' => 5.75,
                'date' => '2017-06-10'
            )
            zoo = post_expense(
                'payee' => 'Denver Zoo',
                'amount' => 15.50,
                'date' => '2017-06-10'
            )
            groceries = post_expense(
                'payee' => 'Whole Foods',
                'amount' => 95.00,
                'date' => '2017-06-11'
            )
        
                #POST coffee, zoo, and groceries 
                get '/expenses/2017-06-10'
                expect(last_response.status).to eq(200) #Sanity check response code
                
                expenses = JSON.parse(last_response.body)
                expect(expenses).to contain_exactly(coffee,zoo)
    end
end

end