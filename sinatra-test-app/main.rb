require 'rubygems'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'vote_logger.rb')
require File.join(File.dirname(__FILE__), '../number_to_code.rb')
@haml = false

get '/' do
  if @haml 
    haml :index
  else
    erb :index
  end
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet if @haml
end

post '/to_words/' do
  redirect "/to_words/#{params[:number]}"
end

get '/to_words/:number' do
  @number = params[:number]
  @can_vote = !VoteLogger.already_voted?(@number)
  if @haml
    haml :to_words
  else
    erb :to_words
  end
end

post '/vote/' do
  redirect "/vote/#{params[:number]}/#{params[:vote_option]}"
end

get '/vote/:number/:vote_option' do
  VoteLogger.vote(params[:number], params[:vote_option]) unless VoteLogger.already_voted?(params[:number])
  if @haml
    haml :vote
  else
    erb :vote
  end
end 

get '/vote/list' do
  @votes = VoteLogger.get_votes
  if @haml
    haml :vote_list
  else
    erb :vote_list
  end
end

VoteLogger.start
