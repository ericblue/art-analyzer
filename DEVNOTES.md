# Development Notes

## Releasing New Versions

Internal notes for version updates, tagging and Docker pushes

This should only include releases for major updates.  
Otherwise the latest development code resides in the main branch.

### Version Updates - Github

Update README.md _Version History_ section and Tag the release

```
git tag -a v0.x -m "Release v0.x"
git push origin v0.x
```

### Version Updates - Docker

Build releases for deployment to Docker Hub (https://hub.docker.com/r/ericblue/artanalyzer/)

#### Tagged Version

```
make build TAG=v0.x
make push TAG=v0.x
```

#### Latest Version

```
make build
make push
```