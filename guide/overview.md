---
layout: page
title: Overview
---
{% include JB/setup %}

In this section, you will find all the basic concepts related to the API and the messages format.

The API is currently in version 1 and can be accessed over HTTPS using the following URL : `api.andaman7.com/public/v1/`.

It is a REST API and all messages are in JSON format.


<div id="toc"></div>


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
{: class="table table-bordered table-hover"}

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

## Responses

### HTTP status codes

Code     | Reason                | Description
-------- | --------------------- | -----------
**200**  | OK                    | The request was successfully executed.
**201**  | Created               | The resource has been successfully created.
**204**  | No Content            | The request was successfully executed but returned no content.
{: class="table table-bordered table-striped table-hover"}

### Format

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

### Errors

When an error occurs, the response has a specific format which looks like this :

~~~json
{
    "status": 404,
    "code": 404,
    "message": "The specified resource does not exist.",
    "developerMessage": "The specified resource does not exist.",
    "moreInfo": "http://developers.andaman7.com/guide/errors.html#404",
    "support": "api@andaman7.com"
}
~~~

The `status` is the HTTP status code returned by the server. The `code` is either the same as the status code or a custom code.
Those codes can be found [here]({{ BASE_PATH }}/guide/errors.html). The `message` is a description of the error that can be understood by end users.
However, the `developerMessage` is a description that is more oriented to the developers and which contains additional information.

## Hypermedia
{:#hypermedia}

Most responses include links to other resources that are related to the returned resource.
Those links might be useful to developers who are discovering the API.

Those links are included in the `links` section of each response and it contains at least one item, which is the link to the current resource (`self`).

Here is an example of response :

~~~json
{
    "meta": {},
    "device": { ... },
    "links": [
        {
            "rel": "self",
            "href": "{{ site.andaman7_endpoint_url }}/users/me/devices/2c8d77d0-fed7-11e4-b939-0800200c9a66"
        },
        {
            "rel": "devices",
            "href": "{{ site.andaman7_endpoint_url }}/users/me/devices"
        },
        {
            "rel": "owner",
            "href": "{{ site.andaman7_endpoint_url }}/users/me"
        }
    ]
}
~~~

## Pagination

TODO


## Filtering

TODO

## Search

TODO


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul'
        });
    });
    
</script>