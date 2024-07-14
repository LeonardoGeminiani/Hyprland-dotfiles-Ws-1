#!/bin/bash

echo "{\"text\":\""$(checkupdates | wc -l)"\", \"tooltip\":\""$(checkupdates | sed ':a;N;$!ba;s/\n/\\n/g')"\"}"
