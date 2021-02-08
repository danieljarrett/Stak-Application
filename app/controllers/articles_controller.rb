class ArticlesController < Stak::Controller
	attr_reader :ua

### CUSTOM ACTIONS

	def sample
		@ua = request.user_agent
		@noun = 'winking'
		render :sample, locals: { a_local: :roar, ua: 'overridden' }
	end

### CRUD ACTIONS

	def index
		@articles = Article.all
	end

	def new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		redirect action: :show, id: Article.last.id
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		redirect action: :show, id: params[:id]
	end

	def delete
		article = Article.find(params[:id])
		article.destroy

		redirect action: :index
	end

	private

		def article_params
			params[:article].permit(:body, :tagline, :submitter)
		end
end