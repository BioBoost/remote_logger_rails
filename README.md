# README

This is an application that can receive remote logs of other apps. These apps only need to be able to send HTTP post request.

The client first needs to be registered via the front-end and given a unique authentication key.

## Log Format

Send post request will following content:

```json
{
    "auth_key": "8 character client authentication key - will later be upgraded to 32 of 64 chars",
    "messages": [
        {
            "content": "Another test from Insomnia1",
            "severity": "verbose|info|debug|warning|error",
            "logtime": "optional log timestamp - format will be known later on"
        },
        {
            "content": "Some test example",
            "severity": "error",
            "logtime": "2017-10-27T19:11:00.000Z"
        }
    ]
}
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### Weird Things

I did install jquery-ujs via npm, as stated on some forum, but not sure if needed. Removed all files and package.json ad it still works. So who knows.

```shell
npm install --save jquery-ujs
```

## Docker

Make sure to rename the file `.env.web.example` to `.env.web` and configure the secret.

Building the image

```shell
docker-compose build
```

Running it

```shell
docker-compose up -d
```

Stopping it

```shell
docker-compose down
```

Need an interactive shell ?

```shell
docker-compose run remote_logger_rails /bin/bash
```
