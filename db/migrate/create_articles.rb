require 'sqlite3'

db = SQLite3::Database.new File.join('db', 'app.db')

### DATABASE COLUMNS

db.execute(
	"
		CREATE TABLE articles (
			id integer primary key,
			content text,
			tagline varchar(250),
			submitter varchar(250),
			created_at datetime default null
		)
	"
)