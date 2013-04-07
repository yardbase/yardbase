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

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact me and I'll add a note to the README so that others can find your work.


## License

This project is license under the MIT license, as specified in the LICENSE file.
