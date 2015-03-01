# Money
[![Build Status](https://magnum.travis-ci.com/mohnish/money.svg?token=oQio4yxdq7cNymw16DPn&branch=master)](https://magnum.travis-ci.com/mohnish/money)

Money is an app to manage your bills and payments. It helps you reach your financial goals by showing you where you have been spending the most and where you can save.

## Features

- Add bills (recurring ones and one time)
- Get reminders about bills
- Reports. Neat graphs showing where your money went

## Development

from the application root, run the following commands
- `bin/setup` - sets up the app
- `bin/rspec` - run tests
- `bin/rake jasmine:ci` - runs js tests

## Running the app

from the application root, run
- `bin/rails s`

This will start the server @ http://localhost:3000/

If you had run the `bin/setup` earlier, you'll have access to
seed data and you can use username: `bond` and password: `test1234`
to login to the app.

## Deploying

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

- Others [TODO]

## Technologies Used

- Rails 4.2.0
- Ruby 2.2.0
- Backbone 1.1.2
- Bootstrap 3.3.2

## License

(The MIT License)

Copyright (c) 2015 Mohnish Thallavajhula &lt;i@mohni.sh&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
