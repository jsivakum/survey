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

#Survey Editing Stuff
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
  answers = params[:answers]
  questions.each() do |q|
    q =  Question.create({:query => q, :survey_id => s_id})
      a = answers.shift()
      array= a.split(",")
      array.each do |r|
        s= Response.create({:response => r})
        q.responses << s
    end
  end


  redirect back
end

delete '/delete_survey/:id' do
  survey=Survey.find(params['id'])
  survey.destroy
  questions = Question.where({:survey_id => survey.id})
  questions.each() do |q|
    q.destroy()
    answers = Response.where({:question_id => q.id})
    answers.each do |a|
      a.destroy()
    end
  end
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
  answers = Response.where({:question_id => question.id})
  answers.each do |a|
    a.destroy()
  end
  redirect back
end

patch '/update_question/:id' do
  question = Question.find(params['id'])
  query = params[:query]
  question.update({:query => query})
  redirect back
end

#Survey Taking
get('/survey/:id') do
  s_id = params['id'].to_i
  @survey = Survey.find(s_id)
  erb :take_survey
end

patch '/done_survey/:id' do
  # answer_ids = params[:answer_ids]
  # answer_id = answer_ids.shift
  # answer = Response.find(answer_id)
  # response.question << answer
  # redirect '/'
end
