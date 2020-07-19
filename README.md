# Sweater Weather API

## About
Sweater Weather is a REST API for an application that allows users to see and plan road trips based on current and destination weather.

To simulate a working with a front end team, I was provided with the following wireframes and instructed to build out the required endpoints.

### Application Landing Page
![Wireframe 1](https://backend.turing.io/module3/projects/sweater_weather/images/root.png)
### Registration
![Wireframe 2](https://backend.turing.io/module3/projects/sweater_weather/images/sign_up.png)
### Login
![Wireframe 3](https://backend.turing.io/module3/projects/sweater_weather/images/login.png)
### Road Trip
![Wireframe 4](https://backend.turing.io/module3/projects/sweater_weather/images/road_trip.png)

## Setup
```
$ git clone git@github.com:SMJ289/sweater_weather.git
$ cd sweater_weather
$ bundle install
$ rails db:create
$ rails db:migrate
$ bundle exec figaro install
```
**Additonally**
You will need to provide the following API keys

- [Google Geocoding](https://console.cloud.google.com/apis/library/geocoding-backend.googleapis.com)
- [Open Weather](https://openweathermap.org/api/one-call-api)
- [Unsplash](https://unsplash.com/developers)

And insert them into the `application.yml` file in this format:

```
GOOGLE_API_KEY: <your api key>
WEATHER_API_KEY: <your api key>
UNSPLASH_API_KEY: <your api key>
```

## Testing
Run `bundle exec rspec` to run the automated test suite

## API Endpoints

**GET /api/v1/forecast**
```
location=<city,state>
```

**GET /api/v1/backgrounds**
```
location=<city,state>
```

**POST /api/v1/users**
```
{
  "email": "<email>",
  "password": "<password>",
  "password_confirmation": "<password>"
}
```

**POST /api/v1/sessions**
```
{
  "email": "<email>",
  "password": "<password>"
}
```

**POST /api/v1/road_trip**
```
{
  "origin": "<city,state>",
  "destination": "<city,state>",
  "api_key": "<Sweater Weather API Key>"
}
```
