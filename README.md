# docker-nmap

This is a very basic Docker image that just contains a recurring build of the latest version of nmap directly from its GitHub repository at [https://github.com/nmap/nmap.git](https://github.com/nmap/nmap.git).

## Running the container

For some nmap scanning, it is best to have all network traffic come from the host level instead of being filtered through the Docker network stack.  Therefore, it is probably best to run this container using the `host` network.

```sh
docker run -it --rm --network host broadinstitute/nmap -sT hostname
```

For example, if scanning a DHCP server, doing this from inside the Docker network stack can lead to unexpected results, so you can do the following:

```sh
docker run -it --rm --network host broadinstitute/nmap -sU -p67 --script dhcp-discover 10.0.0.99
```
