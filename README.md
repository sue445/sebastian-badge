# Sebastian-badge.info
Hosting embed Jenkins plugin badges

http://sebastian-badge.info/

[![Circle CI](https://circleci.com/gh/sue445/sebastian-badge/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/sebastian-badge/tree/master)
[![Coverage Status](https://coveralls.io/repos/sue445/sebastian-badge/badge.svg)](https://coveralls.io/r/sue445/sebastian-badge)
[![Code Climate](https://codeclimate.com/github/sue445/sebastian-badge/badges/gpa.svg)](https://codeclimate.com/github/sue445/sebastian-badge)

## Setup
```bash
cp config/.env{.example,}
vi config/.env

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

## Heroku
### Setup
```bash
heroku addons:add heroku-postgresql:hobby-dev
heroku addons:add papertrail
heroku addons:add rollbar
heroku addons:add newrelic:wayne
heroku addons:add memcachier:dev
heroku addons:add scheduler
heroku addons:add pgbackups:auto-month
heroku config:add ROLLBAR_ACCESS_TOKEN=XXXXXXXXXXXXXXXX
heroku config:add NEW_RELIC_LICENSE_KEY=XXXXXXXXXXXXXXXX
```

### Scheduler
register `bundle exec rake sebastian:update_center` to heroku scheduler

![heroku-scheduler](doc/heroku-scheduler.png)

### Deploy your Heroku account
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
