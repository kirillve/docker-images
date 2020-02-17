#!/bin/sh

if [ -n "${WORKER_PROCESSES}" ] ; then
  sed -i "s/worker_processes  1;/worker_processes  ${WORKER_PROCESSES};/g" /etc/nginx/nginx.conf ;
fi
if [ -n "${WORKER_CONNECTIONS}" ] ; then
  sed -i "s/worker_connections  1024;/worker_connections  ${WORKER_CONNECTIONS};/g" /etc/nginx/nginx.conf ;
fi
if [ ! -z "CUSTOM_CONFIG" ] ; then
  echo ${CUSTOM_CONFIG} | base64 -d > /etc/nginx/conf.d/custom.conf
fi

exec "$@"
