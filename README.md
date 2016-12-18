# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Things you may want to cover
#### Ruby and rails version
    Ruby 2.3.1
    Rails 5.0.0.1
    
#### Server deployment to test it
    https://kamadudev.herokuapp.com/

### Things you need to do
#### System dependencies
##### Install elasticsearch

    brew install elasticsearch

##### Lunch elasticsearch and mysql
##### Install your gems

    bundle install

### Config your BDD dans dependencies

##### Deploy your bdd

    rake db:drop

##### Database initialization

    rake db:setup
    rake db:create
    rake db:migrate

### How to run the test suit

##### How to make sure all gem are installed

    bundle install

##### How to prepare the db test for test suite

    rake db:test:prepare

##### How to lunch all test in /spec/ folder

    bundle exec rspec

##### How to lunch all file in spec/exemple

    bundle exec rspec spec/exemple

### How to launch webapp in development mode

    rails server -e development -b 0.0.0.0 -p 3000

### Services (job queues, cache servers, search engines, etc.)

##### Reindex all file for the search function

    rake searchkick:reindex:all
    
##### Lunch your webserver

    curl -XDELETE "http://localhost:9200/\*"

### Deployment instructions
