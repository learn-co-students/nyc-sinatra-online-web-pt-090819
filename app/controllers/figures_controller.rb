class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all
    erb :'figures/new'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(params)
  end
end
