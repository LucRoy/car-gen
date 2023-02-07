# car-gen

## Pre-requisite
- [Docker](https://docs.docker.com/get-docker/)

## Building the Image
From the project directory, run the docker build command below.
```shell
docker build -t car-gen .
```
Once completed, you should see a new image created named car-gen.
```shell
docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
car-gen       latest    f4e97b8544df   4 hours ago   1.03GB
```

## Executing go-car commands inside our container
Now that we have our image built, we can run any go-car commands by running the following.
```shell
docker run car-gen car -h
NAME:
   car - Utility for working with car files

USAGE:
   car [global options] command [command options] [arguments...]

COMMANDS:
   compile        compile a car file from a debug patch
   create, c      Create a car file
   debug          debug a car file
   detach-index   Detach an index to a detached file
   extract, x     Extract the contents of a car when the car encodes UnixFS data
   filter, f      Filter the CIDs in a car
   get-block, gb  Get a block out of a car
   get-dag, gd    Get a dag out of a car
   index, i       write out the car with an index
   inspect        verifies a car and prints a basic report about its contents
   list, l, ls    List the CIDs in a car
   root           Get the root CID of a car
   verify, v      Verify a CAR is wellformed
   help, h        Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h  show help (default: false)

```
## Creating CAR File
In this example, will create a car file by mounting a local folder has a volume to our docker image by passing `-v`.
```shell
docker run -v /Users/luc/Downloads/demo:/car-gen car-gen car c -f archive.car Archive.zip
```
`-v`: mount local directory to container `/car-gen`

`-f`: output car filename
```shell
ls -ltr /Users/luc/Downloads/demo
total 15236256
-rw-r--r--  1 luc  staff  3891587751  6 Feb 10:47 Archive.zip
-rw-r--r--@ 1 luc  staff  3893515294  6 Feb 20:16 archive.car
```