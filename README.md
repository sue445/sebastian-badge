# Sebastian
[![Circle CI](https://circleci.com/gh/sue445/sebastian-badge/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/sebastian-badge/tree/master)
[![Dependency Status](https://gemnasium.com/sue445/sebastian-badge.svg)](https://gemnasium.com/sue445/sebastian-badge)
[![Coverage Status](https://coveralls.io/repos/sue445/sebastian-badge/badge.svg)](https://coveralls.io/r/sue445/sebastian-badge)
[![Code Climate](https://codeclimate.com/github/sue445/sebastian-badge/badges/gpa.svg)](https://codeclimate.com/github/sue445/sebastian-badge)

## Setup
```bash
cp config/database.yml{.example,}
vi config/database.yml
```

## Setup Heroku
```bash
heroku addons:add papertrail
heroku addons:add rollbar
heroku addons:add newrelic:stark
heroku config:add ROLLBAR_ACCESS_TOKEN=XXXXXXXXXXXXXXXX
```
