# Get the docker image of Ruby 3.1.4 and build on top of that
FROM ruby:3.1.4

# Install Rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Create a folder /myapp in the Docker container and set it as the working directory
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock from the app root directory into the /myapp/ folder in the Docker container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install --jobs 4

# Copy the whole app
COPY . /myapp