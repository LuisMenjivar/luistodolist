desc "deletes todos after 7 days they are created"
task :delete_items => :environment do
  Todo.where("created_at <= ?", Time.now - 2.minutes).destroy_all
end