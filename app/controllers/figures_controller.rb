class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      new_title = Title.create(params[:title])
      FigureTitle.create(figure_id: @figure.id, title_id: new_title.id)
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect :'/figures/index'
  end

  get '/figures/:id' do
    @figures = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figures = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figures = Figure.find(params[:id])
    @figures.update(params[:figure])
    if !params["title"]["name"].empty?
      new_title = Title.create(params[:title])
      FigureTitle.create(figure_id: @figures.id, title_id: new_title.id)
    end
    if !params["landmark"]["name"].empty?
      @figures.landmarks << Landmark.create(params[:landmark])
    end
    @figures.save
    redirect :"/figures/#{@figures.id}"
  end


end
