# Basic Heroku archiving app

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/travega/basic-archiving-app)

## Setup
### Heroku button

 1. Click the Deploy to Heroku button
 2. Use Heroku CLI to checkout the code: ``

### Manual

 1. Checkout the code from https://github.com/travega/basic-archiving-app
 2. Change directory to the basic-archiving-app project
 3. Run the following commands:
    ```
    heroku create <my_app_name>
    heroku addons:create heroku-postgresql
    heroku addons:create herokuconnect
    heroku addons:create rabbitmq-bigwig
    heroku config > .env
    ```
 4. Then deploy the code to your app by running: `git push heroku master`
