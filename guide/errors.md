---
layout: page
title: Errors
---
{% include JB/setup %}

<div id="toc"></div>


## HTTP status codes
***

### 401 - Unauthorized
{: id="401"}
***

#### Description
You must be authenticated and/or provide a valid API key to access the resource.

#### How to solve it
Check that the API key you provided is a valid one and check that it is correctly set in the headers.
See [here]({{ BASE_PATH }}/guide/overview.html#api-key) how to set the API key.

If the API key is correctly set and is valid, the problem probably comes from the credentials.
Check that the credentials are correctly set and are valid. See [here]({{ BASE_PATH }}/guide/overview.html#authentication) how to authenticate.


### 404 - Not Found
{: id="404"}
***

#### Description
The requested resource has not been found.

#### How to solve it
Check that the URL that you provided is correct. See the page of the API endpoint you are trying to contact.


### 500 - Internal Server Error
{: id="500"}
***

#### Description
Something is broken on our side.

#### How to solve it
Please [contact us](mailto:api@andaman7.com) or you can report the problem on the [forum]({{ BASE_PATH }}/forum.html). We will try to solve the problem as soon as possible.


## Custom codes

The are currently no custom codes.


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            headers: 'h1, h2, h3'
        });
    });
    
</script>