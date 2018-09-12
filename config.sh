echo '---- STARTING INSTALL ----'

heroku create sf-archiver-app
heroku addons:create heroku-postgresql
heroku addons:create herokuconnect
heroku config > .env



echo '---- STARTING APP RELEASE ----'

git add .
git commit -am 'first release'
git push heroku master
