# Development Notes

## Releasing New Versions

Internal notes for version updates, tagging and Docker pushes

This should only include releases for major updates.  
Otherwise the latest development code resides in the main branch.

### Version Updates - Github

Update README.md _Version History_ section and Tag the release

```
make release VERSION=-0.x
```

Note: Attempts to recreate a new tagged release will fail.  

You will need to delete the tag first. Proceed with caution.

```
[git output]
hint: Updates were rejected because the tag already exists in the remote.

git push --delete origin v0.x
```

### Version Updates - Docker

Build releases for deployment to Docker Hub (https://hub.docker.com/r/ericblue/artanalyzer/)

#### Tagged Version

```
make buildDocker TAG=v0.x
make pushDocker TAG=v0.x
```

#### Latest Version

```
make buildDocker
make pushDocker
```