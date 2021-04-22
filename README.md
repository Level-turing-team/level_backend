

[![Build Status](https://travis-ci.com/Level-turing-team/level_backend.svg?branch=main)](https://travis-ci.com/Level-turing-team/level_backend)
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

There are plenty of sites to host all types of art, from music to photos or anything else you want to share, there's less supply of apps and resources to connect you one on one with other individuals who share your drive and passion. Level helps you more easily connect with local people through our location based searches who share your passion and drive for your creative endeavors. Level concentrates as much of your work as you want from other hosting services to help ensure the connections you make are fruitful and grounded in common interest prior to taking the jump and meeting a co-collaborator in person. Get connected. Make Art. Level the playing field.


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle install`
3. Register for a google [OAuth Client](https://developers.google.com/identity/protocols/oauth2) 
4. Create and Migrate DB
```
$rails db:{create,migrate}
```
5. Install needed Figaro config
```
$bundle exec figaro install
```
6. Add environemnt variables to `config/application.yml`
> Sample config
```

CLIENT_ID: 'your google oauth client id'
CLIENT_SECRET: 'your google oauth client secret'
development:
  API_URL: 'http://localhost:3001'
production:
  API_URL: "your microservice heroku link"
test:
  API_URL: 'http://localhost:3001'
```
7. Start your server!
> Must have backend application running on port 3001

```
$ rails s
```
### Prerequisites

* Ruby 2.5.3
* Rails 5.2.5
* Deployed microservice and backend repo

<!-- USAGE EXAMPLES -->

<details open>
<summary>ReST Endpoints</summary>
<br>

    
### POST Profile
* Create a profile
> Required Parameters: `:user_id` `:zipcode`
```
POST   /api/v1/profiles
```

<details open>
<summary>Sample Response</summary>
<br>
  
```
{
  'data': 'profile created successfully'
}

```

</details>

### GET Profiles Circles
* Returns the circle of a given profile
> Required Parameters: `:user_id` 
```
GET    /api/v1/profiles/:id/circle
```

<details closed>
<summary>Sample Response</summary>
<br>
  
  ```
{
    "data": [
        {
            "id": "2",
            "type": "profile",
            "attributes": {
                "zipcode": "80305",
                "user_id": 2,
                "profile_picture": "http://www.google.com",
                "username": "korn"
            }
        },
        {
            "id": "3",
            "type": "profile",
            "attributes": {
                "zipcode": "80304",
                "user_id": 3,
                "profile_picture": "http://www.google.com",
                "username": "slipknot"
            }
        },
        {
            "id": "4",
            "type": "profile",
            "attributes": {
                "zipcode": "80303",
                "user_id": 4,
                "profile_picture": "http://www.google.com",
                "username": "photos by jim"
            }
        },
        {
            "id": "5",
            "type": "profile",
            "attributes": {
                "zipcode": "80544",
                "user_id": 5,
                "profile_picture": "http://www.google.com",
                "username": "arteest"
            }
        }
    ]
}

```

</details>

### POST Create Profile Post
* Creates a post for the given profile
> Required Parameters: `:user_id` `:content`
> Optional Parameters: `:link`
```
POST   /api/v1/profiles/:id/post
```
<details open>
<summary>Sample Response</summary>
<br>

```
{
  'data': 'post created successfully'
}

```

</details>

### GET Profile's Cirlce Recent Posts
* Returns the recent posts of a given profile's circle
> Required Parameters: `:user_id` 
```
GET    /api/v1/profiles/:id/circle/posts

```

<details closed>
<summary>Sample Response</summary>
<br>
  
  ```
{
    "data": [
        {
            "id": "4",
            "type": "post",
            "attributes": {
                "content": "hey did you see that headline?",
                "link": "photoURL.com",
                "user_id": 2,
                "created_at": "2021-04-21T20:35:56.040Z"
            }
        },
        {
            "id": "5",
            "type": "post",
            "attributes": {
                "content": "hey checkout my create shoes?",
                "link": "photoURL.com",
                "user_id": 2,
                "created_at": "2021-04-21T20:35:56.043Z"
            }
        },
        {
            "id": "6",
            "type": "post",
            "attributes": {
                "content": "hey did you see software update?",
                "link": "photoURL.com",
                "user_id": 3,
                "created_at": "2021-04-21T20:35:56.047Z"
            }
        },
        {
            "id": "7",
            "type": "post",
            "attributes": {
                "content": "hey did you see I called you?",
                "link": null,
                "user_id": 3,
                "created_at": "2021-04-21T20:35:56.050Z"
            }
        },
        {
            "id": "8",
            "type": "post",
            "attributes": {
                "content": "hey did you see that we're not friends on FB anymore?",
                "link": "photoURL.com",
                "user_id": 4,
                "created_at": "2021-04-21T20:35:56.053Z"
            }
        },
        {
            "id": "9",
            "type": "post",
            "attributes": {
                "content": "hey did you see hear about that create app called 'level'?",
                "link": "photoURL.com",
                "user_id": 4,
                "created_at": "2021-04-21T20:35:56.057Z"
            }
        },
        {
            "id": "10",
            "type": "post",
            "attributes": {
                "content": "hey i just got hired at a sick new comapny",
                "link": null,
                "user_id": 5,
                "created_at": "2021-04-21T20:35:56.060Z"
            }
        }
    ]
}

```

</details>


### GET Profile
* Returns a given profile
> Required Parameters: `:user_id` 
```
GET    /api/v1/profiles/:id 

```

<details closed>
<summary>Sample Response</summary>
<br>

```
{
    "data": {
        "id": "1",
        "type": "profile",
        "attributes": {
            "zipcode": "80301",
            "user_id": 1,
            "profile_picture": "http://www.google.com",
            "username": "the painter man"
        }
    }
}
```

</details>

### GET Profile's Posts
* Returns posts for a given profile
> Required Parameters: `:user_id`

```
GET    /api/v1/profiles/:id/post

```

<details closed>
<summary>Sample Response</summary>
<br>
  
  ```
{
    "data": [
        {
            "id": "1",
            "type": "post",
            "attributes": {
                "content": "hey did you see new movie trailer?",
                "link": "photoURL.com",
                "user_id": 1,
                "created_at": "2021-04-21T20:35:56.029Z"
            }
        },
        {
            "id": "2",
            "type": "post",
            "attributes": {
                "content": "hey did you see that create meme?",
                "link": "photoURL.com",
                "user_id": 1,
                "created_at": "2021-04-21T20:35:56.032Z"
            }
        },
        {
            "id": "3",
            "type": "post",
            "attributes": {
                "content": "hey did you see that new phone?",
                "link": null,
                "user_id": 1,
                "created_at": "2021-04-21T20:35:56.036Z"
            }
        }
    ]
}
```




</details>

### GET Profile's Galleries
* Returns the galleries of a given profile
> Required Parameters: `:user_id` 
```
GET  /api/v1/profiles/:id/galleries

```

<details closed>
<summary>Sample Response</summary>
<br>
  
  ```
{
    "data": [
        {
            "id": "1",
            "type": "gallery",
            "attributes": {
                "user_id": 1,
                "name": "photos from cali",
                "created_at": "2021-04-21T20:35:56.071Z",
                "updated_at": "2021-04-21T20:35:56.071Z",
                "photo_url": "http://www.google.com"
            }
        },
        {
            "id": "9",
            "type": "gallery",
            "attributes": {
                "user_id": 1,
                "name": "PROFILE",
                "created_at": "2021-04-21T20:35:56.100Z",
                "updated_at": "2021-04-21T20:35:56.100Z",
                "photo_url": "http://www.example.com"
            }
        }
    ]
}
```

</details>


### GET Distance
* Returns the distance between two users `Granted those two users have valid zip copdes`
> Required Parameters: `:current_user` `:user`

```
GET /api/v1/distance
```

<details closed>
<summary>Sample Response</summary>
<br>

```
{
    "data": 5.19
}
```

</details>

### POST Profile Circle
* Creates a circle record for given profile
> Required Parameters: `:user_id` `:following_id`

```
POST   /api/v1/profiles/:id/circle
```

<details closed>
<summary>Sample Response</summary>
<br>

```
 {
  'data': 'circle created successfully'
 }
```

</details>

### POST Profile Gallery
* Creates a gallery for a given profile
> Required Parameters: `:user_id` `:following_id`

```
POST   /api/v1/profiles/:id/circle
```

<details closed>
<summary>Sample Response</summary>
<br>

```
 {
  'data': 'circle created successfully'
 }
```

</details>

### POST Profile Gallery Photo
* Creates a photo in the profiles given gallery
>Required Parameters: `:user_id` `:gallery_id` `:description`

**Endpoint Options**
- Postman
 * `Attach a body and select _binary_`
- Front-End
 * `Click the _Choose File_ button when uploading a photo to a gallery`

```
POST   /api/v1/profiles/:id/galleries/:gallery_id/photos
```

<details closed>
<summary>Sample Response</summary>
<br>
  
```
{
  'data': 'photo created successfully'
}
```
  
</details>

### GET Profile Gallery Photos
* Returns a given profile's gallery photos
>Required Parameters: `:id` `:gallery_id`

```
GET    /api/v1/profiles/:id/galleries/:gallery_id/photos
```

<details closed>
<summary>Sample Response</summary>
<br>
  
```
  {
    "data": [
        {
            "id": "1",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.114Z",
                "updated_at": "2021-04-21T20:35:56.114Z",
                "gallery_id": 1
            }
        },
        {
            "id": "2",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.119Z",
                "updated_at": "2021-04-21T20:35:56.119Z",
                "gallery_id": 1
            }
        },
        {
            "id": "3",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.124Z",
                "updated_at": "2021-04-21T20:35:56.124Z",
                "gallery_id": 1
            }
        }
    ]
}
  
