#!/bin/bash

sudo docker build -t weazel .
sudo docker run -d -p 80:80 weazel
