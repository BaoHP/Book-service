FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /books
WORKDIR /books
COPY Gemfile /books/Gemfile
COPY Gemfile.lock /books/Gemfile.lock
RUN bundle install
COPY . /books

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]