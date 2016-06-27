FROM neo4j:3.0.2
MAINTAINER Daniel Himmelstein, <daniel.himmelstein@gmail.com>

COPY scripts /
RUN chmod +x /get_data_run_neo4j.sh

COPY files/neo4j.conf /var/lib/neo4j/conf/
COPY files/piwik.html /
COPY files/neo4j-guide-extension-3.0.1.jar /var/lib/neo4j/plugins
COPY guides /guides

# Add Piwik Analytics to the Neo4j Browser
RUN apt-get update -qq && \
  apt-get install -qq --yes --no-install-recommends zip && \
  cd /var/lib/neo4j/lib && \
  JAR_PATH=`ls neo4j-browser-*` && \
  HTML_PATH=browser/index.html && \
  unzip $JAR_PATH $HTML_PATH && \
  sed -i -e '/<\/head>/r /piwik.html' -e 'x;$G' $HTML_PATH && \
  zip $JAR_PATH $HTML_PATH && \
  rm -r browser /piwik.html

ENV NEO4J_AUTH none
ENV NEO4J_dbms_memory_pagecache_size 512M
ENV NEO4J_dbms_memory_heap_maxSize 1024

WORKDIR /var/lib/neo4j

CMD ["/get_data_run_neo4j.sh"]
