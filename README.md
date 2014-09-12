#Blog Central
Blog Central allows users to create accounts, create blog entries, comment on others' blogs, edit/delete their own comments, and edit/delete their own accounts.

##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/pdxmeghan/blog_central.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:schema:load
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`.

Alternatively, the live app is on [Heroku](http://photobook-app.herokuapp.com/).

##Authors
[Josie](https://github.com/jozwright)
and
[Meghan](https://github.com/pdxmeghan)

##License
MIT
