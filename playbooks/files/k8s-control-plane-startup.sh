#! /bin/sh

KUBECONFIG=/etc/kubernetes/admin.conf

# assume we're after a UPS shutdown, these commands are harmless if we aren't anyway
# scale up mariadb
sudo kubectl -n database scale statefulset mariadb --replicas 3
# scale up openldap
sudo kubectl -n authelia scale statefulset openldap --replicas 3
