FROM neo4j:3.2.8-enterprise
MAINTAINER Daniel Himmelstein, <daniel.himmelstein@gmail.com>

COPY scripts /
RUN chmod +x /get_data_run_neo4j.sh

COPY files/neo4j.conf /var/lib/neo4j/conf/
COPY files/piwik.html /
COPY files/neo4j-guide-extension-3.2.3.jar /var/lib/neo4j/plugins
COPY guides /guides

# Update or install packages
RUN apk add --no-cache --quiet \
  bzip2 \
  curl \
  tar \
  zip

# Install Neo4j APOC plugin
# RUN wget --quiet --directory-prefix=/var/lib/neo4j/plugins \
#  https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.0.4.1/apoc-3.0.4.1-all.jar

# Update the Neo4j Browser source to improve search results and add Piwik Analytics
RUN cd /var/lib/neo4j/lib && \
  JAR_PATH=`ls neo4j-browser-*` && \
  HTML_PATH=browser/index.html && \
  unzip $JAR_PATH $HTML_PATH && \
  OLD='<title>Neo4j Browser</title>' && \
  NEW='<title>Hetionet · Neo4j Browser</title>' && \
  sed --in-place "s|$OLD|$NEW|" $HTML_PATH && \
  OLD='<meta name="description" content="Neo4j Browser">' && \
  NEW='<meta name="description" content="Hetionet Browser. Use Neo4j to query and explore a network of biomedical knowledge.">' && \
  sed --in-place "s|$OLD|$NEW|" $HTML_PATH && \
  sed --in-place --expression='/<\/head>/r /piwik.html' --expression='x;$G' $HTML_PATH && \
  zip $JAR_PATH $HTML_PATH && \
  rm -r browser /piwik.html

ENV NEO4J_AUTH none

WORKDIR /var/lib/neo4j

CMD ["/get_data_run_neo4j.sh"]
