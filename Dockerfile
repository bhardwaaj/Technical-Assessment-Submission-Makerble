FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY rails-app/Gemfile* ./
RUN bundle install

COPY rails-app .

EXPOSE 3000
CMD ["sh", "-c", "rm -f tmp/pids/server.pid && rails server -b 0.0.0.0"]