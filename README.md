### Pairing is Caring

This application facilitates the coordination of mentoring appointments. Anyone who is willing to mentor can expose their availability. Anyone who wants some mentoring can request to create an appointment with an available mentor. We encourage people to use the time to pair program together.

#### Bootstrap

```
git clone git@github.com:Devbootcamp/mentor-pairing.git
cd mentor-pairing
bundle install
rake db:create:all db:migrate db:test:prepare
rspec
```

#### UI Development

Pairing Is Caring uses Compass to compile Sass to CSS. To edit the styles and have Compass automatically watch for your changes, run:

	bundle exec compass watch

For more, [check out the Compass documentation](http://compass-style.org/).
