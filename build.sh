#! /usr/bin/env bash

rm lambda.py.zip
zip lambda.py.zip lambda.py
terraform apply