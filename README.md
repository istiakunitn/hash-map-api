## How to run this project?

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

## Other 2 projects are also done for demonstate purpose

* ***UI*** - Frontend
* ***API documentation*** - REST Api interface to consume APIs

### Running REST Interface

```
$ clone hash-map-api-documentation
$ cd hash-map-api-documentation/
$ install docker and docker-compose
$ docker-compose up
$ visit localhost:8083
```

### Running UI
```
$ clone hash-map-frontend
$ cd hash-map-frontend/
```

NB: remember to run the [api server](#running-api-server) as mentioned above
