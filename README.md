## Binary 

Shell script to check for binaries within a Git repository.

## Docker

Docker image can be found at [dockerhub](https://hub.docker.com/r/jaxwood/binary/)

``` docker
docker run -a STDERR -v /<repostiory-path>:/app/repo jaxwood/binary /app/run.sh
```
### LICENCE

[MIT](LICENSE)

### Build status
![build](https://lorenzen.visualstudio.com/_apis/public/build/definitions/99662c2f-7420-4bfc-8ba3-8d616fe79d72/88/badge)