# Oracle-java Docker Image

The Image is been adopted from [https://github.com/dockerfile/java] and [https://github.com/dockerfile/ubuntu], updated and set in order to be
able to use it compiling an Oracle Java Image as one needs.

As of right now, this build can be used for Oracle-Java from 6 to 9.

Usage is pretty simple as usual, just need to pass one argument `$JAVA_VERIONS` during the build, i.e "8":
```
 $ docker build --tag=oracle-java:8 --no-cache --force-rm -build-arg JAVA_VERSION=8 .
```
