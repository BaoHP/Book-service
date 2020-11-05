FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /reviews
WORKDIR /reviews
COPY Gemfile /reviews/Gemfile
COPY Gemfile.lock /reviews/Gemfile.lock
RUN bundle install
COPY . .

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]