docker build -t tmp .
docker run -it --rm -v $(pwd)/data:/data/ -p 5900:5900 tmp