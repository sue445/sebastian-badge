# Sebastian
[![Circle CI](https://circleci.com/gh/sue445/sebastian-badge/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/sebastian-badge/tree/master)
[![Dependency Status](https://gemnasium.com/sue445/sebastian-badge.svg)](https://gemnasium.com/sue445/sebastian-badge)
[![Coverage Status](https://coveralls.io/repos/sue445/sebastian-badge/badge.svg)](https://coveralls.io/r/sue445/sebastian-badge)
[![Code Climate](https://codeclimate.com/github/sue445/sebastian-badge/badges/gpa.svg)](https://codeclimate.com/github/sue445/sebastian-badge)

[![Stories in Ready](https://badge.waffle.io/sue445/sebastian-badge.svg?label=ready&title=Ready)](http://waffle.io/sue445/sebastian-badge)

## Setup
```bash
cp config/database.yml{.example,}
vi config/database.yml

bundle exec rake ar:create
bundle exec rake ar:migrate

bundle exec padrino start
# or
bundle exec foreman start
```

## Testing
```bash
RACK_ENV=test bundle exec rake ar:create
RACK_ENV=test bundle exec rake ar:migrate
bundle exec rspec
```

## Setup Heroku
```bash
heroku addons:add papertrail
heroku addons:add rollbar
heroku addons:add newrelic:stark
heroku addons:add memcachier:dev
heroku addons:add scheduler
heroku config:add ROLLBAR_ACCESS_TOKEN=XXXXXXXXXXXXXXXX
heroku config:set BUILD_PACK=https://codon-buildpacks.s3.amazonaws.com/buildpacks/groonga/rroonga.tgz
```

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
