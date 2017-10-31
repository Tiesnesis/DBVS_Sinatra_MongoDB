# Requires the Gemfile
require 'bundler' ; Bundler.require
set :bind, '0.0.0.0'

configure do
  db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'WorkersLU', :user => 'superuser', :password => 'password')  
  set :mongo_db, db[:WorkersLU]
end

# By default Sinatra will return the string as the response.
get '/hello-world' do
  "Hello World!"
end

get '/?' do
  content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @employees = settings.mongo_db.database.collection('Penality').find
end

get '/penalty/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @penalties = settings.mongo_db.database.collection('Penality').find({"employee_id" => params[:id].to_i})
  erb :penalties
end

get '/penalty_by_office/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @penalties = settings.mongo_db.database.collection('Penality').find({"office_id" => params[:id].to_i})
  erb :penalties
end

get '/office/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @offices = settings.mongo_db.database.collection('Office').find({"id" => params[:id].to_i})
  erb :office
end

get '/events/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @events = settings.mongo_db.database.collection('Event').find({"employee_id" => params[:id].to_i})
  erb :event
end

get '/event_by_id/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @events = settings.mongo_db.database.collection('Event').find({"id" => params[:id].to_i})
  erb :event
end

get '/master/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @masters = settings.mongo_db.database.collection('Master').find({"employee_id" => params[:id].to_i})
  erb :master
end

get '/master_by_office/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @masters = settings.mongo_db.database.collection('Master').find({"office_id" => params[:id].to_i})
  erb :master
end

get '/master_by_id/:id' do
  # content_type :json
  # settings.mongo_db.database.collection_names.to_json
  @masters = settings.mongo_db.database.collection('Master').find({"id" => params[:id].to_i})
  erb :master
end

get '/employee_by_id/:id' do
  # content_type :json
  @employees = settings.mongo_db.database.collection('Employee').find({"id" => params[:id].to_i})
  erb :employee
end


get '/employee/?' do
  # content_type :json
  @employees = settings.mongo_db.database.collection('Employee').find
  erb :employee
end