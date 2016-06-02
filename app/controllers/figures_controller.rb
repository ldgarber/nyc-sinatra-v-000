class FiguresController < ApplicationController

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new' 
  end

  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    if params[:new_title] != ""
      @new_title = Title.find_or_create_by(name: params[:new_title])
      @figure.titles << @new_title 
      @figure.save
    end
    if params[:new_landmark] != ""
      @new_landmark = Landmark.find_or_create_by(name: params[:new_landmark])
      @figure.landmarks << @new_landmark
      @figure.save
    end
    erb :'/figures/index'
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:new_title] != ""
      @new_title = Title.find_or_create_by(name: params[:new_title])
      @figure.titles << @new_title
      @figure.save
    end
    if params[:new_landmark] != ""
      @new_landmark = Landmark.find_or_create_by(name: params[:new_landmark])
      @figure.landmarks << @new_landmark
      @figure.save
    end
    redirect to "/figures/#{@figure.id}"
  end
end
