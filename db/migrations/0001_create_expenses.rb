require 'sequel'
Sequel.migration do
    change do
        create_table :expenses do
            primary_key :id
            String :payee
            Float :amount
            Date Ldate
        end
    end
end
