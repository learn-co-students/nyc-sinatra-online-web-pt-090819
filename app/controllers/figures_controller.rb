class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
    # binding.pry
    unless params[:title][:name].empty?
      # binding.pry
      @figure.titles << Title.create(params[:title])
    end
    
    unless params[:landmark][:name].empty?
      
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    # binding.pry
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    # binding.pry
    unless params[:title][:name].empty?
      # binding.pry
      @figure.titles << Title.create(params[:title])
    end
    
    unless params[:landmark][:name].empty?
      
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
