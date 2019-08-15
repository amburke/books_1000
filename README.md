# books_1000

So far this is just a list of the books read over the course of the last 3 years.

To access the console in development:
`bundle exec rake console`

To run the server locally:
`shotgun`

rake db:create # Creates the database from DATABASE_URL or config/database.yml for...
rake db:create_migration # Create a migration (parameters: NAME, VERSION)
rake db:drop # Drops the database from DATABASE_URL or config/database.yml for t...
rake db:fixtures:load # Load fixtures into the current environment's database
rake db:migrate # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status # Display status of migrations
rake db:rollback # Rolls the schema back to the previous version (specify steps w/ S...
rake db:schema:cache:clear # Clear a db/schema_cache.dump file
rake db:schema:cache:dump # Create a db/schema_cache.dump file
rake db:schema:dump # Create a db/schema.rb file that is portable against any DB suppor...
rake db:schema:load # Load a schema.rb file into the database
rake db:seed # Load the seed data from db/seeds.rb
rake db:setup # Create the database, load the schema, and initialize with the see...
rake db:structure:dump # Dump the database structure to db/structure.sql
rake db:structure:load # Recreate the databases from the structure.sql file
rake db:version # Retrieves the current schema version number
