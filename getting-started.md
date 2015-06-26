---
layout: page
title: Getting started
---
{% include JB/setup %}

{% capture me_url %}{{ site.andaman7_endpoint_url }}/users/me{% endcapture %}
{% capture devices_url %}{{ site.andaman7_endpoint_url }}/users/me/devices{% endcapture %}
{% capture users_url %}{{ site.andaman7_endpoint_url }}/users{% endcapture %}
{% capture trusted_users_url %}{{ site.andaman7_endpoint_url }}/users/me/trusted-users{% endcapture %}

<div id="toc"></div>

## Step 1 : Request an API key
***

Before starting to use the API, you need an API key as well as an account.

If you don't already have them, please make a request by hitting the button below. Otherwise, let's go to the next step.

<br/><button class="btn btn-primary">Get an API key</button> 
<br/><br/>

## Step 2 : Your first request
***

Your first API call will consist in getting your personal information.

To do this, you simply need to perform a `GET` HTTP request, mentioning your *API key* and your *credentials*, to the following URL : `{{ me_url }}`

For more information about the authentication, check out [this part]({{ BASE_PATH }}/guide/introduction.html\#authentication) of the developer's guide.

#### Form

<form class="form-inline">
    <div class="form-group">
        <input id="apiKeyInput" type="text" placeholder="API key" class="form-control" />
    </div>
    <div class="form-group">
        <input id="emailInput" type="text" placeholder="Email" class="form-control" />
    </div>
    <div class="form-group">
        <input id="passwordInput" type="password" placeholder="Password" class="form-control" />
    </div>
</form>

#### HTTP request

<div class="well code">
    GET {{ me_url }} <br/>
    api-key: <span class="apiKey"></span> <br/>
    Authorization: Basic <span class="base64"></span>
</div>


#### Curl command

<div class="well code">
    curl {{ me_url }} \<br/>
    <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span> \<br/>
    <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>
</div>

#### Example of HTTP response body

~~~json
{
    "id": "08ac1180-fd21-11e4-b939-0800200c9a66",
    "administrative": {
        "firstName": "Phil",
        "lastName": "Miller",
        "address": {
            "street": "The cul-de-sac",
            "town": "Tucson, Arizona",
            "country": "United States"
        }
    }
}
~~~

<br/>

## Step 3 : Add a device
***

In this step, you will create a device. This is a requirement in order to share data with other users.
In the Andaman7 application, devices are smartphones and tablets. But, in other contexts they might be anything else.
For example, in hospitals, devices can be MRI machines or PET scanners.
More generally, a device is something that can produce information to be sent to Andaman7.

Adding a device is pretty simple, you need to perform a POST HTTP request to `{{ devices_url }}`
specifying the identifier ([UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) version 4) of the new device and the device name in the body of the request.

Example of UUID v4 : `25340a74-14b3-4008-a6a3-fe60a2847c34`.

#### Form

<form class="form-inline">
    <div class="form-group">
        <input id="deviceIdInput" type="text" placeholder="Device ID" class="form-control" />
    </div>
    <div class="form-group">
        <input id="deviceNameInput" type="text" placeholder="Device name" class="form-control" />
    </div>
</form>

#### HTTP request

<div class="well code">
    POST {{ devices_url }}<br/>
    api-key: <span class="apiKey"></span><br/>
    Authorization: Basic <span class="base64"></span><br/>
    Content-Type: application/json<br/>
    <br/>
    { "id": "<span class="deviceId"></span>", "name": "<span class="deviceName"></span>" }
</div>

#### Curl command

<div class="well code">
    curl {{ devices_url }} \<br/>
    <span class="tabulation"></span>-X POST \<br/>
    <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
    <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>' \<br/>
    <span class="tabulation"></span>-H 'Content-Type: application/json' \<br/>
    <span class="tabulation"></span>-d '{ "id": "<span class="deviceId"></span>", "name": "<span class="deviceName"></span>" }'
</div>

#### Example of HTTP response body

<div class="well code">
    {<br/>
    <span class="tabulation"></span>"id": "<span class="deviceId"></span>",<br/>
    <span class="tabulation"></span>"name": "<span class="deviceName"></span>"<br/>
    }
</div>
<br/>


## Step 4 : Invite a user to your circle of trust
***

To add a user to your circle of trust, you first need to get the ID of this user.
You can get user ID's by searching the users.

### Search among existing users

Search can be achieved by sending a GET HTTP request to `{{ users_url }}`.

To filter the users based on certain criteria, additional query parameters can be specified.
For more information on query filter parameters, see [this section]({{ BASE_PATH }}/endpoints/users.html\#getUsersPanel).

#### HTTP request

<div class="well code">
    GET {{ users_url }}?_page=1&_perPage=10<br/>
    api-key: <span class="apiKey"></span><br/>
    Authorization: Basic <span class="base64"></span>
</div>

#### Curl command

<div class="well code">
    curl {{ users_url }}?_page=1&_perPage=10 \<br/>
    <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
    <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>'
</div>

### Send an invitation

Once you have found the ID of the user you want to add to your circle of trust, you can send him or her an invitation.

This can be done using a PUT HTTP request on `{{ trusted_users_url }}` with a JSON body specifying your device ID and the ID of the user you want to invite.

#### Form

<form class="form-inline">
    <div class="form-group">
        <input id="memberIdInput" type="text" placeholder="Member ID" class="form-control" />
    </div>
</form>

#### HTTP request

<div class="well code">
    POST {{ trusted_users_url }}<br/>
    api-key: <span class="apiKey"></span><br/>
    Authorization: Basic <span class="base64"></span><br/>
    Content-Type: application/json<br/>
    <br/>
    { "senderDeviceId": "<span id="deviceId" class="uuid"></span>", "memberId": "<span class="memberId"></span>" }
</div>

#### Curl command

<div class="well code">
    curl {{ trusted_users_url }} \<br/>
    <span class="tabulation"></span>-X PUT \<br/>
    <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
    <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>' \<br/>
    <span class="tabulation"></span>-H 'Content-Type: application/json' \<br/>
    <span class="tabulation"></span>-d '{ "senderDeviceId": "<span class="deviceId"></span>" "memberId": "<span class="memberId"></span>" }'
</div>

#### Example of HTTP response body

~~~json
[
    {
        "self": "{{ users_url }}/f12503f3-3e5d-453f-ae3b-ae9c1c8aff6f",
        "id": "f12503f3-3e5d-453f-ae3b-ae9c1c8aff6f",
        "administrative": {
            "firstName": "Rosanna",
            "lastName": "Bryant"
        }
    },
    {
        "self": "{{ users_url }}/97e9da54-5481-454d-ac61-0fe1dd5464d5",
        "id": "97e9da54-5481-454d-ac61-0fe1dd5464d5",
        "administrative": {
            "firstName": "Kirkland",
            "lastName": "Malone"
        }
    }
]
~~~

You are now reaching the end of this tutorial. To go further, we invite you to read the [developer's guide]({{ BASE_PATH }}/guide/overview.html).


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            headers: 'h1, h2, h3'
        });
    
        initBase64Placeholders();
        bind('#apiKeyInput', '.apiKey', '<YOUR_API_KEY>');
        bind('#deviceIdInput', '.deviceId', '<YOUR_DEVICE_ID>');
        bind('#deviceNameInput', '.deviceName', '<YOUR_DEVICE_NAME>');
        bind('#memberIdInput', '.memberId', '<MEMBER_ID>');
    
        $("#emailInput").bind("keyup", buildBasicAuth);
        $("#passwordInput").bind("keyup", buildBasicAuth);
        
        $('#deviceIdInput').val(generateUUID());
    
        $('.uuid').each(function() {
            $(this).text(generateUUID());
        });
        
        $('.deviceId').each(function() {
            $(this).text($('#deviceIdInput').val());
        });
    });
    
    function initBase64Placeholders() {
    
        $('.base64').each(function() {
            $(this).text('<BASE64_STRING>');
        });
    }
    
    function buildBasicAuth() {
    
        var base64 = getBasicAuthCredentials();
    
        $(".base64").each(function() {
            $(this).text(base64);
        });
    }
    
    function getBasicAuthCredentials() {
        var email = $("#emailInput").val();
        var password = $("#passwordInput").val()
    
        if(email === '' && password === '') {
            initBase64Placeholders();
            return;
        }
    
        input = email + ':' + CryptoJS.SHA256(password);
        base64 = base64Encode(input);
        
        return base64;
    }
    
</script>