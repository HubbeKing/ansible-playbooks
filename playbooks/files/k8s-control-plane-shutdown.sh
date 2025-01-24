#! /bin/sh

KUBECONFIG=/etc/kubernetes/admin.conf

# this script is run as root through upsmon, no need for sudo
# scale down mariadb
kubectl -n database scale statefulset mariadb --replicas 0
# wait until mariadb-0 is deleted
kubectl -n database wait --for=delete pod/mariadb-0 --timeout=120s

# shut down
/sbin/shutdown -h +0
