## Containerization

A Flug presentation

### How to get the files

Well the easy way is to get them from GitHub at https://github.com/JoeX2/containerization
Just like you can get our website from https://github.com/JoeX2/flug.dk

### How to get it from Docker

Well.
You can get them like this:

```bash
docker run flugdk/containerization | tar -x
```
### How was the container builder

With this:

```bash
docker build --tag flugdk/containerization .
docker push flugdk/containerization
```
