#!/bin/bash

cat patient_data.txt | grep -i bangkok | sort -k2 -k3 > bangkokpatient.txt

cat bangkokpatient.txt


