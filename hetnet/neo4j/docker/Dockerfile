FROM neo4j:3.0.2
MAINTAINER Daniel Himmelstein, <daniel.himmelstein@gmail.com>

COPY get_data.sh /
COPY get_data_run_neo4j.sh /
COPY neo4j-guide-extension-3.0.1.jar /var/lib/neo4j/plugins
COPY guides /guides
COPY neo4j.conf /var/lib/neo4j/conf/

RUN chmod +x /get_data_run_neo4j.sh

ENV NEO4J_AUTH none
ENV NEO4J_dbms_memory_pagecache_size 512M
ENV NEO4J_dbms_memory_heap_maxSize 1024

WORKDIR /var/lib/neo4j

CMD ["/get_data_run_neo4j.sh"]
