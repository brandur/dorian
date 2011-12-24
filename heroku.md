Working on Heroku
=================

The use of `config/app.rb` makes working on Heroku a little more difficult due to the platform's readonly file system (everything that is to be deployed should be inside the Git repository directly).

I get around this using a `production` branch where `app.rb` is committed. This branch is pushed to Heroku but obviously never to GitHub.

    git checkout -b production
    cp config/app.rb.example config/app.rb
    <edit app.rb>
    git commit config/app.rb

When making a change to the Rails app, checkout `master`, commit the changes, then rebase the `production` branch to `master`.

    git checkout master
    <edits>
    git commit
    git checkout production
    git rebase master

Deploy production to Heroku as described [on Stack Overflow](http://stackoverflow.com/questions/1489393/good-git-deployment-using-branches-strategy-with-heroku):

    git push heroku production:master
