#!/bin/sh

rm -rf /var/lib/cassandra

mkdir -p -m 777 /var/lib/cassandra/data /var/lib/cassandra/commitlog /var/lib/cassandra/saved_caches

chown -R mariomarroquim:mariomarroquim /var/lib/cassandra
