#!/bin/bash -xe

heroku config:add BUNDLE_WITHOUT="test:development" --app $HEROKU_APP_NAME
heroku buildpacks:add https://codon-buildpacks.s3.amazonaws.com/buildpacks/groonga/groonga.tgz --app $HEROKU_APP_NAME || true
heroku buildpacks:add heroku/ruby --app $HEROKU_APP_NAME || true
heroku buildpacks:add https://codon-buildpacks.s3.amazonaws.com/buildpacks/groonga/rroonga.tgz --app $HEROKU_APP_NAME || true

git push git@heroku.com:$HEROKU_APP_NAME.git $CIRCLE_SHA1:refs/heads/master

heroku run rake ar:migrate --app $HEROKU_APP_NAME
heroku run rake sebastian:clear_all_cache --app $HEROKU_APP_NAME
