## How to run this project?
This project contains three folders

* ***API*** - API/Backend server
* ***UI*** - Frontend
* ***REST Interface*** - REST Api interface to consume APIs

### Requirements

* Ruby version: 2.4.2
* Rails version: 5.2.6

### Database
 * Mysql Server version: 8.0.18 is used

### Running api server

```
$ clone/download this application to your desired project folder
$ cd hash-map-api/
$ bundle install
$ bin/rake db:create
$ bin/rake db:migrate
$ bin/rake db:seed
$ bin/rails s

```

### Running spec

```
$ cd hash-map-api/
$ bundle exec rspec
```

### Users

* ***Admin User*** 

* Email: super_admin@this-application.it
* Password: password

* ***Member User*** 

* Email: member@this-application.it
* Password: password


### Running UI
```
$ cd hash-map-ui/
```

### Running REST Interface

```
$ cd hash-map-api-swagger/
$ install docker and docker-compose
$ docker-compose up
$ visit localhost:8083
```

NB: remember to run the [api server](#running-api-server) as mentioned above
