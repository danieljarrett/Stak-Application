class Article < Stak::Mapper
	attr_accessor :body, :tagline, :submitter, :created_at

### MODEL NAME

	@@table = 'articles'

### COLUMN-ATTRIBUTE PAIRS

	@@mappings.draw(
		content: :body,
		tagline: :tagline,
		submitter: :submitter,
		created_at: :created_at
	)

### MODEL METHODS

	def created_at
		@created_at.to_s
	end
end