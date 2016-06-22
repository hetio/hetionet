GUIDE_PATH=$HOME/Documents/serg/rephetio/hetionet/hetnet/neo4j/docker/guides
BIN_PATH=$HOME/Documents/serg/rephetio/het.io-rep-guides/neo4j-guides/run.sh
VOLUME_DIR=$HOME/neo4j/hetionet-data

bash $BIN_PATH $GUIDE_PATH/hetionet.adoc $GUIDE_PATH/hetionet.html
cp $GUIDE_PATH/hetionet.html $VOLUME_DIR/guides/hetionet.html
