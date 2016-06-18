A Minimal Sinatra webapp to Glue outgoing slack webhooks to particle inbound API.

This middle layer is neccessary because outgoing Slack webhooks don't offer
customisation that would enable wiring webhooks directly to another API.

Note: Slack webhooks are served over TLS only, this project is designed to 
sit behind a webserver (such as an nginx "proxy_pass" clause) that terminates
the SSL and passes requests to this app via localhost (or an internal LAN).

## Prerequisites

* Ruby
* `gem install bundler`
* A proxy webserver such as nginx with SSL configured (see section below on configuration for nginx specifically).

## Installing

* clone this repository.
* `cd slack2particle && bundle install`
* `cp .env.{example,production}`
* Replace the dummy data in .env.production with your specific secrets. (See your Slack and Particle config pages)
* Configure web server to pass requests from your endpoint to port 3000.

## Running

* `bundle exec thin start`

## TODO
(see github issues)

## See Also
* [jtwarren/slack-webhook](https://github.com/jtwarren/slack-webhook)
* [shoyan/slack-incoming-webhooks](https://github.com/shoyan/slack-incoming-webhooks)

## Nginx configuration
``` nginx
location /supersecretendpoint {
       proxy_set_header  X-Real-IP  $remote_addr;
       proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header Host $http_host;
       proxy_redirect off;
       proxy_pass http://localhost:3000;
}
```

### License
MIT
