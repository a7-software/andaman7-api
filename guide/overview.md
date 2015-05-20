---
layout: page
title: Overview
---
{% include JB/setup %}

<div id="toc"></div>


## Introduction

The API is currently in version 1 and can be access over HTTPS via `api.andaman7.com/public/v1/`.

It is a REST API and all messages are in JSON format.


## REST

With [REST](http://en.wikipedia.org/wiki/Representational_state_transfer), data are resources and they are accessed using the HTTP protocol.

For example, if you want to get a list of users, you make a `GET` HTTP request on the `users` collection.

### HTTP verbs

Here are the CRUD operations, their corresponding HTTP verb and the action performed on the resources.

CRUD operation | HTTP verb | Description
-------------- | --------- | -----------
Create         | `POST`    | Creates a new resource.
Read           | `GET`     | Retrieves a single resource or a collection of resources.
Update         | `PUT`     | Updates an existing resource.
Delete         | `DELETE`  | Delete a resource.
{: class="table"}

## API key

All the requests must include an API key. There is one API key per application that is using the API.
If you don't have one, you have to request it before starting to use the API.

Once you have an API key, you make requests to the API by adding an HTTP header : `api-key: <YOUR API KEY>`.

## Authentication

Some API calls need the end user to be authenticated. This can be achieved using *Basic HTTP Authentication*.

Thus, your request must include an additional HTTP header : `Authorization: Basic <CREDENTIALS>`. 
Where `<CREDENTIALS>` is the concatenation of the username, the `:` symbol and the password hashed using the SHA-256 algorithm.
Then, the whole string is encoded in base 64.

In other words : `Base64(<username>:SHA256(<password>))`.

## Response formats

As said earlier, all the messages are in JSON format. All the responses have the same format.
In each response, there are 3 sections : the metadata, the real data and the links.

~~~json
{
    "meta": {},
    "<data_name>": {},
    "links": {}
}
~~~

The **metadata** are essentially used when a collection of data is returned, basically to give pagination information.

The key used for the **data** section depends on the data that is being returned.
For example, if the server returns a single user, the key will be `user`. If a collection of user is returned, then the key is `users`.

The **links** section will be explained in the [hypermedia](#hypermedia) part.


## Hypermedia
{:#hypermedia}

TODO

## Pagination

TODO


## Errors

TODO


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul'
        });
    });
    
</script>