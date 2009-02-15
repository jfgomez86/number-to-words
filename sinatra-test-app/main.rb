require 'rubygems'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'vote_logger.rb')
require File.join(File.dirname(__FILE__), '../number_to_code.rb')

get '/' do
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

post '/to_words/' do
  redirect "/to_words/#{params[:number]}"
end

get '/to_words/:number' do
  @number = params[:number]
  @can_vote = !VoteLogger.already_voted?(@number)
  haml :to_words
end

post '/vote/' do
  redirect "/vote/#{params[:number]}/#{params[:vote_option]}"
end

get '/vote/:number/:vote_option' do
  VoteLogger.vote(params[:number], params[:vote_option]) unless VoteLogger.already_voted?(params[:number])
  haml :vote
end 

get '/vote/list' do
  @votes = VoteLogger.get_votes
  haml :vote_list
end

VoteLogger.start
