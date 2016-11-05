# Minecraft Dockerfile

## ENVIRONMENT

* OS:CentOS 7


## USEAGE

```
docker run -d --name worldcontainer -v /worldcontainer -t busybox
docker build -t osamu-vill-img .
docker run --name osamu-vill-cont -p 25565:25565 -p 8123:8123 osamu-vill-img
```

