# Notes
main branch create based on dev branch
### run docker build image
```shell
 docker build -t nextjs-docker .
 
```

### docker run container
```shell
 # host port 80 to container port 3000
 docker run --name container-nextjs --rm -p 80:3000 nextjs-docker
```

# Test changes