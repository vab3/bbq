# Dockerfile development version
FROM ruby:2.6.5 AS bbq-development

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user


ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY rails/ .

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg
RUN apt-key add /opt/app/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

RUN rm -rf node_modules vendor
RUN gem install rails bundler
RUN bundle install
RUN yarn install
RUN chown -R user:user /opt/app

USER $USER_ID
# CMD bundle exec unicorn -c config/unicorn.rb
CMD bundle exec rails s -b 0.0.0.0 -p 8010
