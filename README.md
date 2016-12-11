# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies
ElasticSearch (si pas déjà installé):
brew install elasticsearch

Lancer elasticsearch comme mysql

* Configuration

bundle install

* Database creation

rake db:drop


* Database initialization

rake db:setup


* How to run the test suite

bundle install // too make sure all gem installed
rake db:test:prepare // too prepare the db test for test suite
bundle exec rspec // too lunch all test
bundle exec rspec spec/models // exemple to how lunch just some test (here all in models folder)

* How to launch webapp in development mode

rails server -e development -b 0.0.0.0 -p 3000

* Services (job queues, cache servers, search engines, etc.)

rake searchkick:reindex:all

curl -XDELETE 'http://localhost:9200/*'

* Deployment instructions
