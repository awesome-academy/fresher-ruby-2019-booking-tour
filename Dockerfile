FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y nodejs
ENV APP_PATH /my_app
WORKDIR $APP_PATH
COPY Gemfile Gemfile.lock $APP_PATH/
RUN bundle install
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]


