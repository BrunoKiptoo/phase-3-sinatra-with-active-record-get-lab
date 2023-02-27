class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # return a JSON response with an array of all the bakeries data
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    # look up the bakery in the database using its ID
    bakeries = Bakery.find(params[:id])
    # send a JSON-formatted response of the bakery data
    bakeries.to_json
  end


  get '/baked_goods/by_price' do 
    # get all the baked goods from the database and sort them by price in descending order
    baked_goods = BakedGood.order(price: :desc)
    # return a JSON response with an array of all the baked goods data
    baked_goods.to_json
  end
  
  get '/baked_goods/most_expensive' do 
    # get the most expensive baked good from the database
    baked_good = BakedGood.order(price: :desc).limit(1).first
    # return a JSON response with the data of the most expensive baked good
    baked_good.to_json
  end
  

end
