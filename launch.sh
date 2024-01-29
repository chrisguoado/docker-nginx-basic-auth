#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
if test -n "$SERVE_ONLY"; then
	envsubst < auth.serve.conf > /etc/nginx/conf.d/auth.conf
else
	envsubst < auth.proxy.conf > /etc/nginx/conf.d/auth.conf
fi
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
