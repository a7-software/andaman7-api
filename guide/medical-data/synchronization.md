---
layout: comments
title: Medical data synchronization
---
{% include JB/setup %}

<div id="toc"></div>


## Envelope

~~~json
{
    "sourceDeviceId": "e38a010f-b78b-4941-9b37-ef3e535e8954",
    "sourceRegistrarId": "1657430e-5c53-4660-89f4-993af0c67880",
    "medicalRecords": "<ENCRYPTED CONTENT>",
    "fileMap": {
        "ccca3f31-aa89-4d3e-9361-e533131c8d98": "<BASE64_ENCODED_FILE_CONTENT>",
        ...
    }
}
~~~

## A7 Item

TODO


### AMI

TODO

### Qualifier

TODO


### AMISet

TODO


### AMIRef

TODO


### Namespace

TODO


<script type="text/javascript">

    $(document).ready(function() {
    
        $('#toc').toc({
            title: '<h2>Contents</h2><hr/>',
            listType: 'ul'
        });
    });
    
</script>