
ParkPerk is a review website hosted at https://parkperks.herokuapp.com.  The application was designed and built by the RELM project team during the Winter 2015 cohort at Launch Academy (http://www.launchacademy.com/).

[ ![Codeship Status for ezrashim/park_relm](https://codeship.com/projects/43a8c850-953e-0133-ea74-520d149e6bdf/status?branch=master)](https://codeship.com/projects/125143)
[![Coverage Status](https://coveralls.io/repos/ezrashim/park_relm/badge.svg?branch=master&service=github)](https://coveralls.io/github/ezrashim/park_relm?branch=master)
![Code Climate](https://codeclimate.com/github/ezrashim/park_relm.png)

# Topics

- [Features](#features)
- [Development](#development)
    - [Testing](#testing)
    - [Test Development](#test-development)
- [ER Diagram](#er-diagram)
- [Copyright](#copyright)

# Features

- The ability to add a park for review.
- The ability to rate the park and to create comment on it.
- An email is sent to the creator of a park when a new review is posted about it.
- The ability to upvote or downvote a review. A user can only upvote or downvote once and can change their vote from up to down. This feature utilizes AJAX so that a complete page reload isn't necessary.
- The ability to upload a profile photo (developed with Carrierwave). A default profile photo is used if the user does not upload one.
- The ability to search for parks.
- A sign up and authentication system for users (developed with Devise).
- An admin role. Admins are able to delete comments or items if they are deemed to be inappropriate.  Access to some pages are restricted to the admin role.
- An average review rating (the underlying method, developed using ruby, checks all reviews belonging to the park).
- Pagination (developed with Kaminari).

# Development

ParkPerks was developed in Ruby on Rails.

Also used during the application development

- Foundation (http://foundation.zurb.com/) was used for css styling.
- Devise (https://github.com/plataformatec/devise) was used for authentication.
- Carrierwave (https://github.com/carrierwaveuploader/carrierwave) was used for avatar image handle.

## Testing

For development tasks such as running benchmarks or testing, you need to clone the repository and install bundle.  All required gems are listed in the Gemfile.

Install [bundle](http://bundler.io/).

    git clone github.com/ezrashim/park_relm.git
    cd park_relm
    bundle install

## Test Development

The following gems were used to develop and run unit and feature tests:
- RAKE (http://rake.rubyforge.org/)
- RSpec (http://rspec.info/)
- Capybara (https://github.com/jnicklas/capybara)
- shoulda-matchers (http://matchers.shoulda.io/)
- poltergeist (https://github.com/teampoltergeist/poltergeist)

To prepare for testing, run:

    rake db:test:prepare

To run all test files, run:

    rake

You may specify an individual test file to run using rspec:

    rspec <full test name>

For example:

    rspec spec/features/user_views_user_detail_spec.rb

**Note** that some feature testing requires the use of Chrome browser, which must be located in the user's application directory.

# ER Diagram

![Entity Relationship Diagram] (https://drive.google.com/file/d/0B0YuNqlqhv9Yc1A0a1FzX3E0Xzg/view?usp=sharing)

# Copyright

Copyright (c) 2016 Roman Levitas, Ezra Shim, Leon Russo & Meder Toktosunov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
