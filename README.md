![logo/logo-normal.png](logo/logo-normal.png)
**VGDatabase (VGDB)** is a platform designed and built for gamers by gamers.

The site is based on a videogames database, where you can view many information about any games such as genre, developer, date of release, score and the reviews written by other players, with an additional external link for the purchase. The platform also provides a search functions by title or by filters, such as genre or platform, and a search function for registered users. In addition, the site is updated periodically, always showing in the homepage the most popular games at the moment. Each user has his own library of games, a friends list and the possibility to group games and friends in Favorites lists. Enjoy!

**The site is now live, [check it out!](https://vgdatabase.herokuapp.com/)**

## Authors

*   **Giovanni Roma** - roma.1808340@studenti.uniroma1.it - [GitHub](https://github.com/JoGist) - [LinkedIn](https://www.linkedin.com/in/giovanni-roma-a95a32127/)
*   **Marco Musciaglia** - musciaglia.1816864@studenti.uniroma1.it - [GitHub](https://github.com/loldlink)
*   **Matteo Sabatini** - sabatini.1794627@studenti.uniroma1.it - [GitHub](https://github.com/ZioSaba)


## Dependencies
In order to build and run the Rails server in your machine, you must have installed:
*   _Bundler 2.0_
*   _Ruby 2.7.0p0_
*   _Rails 6.0.2.2_
*   _Postgres 9 or above_
*   _JavaScript (any version)_


## Rails app usage
To build and run the Rails app, go into the root folder of the repo and run the following commands.

Build and install all required Gems included in Gemfile:
```sh
Bundle install
```

Start the rails server:
```sh
rails server
```
Then simply go on this page with your browser of choice and you're done!
```sh
localhost:3000/login
```

### Other useful command
Run the integrated Rails console
```sh
rails console
```

View all the routes created in the project
```sh
rails route
```

Drop and recreate the schema and the tables
```sh
rake db:reset
```

Execute database table migrations that are pending
```sh
rake db:migrate
```
