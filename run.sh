#!/bin/sh


werl  -setcookie dbdn  -name dbdn@192.168.1.78 -pa ./apps/*/ebin/ ./deps/*/ebin/ -config etc/dbdn -s dbdn_ctl start -extra add fdas
