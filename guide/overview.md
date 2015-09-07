---
layout: comments
title: Overview
---
{% include JB/setup %}

In this section, you will find all the basic concepts related to the API and the messages format.

The API is currently in version 1 and can be accessed over HTTPS using the following URL : `https://api.andaman7.com/public/v1/`.

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
Delete         | `DELETE`  | Deletes a resource.
{: class="table table-bordered table-striped table-hover"}

## API key

All the requests must include an API key. There is one API key per application that is using the API.
If you don't have one, you have to request it before starting to use the API.

To request an API key, see [this section]({{ BASE_PATH }}/getting-started.html).

Once you have an API key, you make requests to the API by adding an HTTP header : `api-key: <YOUR API KEY>`.

## Authentication

Some API calls need the end user to be authenticated. This can be achieved using [Basic HTTP Authentication](https://en.wikipedia.org/wiki/Basic_access_authentication).

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

As said earlier, all the messages are in JSON format. By default, they only contain the raw asked data.
But it is possible to specify the `_envelope` query parameter and set its value to `true` in order to get additional
information about the request. Example : `https://api.andaman7.com/public/v1/users?_envelope=true`

The envelope, as we call it, contains 3 sections : the metadata, the raw data and the links.

~~~json
{
    "meta": {},
    "<data_name>": {},
    "links": {}
}
~~~

The **metadata** are essentially used when a collection of data is returned, basically to give pagination information.

The key used for the **data** section depends on the data that is being returned.
For example, if the server returns a single user, the key will be `user`. If a collection of users is returned, then the key is `users`.

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

When the envelope is displayed, most responses include links to other resources that are related to the current one.
They give clues on the relationship between resources and may ease the first contact with the API.

Those links are included in the `links` section of the envelope and it contains at least one item, which is the link to the current resource (`self`).

### Example

Here is an example of envelope :

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

The pagination is simply used to split a large collection of items into multiple pages. For example, this can be useful
for mobile apps to lazy load some search results.

Pagination can be achieved by specifying 2 query parameters : `_page` and `_perPage`, respectively for the number of the
page an the number of items in a page.

### Example

Here is the response after hitting <code>GET {{ site.andaman7_endpoint_url }}/users?<strong>_page=3&_perPage=8</strong></code> to get
the third page of the users with 8 users per page.

~~~json
{
    "meta": {
        "page": 3,
        "perPage": 8,
        "totalPages": 19,
        "count": 8,
        "totalItems": 146,
        "hasMore": true
    },
    "users": [
        ...
    ],
    "links": [
        {
            "rel": "first",
            "href": "{{ site.andaman7_endpoint_url }}/users?_page=1&_perPage=8"
        },
        {
            "rel": "prev",
            "href": "{{ site.andaman7_endpoint_url }}/users?_page=2&_perPage=8"
        },
        {
            "rel": "next",
            "href": "{{ site.andaman7_endpoint_url }}/users?_page=4&_perPage=8"
        },
        {
            "rel": "last",
            "href": "{{ site.andaman7_endpoint_url }}/users?_page=19&_perPage=8"
        }
    ]
}
~~~

You can notice that there are some additional information in the `meta` section and there are also links to navigate
through the pages in the `links` section.

## Filtering

If you want only some fields to appear in the response or some you don't, you can add the `_fields` query parameter.
The value is the coma-separated list of the fields you want to appear in the response. Nested fields must be separated from their parent by a `.`.
On the other side, if you want a field not to appear in the response, you have to prefix its name by a `!`.

### Example

Try to hit this URL : <code>{{ site.andaman7_endpoint_url }}/users?<strong>_fields=type,administrative.firstName,administrative.lastName</strong></code>

You should get something like this :

~~~json
[
  {
    "type": "PATIENT",
    "administrative": {
      "firstName": "John",
      "lastName": "Doe"
    }
  },
  {
    "type": "DOCTOR",
    "administrative": {
      "firstName": "Gregory",
      "lastName": "House"
    }
  },
  ...
]
~~~

## Search

Each resource can be searched according to their fields. To do so, queries must include a query parameter per search field.

For string type fields, the given pattern is contained in the field. The search is case insensitive.
For other type fields like numbers or dates, we provide comparison operators :

### Supported operators

Operator                       | Description                                  | Parameter(s) type(s)
------------------------------ | -------------------------------------------- | --------------------
`eq(<param>)`                  | Equal to &lt;param&gt;                       | String, number or date
`lt(<param>)`                  | Less than &lt;param&gt;                      | Number or date
`le(<param>)`                  | Less than or equal to &lt;param&gt;          | Number or date
`gt(<param>)`                  | Greater than &lt;param&gt;                   | Number or date
`ge(<param>)`                  | Greater than or equal to &lt;param&gt;       | Number or date
`between(<param1>, <param2>)`  | Between &lt;param1&gt; and &lt;param2&gt;    | Number or date
{: class="table table-bordered table-striped table-hover"}

The dates must be in ISO format (ex: 2015-08-27) and you can use the keyword `now` to refer to the current date.

### Example

For example, to search the english translation entries containing "test" we call the following URL : <code>{{ site.andaman7_endpoint_url }}/translations?creationDate=<strong>between(2015-07-01, 2015-07-15)</strong>&<strong>translationEntries.EN=date</strong></code>.

Here is the returned JSON :

~~~json
[
    {
        "id": "E3DE38C8-1E64-420F-9864-62F70E1F0E19",
        "self": "http://localhost:8080/public/v1/translations/webapp.validation.date?_languages=*",
        "creationDate": "2015-07-02T21:26:49.650+0000",
        "modificationDate": "2015-07-02T21:26:49.650+0000",
        "key": "webapp.validation.date",
        "translationEntries": {
            "EN": "Validation date",
            "FR": "Date de validation",
            "NL": "Validatiedatum"
        }
    },
    {
        "id": "AA75D62C-7FDD-454E-8EA2-0FFCA25EBDC4",
        "self": "http://localhost:8080/public/v1/translations/webapp.monitoring.date?_languages=*",
        "creationDate": "2015-07-02T21:16:35.790+0000",
        "modificationDate": "2015-07-02T21:16:35.790+0000",
        "key": "webapp.monitoring.date",
        "translationEntries": {
            "EN": "Date",
            "FR": "Date",
            "NL": "Datum"
        }
    }
]
~~~


## Postman collection

If you plan to use [Postman](https://www.getpostman.com/) to test the API calls, you might want to download our
collection of pre-created requests :

1. In Postman, click on ![Import]({{ ASSET_PATH }}/andaman7/images/postman/import.png)
2. Select the "Download from link" tab
3. Paste the following link in the field : [https://www.getpostman.com/collections/be181827fb0128d5ac63](https://www.getpostman.com/collections/be181827fb0128d5ac63)

A new collection should have been created. The next step is to create an environment with some key-value pairs :
<ol>
    <li>
        Click on "No environment" in the top-right corner<br/>
        <img src="{{ ASSET_PATH }}/andaman7/images/postman/no_environment.png" alt="No environment" />
    </li>
    <li>
        Click on "Manage environments"<br/>
        <img src="{{ ASSET_PATH }}/andaman7/images/postman/manage_environments.png" alt="Manage environment" />
    </li>
    <li>
        Click on the "Add" button<br/>
        <img src="{{ ASSET_PATH }}/andaman7/images/postman/add_environment.png" alt="Add environment" />
    </li>
    <li>
        Set a name for the environment and add the following key/values :<br/>
        <img src="{{ ASSET_PATH }}/andaman7/images/postman/new_environment.png" alt="" />
    </li>
</ol>

<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul'
        });
    });
    
</script>