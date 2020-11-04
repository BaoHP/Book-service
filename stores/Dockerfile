FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /stores
WORKDIR /stores
COPY Gemfile /stores/Gemfile
COPY Gemfile.lock /stores/Gemfile.lock
RUN bundle install
COPY . /stores

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]