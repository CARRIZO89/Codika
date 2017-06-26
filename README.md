# Codika API Exercise

API exercise with logging and creation of buildings, floors and rooms

Minimum configuration
----------------------------------------------
    Ruby version: 2.4.0
    Rails version: 5.1.1

Settings
----------------------------------------------
    'bundle install'
    'rails db:create'
	'rails db:migrate'
	'rails db:seed'

Basic use
----------------------------------------------
You can use Postman or cURL. Example using cURL:

1. rails server

2. Get session tokens
```
curl -X POST \
  http://localhost:3000/api/v1/auth/sign_in \
  -H 'cache-control: no-cache' \
  -H 'email: user@example.com' \
  -H 'password: partnership' \
```

3. Copy: 
   -'Access-Token'
   -'Client'
   -'Uid'

5. POST building with tokens
```
curl -X POST \
  'http://localhost:3000/api/v1/buildings?building%5Bname%5D=Sara' \
  -H 'access-token: 07nNRaEYBedRRyR2GOGd0Q' \
  -H 'cache-control: no-cache' \
  -H 'client: SMsYUs3HQDolWfwWYfMpGQ' \
  -H 'postman-token: 0cf775fe-a2fc-db3d-139b-95ce10fac273' \
  -H 'uid: user@example.com'
```
6. POST floor with tokens
```
curl -X POST \
  'http://localhost:3000/api/v1/buildings/:building_id/floors?number=45' \
  -H 'access-token: 07nNRaEYBedRRyR2GOGd0Q' \
  -H 'cache-control: no-cache' \
  -H 'client: SMsYUs3HQDolWfwWYfMpGQ' \
  -H 'postman-token: a2bada95-3a86-4c4e-c3db-becf096cba5d' \
  -H 'uid: user@example.com'
```
7. POST room with tokens
```
curl -X POST \
  'http://localhost:3000/api/v1/buildings/:building_id/floors/:floor_id/rooms?number=22' \
  -H 'access-token: 07nNRaEYBedRRyR2GOGd0Q' \
  -H 'cache-control: no-cache' \
  -H 'client: SMsYUs3HQDolWfwWYfMpGQ' \
  -H 'postman-token: d34dae5a-28bb-cd6e-3d79-93ebab767a9d' \
  -H 'uid: user@example.com'
```

Carrizo Miguel Antonio
