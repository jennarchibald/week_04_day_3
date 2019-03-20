require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

# index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# new
get '/pizza-orders/new'  do
  erb(:new)
end

# destroy 
post '/pizza-orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete()
  redirect '/pizza-orders'
end

# edit
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# update

post '/pizza-orders/:id' do
  order = PizzaOrder.new(params)
  order.update()
  erb(:update)
end

# show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end
