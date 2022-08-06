docker build -t tmp .
docker run -it --rm -v $(PWD)/data:/home/minecraft/.minecraft/ -p 5900:5900 tmp