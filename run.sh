#!/bin/bash

env | grep YCSB


echo begin $YCSB_OP $YCSB_DB for workload: $YCSB_WORKLOAD

bin/ycsb $YCSB_OP $YCSB_DB -P workloads/$YCSB_WORKLOAD -P $YCSB_PROPERTIES -cp $YCSB_CP $YCSB_ADD_PROPERTIES

echo end $YCSB_OP $YCSB_DB for workload: $YCSB_WORKLOAD >end.log

tail -F end.log