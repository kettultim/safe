# README (NEEDS UPDATING)

Live example of app: http://safeapp.herokuapp.com

## Prerequisites
(TODO: Add more depending on feedback)
- Ruby 2.2.2
- Rails 4.2.4

## Local Setup
- Fork this directory

```
$ cd parent/folder/where/you/want/the/app
$ git clone git@github.com:YOURID/safeapp.git safeapp
$ cd safeapp
$ bundle install
$ rake db:create
$ rake db:migrate
```

## Run the Tests
```
$ rake test
```

## Seed Local Database (see db/seeds.rb for seed data)
The following command drops, creates, migrates, and seeds the database.
```
$ rake db:reset
```

​## Set the AWS creds locally

**AWS_ACCESS_KEY_ID:** AKIAJPMJNI5YYVAT5NQA

**AWS_SECRET_ACCESS_KEY:**ajMJgNDxc2yf5ryM2s9dcrXsNvVHMD9ApoCPMjIs

```
$ figaro install
```

Add the 2 keys above to config/application.yml 
Restart rails server
