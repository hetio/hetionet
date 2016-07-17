FROM neo4j:3.0.3
MAINTAINER Daniel Himmelstein, <daniel.himmelstein@gmail.com>

COPY scripts /
RUN chmod +x /get_data_run_neo4j.sh

COPY files/neo4j.conf /var/lib/neo4j/conf/
COPY files/piwik.html /
COPY files/neo4j-guide-extension-3.0.1.jar /var/lib/neo4j/plugins
COPY guides /guides

# Update the Neo4j Browser source to improve search results and add Piwik Analytics
RUN apt-get update -qq && \
  apt-get install -qq --yes --no-install-recommends zip && \
  cd /var/lib/neo4j/lib && \
  JAR_PATH=`ls neo4j-browser-*` && \
  HTML_PATH=browser/index.html && \
  unzip $JAR_PATH $HTML_PATH && \
  OLD='<title ng-bind-template="Neo4j {{kernel\.store_dir}}">Neo4j</title>' && \
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