```
  
</details>


### DELETE Destroy Profile Gallery
* Deletes the given gallery
>Required Parameters: `:gallery_id`

```
POST   /api/v1/profiles/:id/galleries/:gallery_id/photos
```
<details closed>
<summary>Sample Response</summary>
<br>
  
```
  {
    'data': 'gallery deleted successfully'
  }
```
  
</details>

### GET Profile Discover
* Returns profile's in a set radius
>Required Parameters: `:id`

```
GET    /api/v1/profiles/:id/discover
```

<details closed>
<summary>Sample Response</summary>
<br>
  
```
  {
    UPDATE WITH SAMPLE RESPONSE
  }
```
  
</details>

### GET Discover Photos
* Returns recent photos posted

```
GET    /api/v1/photos
```

<details closed>
<summary>Sample Response</summary>
<br>
  
```
 {
    "data": [
        {
            "id": "23",
            "type": "photo",
            "attributes": {
                "description": "feature photo",
                "url": "http:www.example.com",
                "created_at": "2021-04-21T20:35:56.221Z",
                "updated_at": "2021-04-21T20:35:56.221Z",
                "gallery_id": 9
            }
        },
        {
            "id": "22",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.217Z",
                "updated_at": "2021-04-21T20:35:56.217Z",
                "gallery_id": 8
            }
        },
        {
            "id": "21",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.211Z",
                "updated_at": "2021-04-21T20:35:56.211Z",
                "gallery_id": 8
            }
        },
        {
            "id": "20",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.206Z",
                "updated_at": "2021-04-21T20:35:56.206Z",
                "gallery_id": 8
            }
        },
        {
            "id": "19",
            "type": "photo",
            "attributes": {
                "description": "pic 1",
                "url": "http:www.google.com",
                "created_at": "2021-04-21T20:35:56.201Z",
                "updated_at": "2021-04-21T20:35:56.201Z",
                "gallery_id": 8
            }
        }

    ]
}
```
  
</details>



### GET Profile Search
* Returns profile based off of `search type` and `search term`
>Required Parameters: `:id` and `:search_type` = `:search_term`

```
GET    /api/v1/profiles/:id/search?search_type=search_term
```

<details closed>
<summary>Sample Response</summary>
<br>
  
```
  {
    {
    "data": [
        {
            "id": "3",
            "type": "profile",
            "attributes": {
                "zipcode": "80304",
                "user_id": 3,
                "profile_picture": "http://www.google.com",
                "username": "slipknot"
            }
        },
        {
            "id": "4",
            "type": "profile",
            "attributes": {
                "zipcode": "80303",
                "user_id": 4,
                "profile_picture": "http://www.google.com",
                "username": "photos by jim"
            }
        },
        {
            "id": "6",
            "type": "profile",
            "attributes": {
                "zipcode": "80228",
                "user_id": 6,
                "profile_picture": "http://www.google.com",
                "username": "former salesman"
            }
        }
    ]
}
  }
```
  
</details>


### GET Profile Tags
* Returns the tags available for a given profile
> Required Parameters: `:user_id`

```
GET    /api/v1/profile/:id/tags
```

<details closed>
<summary>Sample Response</summary>
<br>

```
{
    "data": [
        {
            "id": "1",
            "type": "tag",
            "attributes": {
                "name": "Painter"
            }
        },
        {
            "id": "3",
            "type": "tag",
            "attributes": {
                "name": "Sculpter"
            }
        }
    ]
}
```

</details>

### POST Tags Create
* Creates a tag
> Required Parameters: `:name`

```
POST   /api/v1/tags
```

<details closed>
<summary>Sample Response</summary>
<br>

```
{
    'data': 'tags successfully created' 
}
```

</details>


### POST Profile Tags
* Creates a tag
> Required Parameters: `:user_id` `:tag_id`

```
POST   /api/v1/profile/:id/tags
```

<details closed>
<summary>Sample Response</summary>
<br>

```
{
    'data': 'tags successfully created' 
}
```

</details>
</details>
