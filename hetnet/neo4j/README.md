# Neo4j Database format

`hetionet-v1.0.db.tar.bz2` is a bzip2-compressed tarball of a Neo4j database. The database was build under Neo4j 2.3.3 Community Edition.

## Neo4j setup instructions

Download and extract Neo4j 2.3 Community Edition [from Neo4j](http://neo4j.com/download/other-releases/ "Neo4j Releases"). Navigate to the `data` directory inside the Neo4j directory and run:

```sh
curl --location --insecure https://github.com/dhimmel/hetionet/raw/master/hetnet/neo4j/hetionet-v1.0.db.tar.bz2 | tar --extract --bzip2
```

If curl throws an error related to SSL or certificates, you can add the `--insecure` argument to allow connections to SSL sites without certs:

```sh
curl --location --insecure https://github.com/dhimmel/hetionet/raw/master/hetnet/neo4j/hetionet-v1.0.db.tar.bz2 | tar --extract --bzip2
```

The above commands should create a `graph.db` directory inside `data`. You should now be able to power up your Neo4j server. Once the server is running you can access the browser at http://localhost:7474/.
