# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Things you may want to cover:
#### Ruby and rails version
    Ruby 2.3.1
    Rails 5.0.0.1

### Things you need to do:
#### System dependencies
1. ##### Install ElasticSearch**
    brew install elasticsearch
2. ##### Lunch elasticsearch and mysql
3. ##### Install your gems
    bundle install

### Config your BDD dans dependencies
1. ##### Deploy your bdd
    rake db:drop

2. ##### Database initialization
    rake db:setup
    ----------------- or ----------------
    rake db:create
    rake db:migrate
### How to run the test suit
1. ##### How to make sure all gem are installed
    bundle install
2. ##### How to prepare the db test for test suite
    rake db:test:prepare
3. ##### How to lunch all test in /spec/ folder
    bundle exec rspec
4. ##### How to lunch all file in spec/exemple
    bundle exec rspec spec/exemple

### How to launch webapp in development mode
    rails server -e development -b 0.0.0.0 -p 3000

### Services (job queues, cache servers, search engines, etc.)
Reindex all file for the search function
    rake searchkick:reindex:all

curl -XDELETE "http://localhost:9200/\*"

### Deployment instructions
