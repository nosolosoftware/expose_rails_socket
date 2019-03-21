# ExposeRailsSocket

This gem exposes a socket where ruby code could be run on the context of your rails application. It has been developed along with [cypress-rails-socket-connector](https://github.com/nosolosoftware/cypress-rails-socket-connector) to enable to run Ruby code from tests written in Javascript, but this socket is totally agnostic of frameworks and could be integrated with whatever framework you like.

## Getting started

Add this to your Gemfile:

```ruby
group :test, :development do
  gem 'expose_rails_socket'
end
```

Then, the following task initializes a socket on `/tmp/expose_rails_socket.sock`:

```bash
$ rake expose_rails_socket:server
```
This socket receives messages as:

To run a factory_bot previously defined, you could send the following message:

```javascript
{class: 'FactoryBot', method: 'create', args: ['user', [{name: 'New name'}]]}
```

which is equivalent to run:

```ruby
FactoryBot.create(:user, name: 'New name')
```

Chaining methods is also possible:

```javascript
[
  {class: 'FactoryBot', method: 'create', args: ['user', [{name: 'New name'}]]},
  {method: 'id'}
]
```

which is equivalent to run:
```ruby
FactoryBot.create(:user, name: 'New name').id
```
