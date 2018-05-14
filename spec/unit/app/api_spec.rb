require_relative '../../../app/api'

module ExpenseTracker
    RSpec.describe 'POST /expenses' do
        context 'when the expense is successfully recorded' do
            it 'returns the expense id'
            it 'responds with a 200 (OK)'
        
        context 'when the expense fails validation' do
            it 'returns an error message'
            it 'responds with a 422 (Unprocessable entity)'
        end

        end 
    end
end