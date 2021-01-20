# README

Endpoint all movies
/api/v1/movies

Endpoint all seasons
/api/v1/seasons

Endpoint all seasons and movies
/api/v1/libraries

Create a purchase
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -d '{ "purchase_option_id": "1" }' \
     http://localhost:3000/api/v1/users/1/purchases



