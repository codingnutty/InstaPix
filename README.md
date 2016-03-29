# InstaPix
This repo is in continued verison of InstaTagger that can be found at http://github.com/codingnutty/InstagramTagger.
## Setup

Clone the project and run the following commands in the project directory:
* Run `brew install redis` if you do not have Redis on your computer.
* Run `redis-server /usr/local/etc/redis.conf`, the default command to kick off the Redis server.
* Run `bundle install`, to install all gem dependencies
* Run `bundle exec sidekiq`, to start up Sidekiq
* Run `bundle exec rake db:create; bundle exec rake db:migrate` to set up the database locally.
* Run `bundle exec rails s`, to start up the Rails server

## Summary
This app is set up to have rails in the backend with PostGres as database.
There is an error in the front end that will be addressed with time. Although the backend is able to identify the id of a collection the front end backbone.js receives id as undefined.
Ideally, the whole system should work asynchronously. A batch job can be kicked off to fetch the posts. The idea is to send the browser an HTML page as soon as possible, without making it wait while the server grinds away doing something else. Right now, a lack of either start or end date is given the current date.