---
layout: comments
title: Getting started
---
{% include JB/setup %}

{% capture me_url %}{{ site.andaman7_endpoint_url }}/users/me{% endcapture %}
{% capture devices_url %}{{ site.andaman7_endpoint_url }}/users/me/devices{% endcapture %}
{% capture users_url %}{{ site.andaman7_endpoint_url }}/users{% endcapture %}

<div id="toc"></div>

## Step 0 : Read the A7 protocol page
***

To be aware of the philosophy of Andaman7 and its protocol, you should first read the [A7 protocol]({{ BASE_PATH }}/a7-protocol.html) page.

<br/>

## Step 1 : Create an account and request an API key
***

Before starting to use the API, you need an account as well as an API key.

If you don't already have them, please make a request by hitting the button below. Otherwise, let's go to the next step.

<br/><button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Register / Get an API key</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" method="POST">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Registration form</h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        The form is not available yet. In the meantime, you can contact us by <a href="mailto:api@andaman7.com">email</a> to get your API key.
                    </div>
                    <div class="form-group">
                        <label for="inputFirstName" class="col-sm-3 control-label">First name</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="inputFirstName" name="firstName" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputLastName" class="col-sm-3 control-label">Last name</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="inputLastName" name="lastName" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-7">
                            <input type="email" class="form-control" id="inputEmail" name="email" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-7 col-sm-offset-3">
                            <div class="g-recaptcha" data-sitekey="6LdTDwwTAAAAAMpzvxskypjvWv0juCX9cgbdLJJn"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary disabled">Register</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

In order to share data with other users, you need to create at least one device.
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


## Step 4 : Send medical data
***

Now that you have a device on your account, you can use this device to send medical data to another user (e.g. your general practitioner).
To do so, you need to search among users of Andaman7 to get the identifier of the recipient.

### Search among users

Search can be achieved by sending a GET HTTP request to `{{ users_url }}`.

