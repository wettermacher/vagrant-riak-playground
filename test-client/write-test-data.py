#!/usr/bin/env python3

from riak import RiakClient, RiakObject, RiakBucket

riak_client = RiakClient(nodes=[{'host':'192.168.50.11','http_port':8098},
                                {'host':'192.168.50.12','http_port':8098},
                                {'host':'192.168.50.13','http_port':8098}])

bucket = riak_client.bucket('testbucket')

for object_id in range(100000):
    riak_object = RiakObject(riak_client, bucket, str(object_id))
    riak_object.data = {'id': object_id, 'desc': 'Description for ' + str(object_id)}
    riak_object.store()

