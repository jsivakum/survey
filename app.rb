require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  erb :index
end

get('/make') do
  @surveys = Survey.all
  erb :make
end

get '/take' do

  @surveys = Survey.all()

  erb :take

end
