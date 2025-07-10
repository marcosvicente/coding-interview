# syntax=docker/dockerfile:1
FROM ruby:3.2.0

# Bundler version
ENV BUNDLER_VERSION 2.4.7

RUN apt-get update -qq && apt-get install -y \
    imagemagick \
    nodejs \
    libfontconfig \
    libpq-dev \
    libxrender1

# Working dir
WORKDIR /app
COPY ./ /app

# Installing bundler
RUN gem install bundler -v $BUNDLER_VERSION

# Installing Gems
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

