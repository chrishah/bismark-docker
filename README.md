# bismark-docker
Ubuntu 18.04 with bismark installed

The image contains a full install of [bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/), including all necessary dependencies. I am not part of the bismark team - I just made this image.

In detail, the image is set up with:
 - Ubuntu 18.04
 - samtools v1.9.0
 - bowtie v2.3.5 
 - bismark v0.21.0 

To run [bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/) you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
$ docker run --rm -v $(pwd):/home/in -w /in chrishah/bismark:v0.21.0 bismark
```

You can also enter the container environment and work within it. All executables should be in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/bismark:v0.21.0 /bin/bash
```
