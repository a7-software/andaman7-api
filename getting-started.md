---
layout: page
title: Getting started
---
{% include JB/setup %}

{% capture me_url %}{{ site.andaman7_endpoint_url }}/users/me{% endcapture %}
{% capture devices_url %}{{ site.andaman7_endpoint_url }}/users/me/devices{% endcapture %}
{% capture users_url %}{{ site.andaman7_endpoint_url }}/users{% endcapture %}
{% capture community_members_url %}{{ site.andaman7_endpoint_url }}/users/me/community-members{% endcapture %}


<div id="toc"></div>


## Step 1 : Request an API key
***

Before starting to use the API, you need an API key as well as an account.

If you don't already have them, please make a request by hitting the button below. Otherwise, let's go to the next step.

<br/><button class="btn btn-primary">Get an API key</button> 


## Step 2 : Your first request
***

Yout first API call will consist in getting your personal information.

To do this, you simply need to perform a `GET` HTTP request, mentioning your *API key* and your *credentials*, to the following URL : `{{ me_url }}`

For more information about the authentication, check out [this part]({{ BASE_PATH }}/guide/introduction.html\#authentication) of the developer's guide.

<br/>
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
<br/>

<div class="well">
    <code>
        curl {{ me_url }} \<br/>
        <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span> \<br/>
        <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>
    </code>
</div>

You should get a response that looks like this :

```json
{
	"meta": { },
	"authenticatedUser": {
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
	},
	"links": [
		{
			"rel": "self",
			"href": "https://prod-server.andaman7.com/public/v1/users/me"
		},
		{
			"rel": "users",
			"href": "https://prod-server.andaman7.com/public/v1/users"
		},
		{
			"rel": "devices",
			"href": "https://prod-server.andaman7.com/public/v1/users/me/devices"
		}
	]
}
```


## Step 3 : Add a device
***

In this step, you will create a device. This is a requirement in order to share data with other users.

Adding a device is pretty simple, you need to perform a POST HTTP request to `{{ devices_url }}`
specifying the UUID of the new device and the device name in the body of the request.

<br/>
<form class="form-inline">
    <div class="form-group">
        <input id="deviceNameInput" type="text" placeholder="Device name" class="form-control" />
    </div>
</form>
<br/>

<div class="well">
    <code>
        curl {{ devices_url }} \<br/>
        <span class="tabulation"></span>-X POST \<br/>
        <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
        <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>' \<br/>
        <span class="tabulation"></span>-H 'Content-Type: application/json' \<br/>
        <span class="tabulation"></span>-d '{ "id": "<span id="deviceId" class="uuid"></span>", "name": "<span class="deviceName"></span>" }'
    </code>
</div>


## Step 4 : Invite a user to your community
***

### Search among existing users

<div class="well">
    <code>
        curl {{ users_url }}?_page=1&_perPage=10 \<br/>
        <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
        <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>'
    </code>
</div>

### Send an invitation

<form class="form-inline">
    <div class="form-group">
        <input id="memberIdInput" type="text" placeholder="Member ID" class="form-control" />
    </div>
</form>
<br/>

<div class="well">
    <code>
        curl {{ community_members_url }} \<br/>
        <span class="tabulation"></span>-X PUT \<br/>
        <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
        <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>' \<br/>
        <span class="tabulation"></span>-H 'Content-Type: application/json' \<br/>
        <span class="tabulation"></span>-d '{ "senderDeviceId": "<span class="deviceId"></span>" "memberId": "<span class="memberId"></span>" }'
    </code>
</div>


## Step 5 : Share some data
***


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            showEffect: 'none'
        });
    
        initBase64Placeholders();
        bind('#apiKeyInput', '.apiKey', '<YOUR_API_KEY>');
        bind('#deviceNameInput', '.deviceName', '<YOUR_DEVICE_NAME>');
        bind('#memberIdInput', '.memberId', '<MEMBER_ID>');
    
        $("#emailInput").bind("keyup", buildBasicAuth);
        $("#passwordInput").bind("keyup", buildBasicAuth);
    
        $('.uuid').each(function() {
            $(this).text(generateUUID());
        });
        
        $('.deviceId').each(function() {
            $(this).text($('#deviceId').text());
        });
    });
    
    function initBase64Placeholders() {
    
        $('.base64').each(function() {
            $(this).text('<BASE64_STRING>');
        });
    }
    
    function buildBasicAuth() {
    
        var email = $("#emailInput").val();
        var password = $("#passwordInput").val()
    
        if(email === '' && password === '') {
            initBase64Placeholders();
            return;
        }
    
        input = email + ':' + CryptoJS.SHA256(password);
        base64 = base64Encode(input);
    
        $(".base64").each(function() {
            $(this).text(base64);
        });
    }
    
</script>