To filter the users based on certain criteria, additional query parameters can be specified.
For more information on query filter parameters, see [this section]({{ BASE_PATH }}/endpoints/users.html#getUsersPanel).

#### HTTP request

<div class="well code">
    GET {{ users_url }}?_page=1&_perPage=10&_envelope=true&administrative.firstName=John&administrative.lastName=Doe<br/>
    api-key: <span class="apiKey"></span><br/>
    Authorization: Basic <span class="base64"></span>
</div>

#### Curl command

<div class="well code">
    curl {{ users_url }}?_page=1&_perPage=10&_envelope=true&administrative.firstName=John&administrative.lastName=Doe \<br/>
    <span class="tabulation"></span>-H 'api-key: <span class="apiKey"></span>' \<br/>
    <span class="tabulation"></span>-H 'Authorization: Basic <span class="base64"></span>'
</div>

#### Example of HTTP response body

~~~json
{
    "meta": {
        "page": 1,
        "perPage": 10,
        "totalPages": 1,
        "count": 1,
        "totalItems": 1,
        "hasMore": false
    },
    "users": [
        {
            "id": "77752fb0-669f-11e5-a837-0800200c9a66",
            "self": "{{ users_url }}/77752fb0-669f-11e5-a837-0800200c9a66",
            "creationDate": "2015-09-29T13:38:39.867+0000",
            "creatorDeviceId": "00000000-0000-0000-0000-000000000001",
            "type": "DOCTOR",
            "administrative": {
                "firstName": "John",
                "lastName": "Doe",
                "address": {
                    "street": "Hickory Street",
                    "number": "7674",
                    "zip": "06111",
                    "town": "Newington",
                    "country": "USA, CT"
                }
            }
        }
    ]
}
~~~

### Send data

Once you have found the ID of the recipient, you can send the medical data you want to share.
Let's say that we want to send our height to John Doe, our general pratitioner, who has the id `77752fb0-669f-11e5-a837-0800200c9a66`.

We need to perform a POST HTTP request on `{{ users_url }}/77752fb0-669f-11e5-a837-0800200c9a66/a7-items` with the following JSON body :

<div class="highlight">
<pre>
<code class="language-json">
<span class="p">{</span>  
    <span class="nt">"sourceDeviceId"</span><span class="p">:</span> <span class="s2">"d5736213-9e26-4c9d-a1ea-8b0873aa1282"</span><span class="p">,</span>
    <span class="nt">"a7Items"</span><span class="p">:</span> <span class="s2"><strong>"</strong>[
        {  
            "id": "ad625c90-66b0-11e5-a837-0800200c9a66",
            "creationDate": "2015-09-29T14:06:48.206+0000",
            "creatorDeviceId": "<span class="deviceId"></span>",
            "creatorRegistrarId": "08ac1180-fd21-11e4-b939-0800200c9a66",
            "type": "AmiSet",
            "key": "<strong>amiSet.ehr</strong>",
            "value": null,
            "version": 8,
            "uuidMulti": null,
            "parentId": null
        },
        {  
            "id": "8ef93cb2-d4f0-4067-8957-c0b2d72d62de",
            "creationDate": "2015-09-29T14:06:48.206+0000",
            "creatorDeviceId": "<span class="deviceId"></span>",
            "creatorRegistrarId": "08ac1180-fd21-11e4-b939-0800200c9a66",
            "type": "AMI",
            "key": "<strong>ami.weight</strong>",
            "value": "75",
            "version": 8,
            "uuidMulti": null,
            "parentId": "ad625c90-66b0-11e5-a837-0800200c9a66""
        },
        {  
            "id": "ecdb3500-66b9-11e5-a837-0800200c9a66",
            "creationDate": "2015-09-29T14:06:48.206+0000",
            "creatorDeviceId": "<span class="deviceId"></span>",
            "creatorRegistrarId": "08ac1180-fd21-11e4-b939-0800200c9a66",
            "type": "AMI",
            "key": "<strong>ami.namespaceEntry</strong>",
            "value": "be.ac.ulg.chu:ad625c90-66b0-11e5-a837-0800200c9a66",
            "version": 8,
            "uuidMulti": null,
            "parentId": "ad625c90-66b0-11e5-a837-0800200c9a66"
        },
    ]<strong>"</strong></span>
<span class="p">}</span>
</code>
</pre>
</div>

You can see that we need to specify the identifier of the sender device and the data itself.
Data is represented as a list of A7 items. They are generic JSON object that can be any object managed in Andaman7.
Note that this JSON list is actually a string. That is because, in the secured version of the API, this string is encrypted.

In the previous example, we can distinguish 2 kinds of A7 item : an AmiSet and two AMIs.
The AmiSet is a container of AMIs, in this case, it represents the EHR in which the data will be added.
The two AMIs are respectively for the weight and for a namespace entry. You may have noticed that both AMIs have the same parent ID which is the ID of the EHR.

The namespace is a way to identify an EHR in a certain context. In that way, Andaman7 can bind multiple identifiers to the same EHR.
A namespace entry is composed of two parts separated by a colon : `<context>:<identifier in that context>`. Typically, the context is your domain name.

Here is the structure common to all A7 items :

* `id`: the identifier of the A7 item. It should be a UUID generated by the sender ;
* `creationDate`: the creation date of the A7 item in ISO 8601 format ;
* `creatorDeviceId`: the identifier of the device from which the data is sent ;
* `creatorRegistrarId`: the identifier of the user who is sending the data ;
* `type`: the type of A7 item. It can be one of the following values : `AMI`, `Qualifier`, `AmiSet` or `AmiRef` ;
* `key`: the key of the A7 item ;
* `value`: the value of the A7 item ;
* `version`: the version of A7 item ;
* `parentId`: the ID of a parent A7 item. Ex: the A7 item of the EHR is the parent of the A7 item of the AMI describing the weight ;

See [this page]({{ BASE_PATH }}/guide/medical-data/types.html) for the complete list of medical data with their keys, types and versions.


<br/>

## What's next ?

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