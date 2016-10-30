# Neo4j Database format

`hetionet-v1.0.db.tar.bz2` is a bzip2-compressed tarball of a Neo4j database. The database has been migrated to the Neo4j 3.0.1 Community Edition.

## Nomenclature

The Neo4j graph uses slightly different names for metanodes (Neo4j labels) and metaedges (Neo4j relationship types). See [`labels.tsv`](labels.tsv) for the node type mapping and [`types.tsv`](types.tsv) for the edge type mapping. We conform to the Neo4j style of CamelCase labels and ALL_CAPS relationship types. In addition, Neo4j relationship types are appended with metaedge standard abbreviations. This adds source/target metanode awareness to relationship types and [enables](https://thinklab.com/discussion/using-the-neo4j-graph-database-for-hetnets/112#6 "Query Optimization · Using the neo4j graph database for hetnets · Thinklab Discussion in Project Rephetio") optimized queries.

## Neo4j setup instructions

Download and extract Neo4j 3.0 Community Edition [from Neo4j](http://neo4j.com/download/other-releases/ "Neo4j Releases"). Make sure the Neo4j server is stopped. Navigate to the `data/databases` directory inside the Neo4j directory and run:

```sh
# Backup graph.db directory if it exists
if [ -d "graph.db" ]; then
  mv graph.db graph.db.backup_`date +%F`
fi

# Download and extract graph.db for Hetionet v1.0
curl --location https://github.com/dhimmel/hetionet/raw/neo4j-3.0/hetnet/neo4j/hetionet-v1.0.db.tar.bz2 | tar --extract --bzip2
```

If curl throws an error related to SSL or certificates, you can add the `--insecure` argument to `curl` to allow connections to SSL sites without certs.

The above commands should create a `graph.db` directory inside `data`. You should now be able to power up your Neo4j server. Once the server is running you can access the browser at http://localhost:7474/. Delete the `graph.db` directory to uninstall Hetionet as the default Neo4j database.
