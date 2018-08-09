class FiguresController < ApplicationController

    get '/figures' do
        @figures = Figure.all
        erb :'figures/index'
    end
    get '/figures/new' do
        @landmarks = Landmark.all
        @titles = Title.all
        erb :'figures/new'
    end


    post '/figures' do
        figure = Figure.create(params[:figure])
        if !params["landmark"]["name"].empty?
            figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
        end
        if !params["title"]["name"].empty?
            figure.titles << Title.create(name: params["title"]["name"])
        end
        figure.save
        redirect to "/figures/#{figure.id}"
    end

    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'figures/show'
    end

    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :'figures/edit'
    end

    post '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.update(params[:figure])
        if !params["landmark"]["name"].empty?
            @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
        end
        if !params["title"]["name"].empty?
            @figure.titles << Title.create(name: params["title"]["name"])
        end
        redirect to "/figures/#{@figure.id}"

    end

end
