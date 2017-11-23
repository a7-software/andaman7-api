---
layout: comments
title: Basics
---
{% include JB/setup %}

<div id="toc"></div>

## Users

Andaman7 users, also called "registrars", are patients or care providers that can manage one or more EHRs among their devices.

Each user is bound to an email address and is uniquely identified by a UUID.


## Devices

In Andaman7, devices belong to a user and are synchronization points from which data is sent and received. You need at least one device to be able to send and receive medical data.

More concretely, devices are smartphones / tablets on which the app is installed or other connected devices compatible with the app.

Now, talking about apps willing to integrate to Andaman7's synchronization system. Most of the time, they would need only one device per user and installation of those apps.

For example, if a doctor uses the AwesomeMedSoft software, it may have it on his or her laptop and desktop. In that case, two Andaman7 devices would have to be created.


## Community and Circle of Trust

All users with a visible profile are part of the Andaman7 community.
They can be browsed and added the Circle of Trust of other users.

A user can only share data with his/her circle of trust members.


## Translations

The Andaman7 app is fully translated (except uncodified data).

For example, the label of the subject matter of a document (qualifier.subjectMatter) is translated, as well as its [possible values]({{ BASE_PATH }}/guide/medical-data/types.html#sl_subjectMatter_v)


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul',
            headers: 'h1, h2, h3'
        });
    });
    
</script>