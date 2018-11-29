echo '---- STARTING INSTALL ----'
echo ''
echo 'RUNNING COMMAND: heroku create $1 --region=eu'
heroku create $1 --region=eu
heroku pg:wait
echo ''
echo 'RUNNING COMMAND: heroku addons:create heroku-postgresql'
heroku addons:create heroku-postgresql
heroku pg:wait
echo ''
echo 'RUNNING COMMAND: heroku addons:create herokuconnect'
heroku addons:create herokuconnect
heroku pg:wait
echo ''
echo 'RUNNING COMMAND: heroku addons:create herokuconnect'
heroku addons:create herokuconnect
heroku pg:wait
echo ''
echo 'Exporting Config Vars to local .env file.'
heroku config -s > .env
heroku pg:wait
echo ''
echo '---- STARTING APP RELEASE ----'

git add .
git commit -am 'first release'
git push heroku master
