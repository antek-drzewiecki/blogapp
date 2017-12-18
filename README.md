# README


## Requirements
This application requires the following application to run
- rvm or preinstalled ruby 2.3.4

## How to run

Then set up the project with ruby 2.3.4.

### Inital steps
```ruby

bundle

bundle exec rake db:create

bundle exec rake db:migrate

```

### Start the server

Once this is set up initially you can run the app with
`bundle exec rails s`

This will start a server on http://localhost:3001/ .


### Usage
This application functions as an post app.

It accesses the providers api and shows the posts.
The posts are currently in json format. 

When the token is expired or the user changes the password on the provider. The user has to reauthenticate itself.

## Tests

No tests have been created for this application.