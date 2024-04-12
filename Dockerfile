# gets the docker image of ruby 2.5 and lets us build on top of that
FROM ruby:3.1.4

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Yarn Install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# create a folder /myapp in the docker container and go into that folder
RUN mkdir /myapp
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock from app root directory into the /myapp/ folder in the docker container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Run bundle install to install gems inside the gemfile
RUN bundle install

# Copy the whole app
COPY . /myapp

RUN bundle exec rake assets:clobber
RUN bundle exec rails assets:precompile
RUN rm -f /app/tmp/pids/server.pid