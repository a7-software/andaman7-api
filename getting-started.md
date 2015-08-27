---
layout: comments
title: Getting started
---
{% include JB/setup %}

{% capture me_url %}{{ site.andaman7_endpoint_url }}/users/me{% endcapture %}
{% capture devices_url %}{{ site.andaman7_endpoint_url }}/users/me/devices{% endcapture %}
{% capture users_url %}{{ site.andaman7_endpoint_url }}/users{% endcapture %}
{% capture trusted_users_url %}{{ site.andaman7_endpoint_url }}/users/me/trusted-users{% endcapture %}

<div id="toc"></div>

## Step 0 : Read the A7 protocol page
***

To be aware of the philosophy of Andaman7 and its protocol, you should first read the [A7 protocol]({{ BASE_PATH }}/a7-protocol.html) page.

<br/>

## Step 1 : Create an account and request an API key
***

Before starting to use the API, you need an account as well as an API key.

If you don't already have them, please make a request by hitting the button below. Otherwise, let's go to the next step.

<br/><button class="btn btn-primary">Register / Get an API key</button> 
<br/><br/>

## Step 2 : Your first request
***

Your first API call will consist in getting your personal information.

To do this, you simply need to perform a `GET` HTTP request, mentioning your *API key* and your *credentials*, to the 
following URL : `{{ me_url }}`. The credentials are those you gave during the account creation.

For more information about the authentication, check out [this part]({{ BASE_PATH }}/guide/overview.html#authentication) 
of the developer's guide.

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

#### Examples

<ul>
    <li>API key: <code>f41d37d8-2d7e-4c5b-bf09-e8689f14464a</code></li>
    <li>Email: <code>it-support@hospital-x.com</code></li>
    <li>Password: <code>your password</code></li>
</ul>

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

More generally, a device is something that can produce information to be sent to Andaman7. To be simple, you can use
only one device bearing the name of the institution or the medical software used.

A device only belongs to a user. In Andaman7, a user is someone who is able to record information into owned or shared
EHRs. In other contexts, the users can have a broader definition. For example, there can be one user per hospital
service or a single user for a laboratory.

Adding a device is pretty simple, you need to perform a POST HTTP request to `{{ devices_url }}`
specifying the identifier ([UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) version 4) of the new 
device and the device name in the body of the request.  Example of UUID v4 : `25340a74-14b3-4008-a6a3-fe60a2847c34`.
The UUID of the device must be used in the `creatorDeviceId` field of all further API requests.

Adding a device should be done once and the addition of other devices should only be done in exceptional cases.
It is allowed to create up to 5 devices.

#### Form

<form class="form-inline">
    <div class="form-group">
        <input id="deviceIdInput" type="text" placeholder="Device ID" class="form-control" />
    </div>
    <div class="form-group">
        <input id="deviceNameInput" type="text" placeholder="Device name" class="form-control" />
    </div>
</form>

#### Examples

<ul>
    <li>Device ID: <code>25340a74-14b3-4008-a6a3-fe60a2847c34</code></li>
    <li>Device name: <code>MRI HP 8000 3T</code>, or <code>EHR EPIC</code>, or <code>Blood Analyser Siemens Advia2120i</code></li>
</ul>

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

To be able to send data to an Andaman7 user, you first need to add the user to your "circle of trust". This triggers a
request to the user asking them if they agree to receive data from you. If they do, they will receive your data. If they
don't, the data you send them will be ignored.

To add a user to your circle of trust, you first need to get the A7 ID of this user. You can get the user's ID (a uuid) 
by searching the users. The easiest way to find the right user is to query them based on the email address they used to 
register to Andaman7 (which they can find in their version of Andaman7, in "Settings / My administrative data / Identifier").

### Search among existing users

Search can be achieved by sending a GET HTTP request to `{{ users_url }}`.

To filter the users based on certain criteria, additional query parameters can be specified.
For more information on query filter parameters, see [this section]({{ BASE_PATH }}/endpoints/users.html#getUsersPanel).

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

### Add a user to your circle of trust

Once you have found the ID of the user, you can add him or her to your circle of trust, which will trigger an invitation
for her to allow data coming from you.

This can be done using a PUT HTTP request on `{{ trusted_users_url }}` with a JSON body specifying your device ID and the ID of the user you want to invite.

#### Form

<form class="form-inline">
    <div class="form-group">
        <input id="memberIdInput" type="text" placeholder="Invited user ID" class="form-control" />
    </div>
</form>

#### Examples

<ul>
    <li>Invited user ID: <code>2269cb0d-9884-42c5-99f2-002e04d19b6e</code></li>
</ul>

#### HTTP request

<div class="well code">
    POST {{ trusted_users_url }}<br/>
    api-key: <span class="apiKey"></span><br/>
    Authorization: Basic <span class="base64"></span><br/>
    Content-Type: application/json<br/>
    <br/>
    { "senderDeviceId": "<span class="deviceId"></span>", "invitedUserId": "<span class="memberId"></span>" }
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

To get help, learn more or simply discuss our API and integration issues, register to our [developers forum]({{ BASE_PATH }}/forum.html).


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