---
layout: comments
title: A7 Protocol
---
{% include JB/setup %}

<div id="toc"></div>


## What is the A7 protocol ?
***

The A7 protocol is an attempt to simplify the exchange of medical information while being as much compatible with the current standards as possible. 
We don't want to reinvent the wheel, but the wheel must be easy to use !

A7 defines both an exchange protocol and a very simple, basic, data structure. It is model dependent (medical domain), but also as generic as possible. 
We believe that genericity bring simplicity. A7 is inspired by the works of *FHIR*, *HL7*, *GEHR*, *OpenEHR*...
and our own 25 years of experience in the medical sector (we developed prevention focused EHR and secure medical messaging systems).


## Why another protocol ?
***

Well, because we need it, HL7 has many qualities but for some lightweight use cases, it's much too complex to use. 
FHIR is an excellent step in the right direction. As James Agnew says "Apps are becoming a new reality - No suitable standards exist".
But the full FHIR, while excellent, is still very wide in scope. We need a very simple and basic protocol for medical apps.


## Why this name ?
***

The name comes from 2 sources, actually.  Initially, it was a shorthand for our Andaman7 project
(mobile applications for EHR and PHR plus the platform to connect them).
But James Agnew's mention of the new reality of "Apps" could bring a new, wider meaning: A7 is the protocol for lightweight Apps exchanging medical information.

A7 is to Apps what HL7 is to HIS (Hospital Information Systems).

## Can I use it ?  License ?
***

We have no "world dominance" hopes for our A7 protocol. We just needed a protocol for our own use so we created it.
However if you like it and if it could be useful to you, feel free to use it.
It's licensed under the Creative Commons - Attribution 4.0 International (CC BY 4.0).

## What are the basic concepts of the data model ?
***

We define concepts at 2 levels :

* domain concepts (aka business concepts)
* interface concepts (aka API concepts)

### Domain concepts

Our objective being to be very simple and efficient, we currently only have 3 main concepts (not counting secondary concepts):

* AMI - Atomic Medical Item
* Qualifier
* AMISet

#### AMI

An AMI - Atomic Medical Item is the most basic piece of information. 
It's "atomic" meaning it can't be broken down to a simpler concept.

Examples are the weight of a person, an allergy or a blood red cell count.  But we are a bit extreme too and like genericity. 
So the last name is also an AMI, as well as the phone number, any image that is part of the medical file, an URL to medical information online.

An AMI is basically a key-value pair augmented with :

* the source of the information - the person and the device that is creating the piece of info (a doctor, a patient, a lab machine, a hospital...)
* a timestamp of when the information was created

AMIs are universally unique (we give them a [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) by the way).
Given the fact that they are a combination of key, value, source and timestamp, it's very natural that they are unique.
AMIs can never be modified.  There is no need to modify an AMI. 
If you want to enter a new value for weight, you just create an new AMI (a new combination of key, value, source and timestamp). 
The only "modification" to an AMI is the capability to "invalidate" it. 
This is necessary if, after some time, one realises that the previously created AMI was a mistake somehow
(if the medical condition is not valid anymore, we have other mechanisms for that, based on start date and end date qualifiers).  

These constraints make AMIs very easy to manage in a distributed world.  They can be created anywhere, by anyone, with no risk of "data conflict" whatsoever.
AMIs have a reference to their "parent", e.g. a given EHR.

#### Qualifier

Life is not so simple, unfortunately. Very often, a piece of information needs to be "qualified" by secondary elements of information.

Examples are :

* the unit of measurement of the weight must be specified - we use a qualifier "unit" for that
* a medical condition is valid at a given time - we use a qualifier to specify the date (or period with two qualifiers "Start date" and "End date"); note that this is independent from the creation date of the AMI
* a family antecedent of diabetes (= an AMI) is further qualified by a "relationship" qualifier : the "mother" was diabetic

For the sake of simplicity and genericity, qualifiers are also a combination of key, value, source and timestamp.
Qualifiers have a reference to their "parent", e.g. an AMI.

#### AMISet

AMIs usually need to be grouped together. For this we use the notion of AMISet, which is a set, or group of AMIs.

Examples are:

* an EHR is an AMISet - because it groups all AMIs of a given patient
* a consultation / visit is an AMISet - because it groups AMIs (weight, temperature, complaints...) created during the same event
* a "lab result", done on a given date, by a specific lab for a specific blood sample and containing several results is also an AMISet (the individual results are AMIs)

Like Qualifiers, AMISets are also a combination of key, value, source and timestamp.


### Interface concepts

Interface concepts are important because they are at the basis of the APIs between systems.  API methods directly manipulate interface concepts.

We tried to be even more generic here, so we were a bit more extreme : all three domain concepts above
(AMI, Qualifier, AMISet) are defined in a common data structure at interface level.

We created an **A7 Item**, which is a "sourced, identified, dated key value pair". It contains:

* a key
* a value
* a source
* a date (timestamp)
* a unique identifier
* a parent

An example:

* key = `weight`
* value = `70`
* source = `de305d54-75b4-431b-adb2-eb6b9e546014` (the UUID of the person or machine at the source of the information)
* date = `2015-04-14T18:54:07Z`
* identifier = `123e4567-e89b-12d3-a456-426655440000` (often a UUID)
* parent = `43722d40-e381-11e4-9612-0002a5d5c51b` (the UUID of the parent A7 Item)

### Implementation concepts

Implementation concepts are left to you.
You can implement the domain/interface concepts as you want, taking into account other objectives like performance, storage efficiency, etc.


## What are some examples of calls to the API ?

First, we will send an AMI in order to update the weight of a user.
It can be done by sending a `POST` request to  `{{ site.andaman7_endpoint_url }}/users/{userId}/a7-items`.
The `{userId}` path parameter must be replaced by the identifier of the Andaman7 user to whom you want to send the A7 items.

Here is the structure of the A7 item of the AMI :

~~~json
{  
    "id": "8ef93cb2-d4f0-4067-8957-c0b2d72d62de",
    "creationDate": "2015-06-24T14:06:48.206+0000",
    "creatorDeviceId": "e8015cdc-a05f-487c-9ae3-6f89093cc7a3",
    "invalidationDate": null,
    "invalidatorDeviceId": null,
    "creatorUserId": "908e8b39-5aae-44df-95e2-79a8bfe9e376",
    "type": "AMI",
    "key": "ami.weight",
    "value": "75",
    "version": 8,
    "uuidMulti": null,
    "parentId": "fd13fa08-43d2-494b-8890-ad8907cc2fe4"
}
~~~

The body of the HTTP request contains the following JSON object.
The `a7Items` field contains the list of all A7 items to be sent, like the previous one.
This list must be encoded into a string because this field is encrypted in the secure version.

~~~json
{  
    "sourceDeviceId": "d5736213-9e26-4c9d-a1ea-8b0873aa1282",
    "a7Items": "<A7_ITEMS_LIST>"
}
~~~

The receiver can now retrieve those A7 items by sending a `GET` request to `{{ site.andaman7_endpoint_url }}/users/{userId}/a7-items?_deviceId={deviceId}`.
The `{deviceId}` query parameter must be replaced by the identifier of the device which fetches the A7 items.


Check [this page]({{ BASE_PATH }}/endpoints/a7-items.html) for more information about the API calls related to A7 items.

Continue by reading the [Getting Started]({{ BASE_PATH }}/getting-started.html) section.


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul'
        });
    });
    
</script>