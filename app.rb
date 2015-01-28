require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
also_reload("/lib/**/*.rb")

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

post '/add_survey' do

  name = params[:name]
  description = params[:description]
  survey = Survey.create({:name => name, :description => description})
  redirect back

end

get '/survey/edit/:id' do
  @survey = Survey.find(params['id'])
  erb :survey_edit
end

post '/add_question' do
  s_id = params[:survey_id].to_i
  questions = params[:question]
  questions.each() do |q|
    Question.create({:query => q, :survey_id => s_id})
  end
  redirect back
end

delete '/delete_survey/:id' do
  survey=Survey.find(params['id'])
  survey.destroy
  redirect "/make"
end

patch '/update_survey/:id' do
  survey = Survey.find(params['id'])
  name = params[:name]
  description = params[:description]
  survey.update({:name => name, :description => description})
  redirect back
end

delete '/delete_question/:id' do
  question = Question.find(params['id'])
  question.destroy
  redirect back
end

patch '/update_question/:id' do
  question = Question.find(params['id'])
  query = params[:query]
  question.update({:query => query})
  redirect back
end
