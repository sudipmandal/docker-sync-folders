[![Build status](https://sudiptfs.visualstudio.com/Projects/_apis/build/status/Github-Docker-Folder-Sync-MultiArch-Build)](https://sudiptfs.visualstudio.com/Projects/_build/latest?definitionId=19)

# Docker Sync Folder
Simple [Rsync](https://linux.die.net/man/1/rsync) based container to keep two directories in sync. 

## Use Case
This container is intended to be used to keep 2 docker volumes (local path, named, cifs etc) in sync. <br />
The rsync job can be customized using env variable, refer below.

## Docker Image
Multi Arch Docker Image can be found on 
https://hub.docker.com/r/sudipthegreat/docker-sync-folders

## Quick Start: 

```yml
version: '3.3'
services:
    docker-sync-folders:
        image: 'sudipthegreat/docker-sync-folders:latest'
        restart: always
        environment:
            - 'RSYNC_OPTIONS:-rvWPh --size-only'
            - 'SYNC_FREQUENCY:300'
        volumes:
            - 'my-named-vol:/source'
            - '/path/to/dest/on/host:/destination'
        
```

## Volumes
| Name      | Description |
| ----------- | ----------- |
| /source      | Source Directory in the container. Override with your source directory from host       |
| /destination   | Target Directory in the container. Override with your target directory from host        |

## Environment Variables

| Env Variable      | Description |
| ----------- | ----------- |
| RSYNC_OPTIONS      | Rsync Options to customize sync behavior. Full list can be found [here](https://ss64.com/bash/rsync_options.html)       |
| SYNC_FREQUENCY   | The interval in seconds post which the rsync job will be run again        |
