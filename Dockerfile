FROM ruby:3.4-alpine

WORKDIR /app

RUN apk add --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  yaml-dev \
  pkgconf \
  git \
  bash \
  nodejs \
  npm \
  python3 \
  libc6-compat

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json package-lock.json ./
RUN npm ci --include=optional

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY . .

RUN chmod +x bin/dev

EXPOSE 3000 3036

ENTRYPOINT ["entrypoint.sh"]
CMD ["bin/dev"]