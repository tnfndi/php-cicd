#!/bin/bash

docker build -t tnfndi-php .

docker rm -f tnfndi-php

docker run -i -t -d --name tnfndi-php -p 9999:80 tnfndi-php
