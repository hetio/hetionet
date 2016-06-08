FROM neo4j/neo4j:3.0.1
MAINTAINER Daniel Himmelstein, <daniel.himmelstein@gmail.com>

COPY extract_db.sh /
COPY extract_db_run_neo4j.sh /
COPY neo4j-guide-extension-3.0.1.jar /var/lib/neo4j/conf/plugins
# COPY guides /var/lib/neo4j/resources/webapp/guides
COPY guides /guides

RUN chmod +x /extract_db.sh
RUN chmod +x /extract_db_run_neo4j.sh
# RUN ln -s /var/lib/neo4j/data /var/lib/neo4j/databases

RUN cd / && \
  wget --no-verbose https://github.com/dhimmel/hetionet/raw/neo4j-3.0/hetnet/neo4j/hetionet-v1.0.db.tar.bz2

COPY neo4j.conf /var/lib/neo4j/conf/

ENV NEO4J_AUTH none
ENV NEO4J_dbms_memory_pagecache_size 512M
ENV NEO4J_dbms_memory_heap_maxSize 1024

WORKDIR /var/lib/neo4j

CMD ["/extract_db_run_neo4j.sh"]
