#!/bin/bash

out_date=$(date +%d.%m.%Y_%H:%M:%S)
mkdir ~/test && echo "catalog test was created successfully" >> ~/report && touch ~/test/$(out_date)
ping -c1 www.net_nikogo.ru || echo "$out_date error: host is unavailable" >> ~/report

