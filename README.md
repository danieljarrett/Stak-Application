Stak-Application
=============

Example application illustrating basic [Stak](https://github.com/danieljarrett/stak-framework) functionality.

### Usage

Install the gem:

	$ gem install stak

Clone the repository:

	$ git clone https://github.com/danieljarrett/stak-application

Rack it up:

	$ rackup config.ru

Of course, any rack-compliant web server (e.g. [pill](https://github.com/danieljarrett/pill-server)) will do:

	$ pill

### Configuration

Detailed documentation and resources can be found on the [Stak](https://github.com/danieljarrett/stak-framework) homepage.  An application skeleton for starting a new Stak app from scratch can be found [here](https://github.com/danieljarrett/stak-framework).  Stak should be immediately familiar with any experience in Sinatra or Rails.  The following snippets illustrate the basic MVC pattern in a Stak application with 'articles' as the resource.

##### Models

Example model `app/models/article.rb`:

	class Article < Stak::Mapper
		attr_accessor :body, :tagline, :submitter, :created_at

		@@table = 'articles'

		@@mappings.draw(
			content: :body,
			tagline: :tagline,
			submitter: :submitter,
			created_at: :created_at
		)

		# Custom Methods Here
	end

##### Controllers

Example controller `app/controllers/articles_controller.rb`:

	class ArticlesController < Stak::Controller
		def create
			@article = Article.new(article_params)
			@article.save

			redirect action: :show, id: Article.last.id
		end

		private

			def article_params
				params[:article].permit(:body, :tagline, :submitter)
			end
	end

##### Views

Example view `app/views/articles/new.html.erb`:

	<h1>Create New Article</h1>

	<form action='/articles/create' method='POST'>
		Body:
		<textarea rows='5' cols='30' name='article[body]' id=''></textarea>
		Tagline:
		<input type='text' name='article[tagline]' value=''>
		Submitter:
		<input type='text' name='article[submitter]' value=''>
		<button type='submit'>Create</button>
	</form>

### Resources

* [RubyGems](https://rubygems.org/)
* [Documentation](http://www.rubydoc.info/gems/stak)
* [Stak Skeleton](https://github.com/danieljarrett/stak-skeleton)
* [Example App](https://github.com/danieljarrett/stak-application)
