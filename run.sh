docker build -t tmp .
docker run -it --rm -p 8080:8080 --gpus all --name desktop tmp $@
