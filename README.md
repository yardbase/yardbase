# Yardbase

API Usage:

    <script src="yardbase.com/assets/api.js" type="text/javascript"></script>
    <script type="text/javascript">
        var q = new Yardbase.Query();
        q.with_tag("coffeeshop");
        q.with_tag("wifi");
        q.where("wifi.free", true);
        q.execute(function(results) {
          //results here
        });

    </script>

## Installation

Yardbase is **ALPHA** software, so please be aware that it doesn't really do everything we'd like so far.
For example, the data-entry mechanism is not exactly friendly yet.

Prerequisites for development are:

* ruby 1.9.3 or greater
* bundler
* mongodb

You can deploy to any rails-capable server (think Linux/Unix),
but we recommend deploying to heroku with the mongohq sandbox plan.

    $ heroku apps:create
    $ heroku addons:add mongohq:sandbox
    $ git push heroku master

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact me and I'll add a note to the README so that others can find your work.


## License

This project is license under the MIT license, as specified in the LICENSE file.
