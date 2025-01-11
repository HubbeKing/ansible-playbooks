#! /bin/sh

KUBECONFIG=/etc/kubernetes/admin.conf

# assume we're after a UPS shutdown
# wait for kube-apiservers to be ready
# TODO: how to just wait for healthy apiserver instead?
# kubectl get --raw='/readyz' ??
sudo kubectl -n kube-system wait --for=condition=Ready --all --timeout=120s pod/kube-apiserver-pacifica pod/kube-apiserver-pegasus pod/kube-apiserver-valkyrie

# scale up mariadb
sudo kubectl -n database scale statefulset mariadb --replicas 3
# scale up openldap
sudo kubectl -n authelia scale statefulset openldap --replicas 3
