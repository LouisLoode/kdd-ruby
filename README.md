# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Things you may want to cover:
#### Ruby version
- 2.3.1

#### System dependencies
Install ElasticSearch:
* 'brew install elasticsearch'
Lunch elasticsearch and mysql

### Config your BDD dans dependencies
#### Install your gems
- 'bundle install'

#### Deploy your bdd
- 'rake db:drop'

#### Database initialization
- 'rake db:setup'

### How to run the test suit
to make sure all gem installed
* 'bundle install'
to prepare the db test for test suite
* 'rake db:test:prepare'
to lunch all test in /spec/ folder
* 'bundle exec rspec'
to lunch all file in spec/exemple
* 'bundle exec rspec spec/exemple'

### How to launch webapp in development mode
- 'rails server -e development -b 0.0.0.0 -p 3000'

### Services (job queues, cache servers, search engines, etc.)
Reindex all file for the search function
* 'rake searchkick:reindex:all'

curl -XDELETE "http://localhost:9200/\*"

### Deployment instructions
