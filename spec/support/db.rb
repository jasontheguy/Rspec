RSpec.configure do |c|
    c.before(:suite) do
        Sequel.extension :migrate
        Sequel::Migrator.run(DB, 'db/migrations')
        DB[:expenses].truncate
    end
end