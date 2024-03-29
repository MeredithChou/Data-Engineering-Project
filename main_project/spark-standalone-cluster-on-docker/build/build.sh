# -- Software Stack Version

SPARK_VERSION="3.2.2"
HADOOP_VERSION="3"

# -- Building the Images

docker build \
  -f docker/base/Dockerfile \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f docker/spark-base/Dockerfile \
  -t spark-base .

docker build \
  -f docker/spark-master/Dockerfile \
  -t spark-master .

docker build \
  -f docker/spark-worker/Dockerfile \
  -t spark-worker .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  -f docker/jupyter-notebook/Dockerfile \
  -t jupyter-notebook .
