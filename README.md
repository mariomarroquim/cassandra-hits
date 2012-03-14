README
======

A project that shows read and write performance over a Cassandra cluster.

Usage
-----

* Configure and start the cluster.
* Create a Keyspace called `CassandraHits` and a Column Family called `Hits`.
* Configure the IP addresses for the nodes in `config/initializers/constantes.rb`.
* Run ab -n 1000 -c 2 `http://localhost:3000/cluster/hit` against the app instance.
* See what happens on `http://localhost:3000/cluster`. Graphs, numbers, etc.
* More info at my paper that is going to be finished next month :)

Support
-------

You can contact me at mariomarroquim@gmail.com.

