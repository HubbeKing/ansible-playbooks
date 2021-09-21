#!/bin/bash

openssl req -new -nodes -x509 -keyout key.pem -out cert.pem -config openssl_cert.config
