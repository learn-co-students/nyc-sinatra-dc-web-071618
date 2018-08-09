class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmarks = Landmark.create(params[:landmark])
    redirect :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect :"/landmarks/#{@landmark.id}"
  end


end
