require './config/application'

app = StakExample::Application.new
app.router.config do

### CUSTOM ROUTES

	root 'articles#index'

	resources :articles, access: true

	get '/index', 'articles#index'

	get '/params/:foo/with/target/:fooz', 'articles#sample'

	get '/params/:foo/with/block/:fooz' do
		@ua = request.user_agent
		@noun = 'winking'
		render 'articles/sample', locals: { a_local: :roar, ua: 'overridden' }, layout: false
	end

end

### MIDDLEWARE

use Rack::MethodOverride
use Rack::Static, :urls => ['/css'], :root => 'public'
run app