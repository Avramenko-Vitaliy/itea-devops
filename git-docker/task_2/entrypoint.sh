#!/bin/bash
echo $LINE >> usr/share/nginx/html/index.html
nginx -g "daemon off;"
