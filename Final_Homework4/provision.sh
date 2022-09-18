#!/bin/bash

server="root@192.168.56.103"
client="root@192.168.56.102"
ssh $server <<EOF
yum -y install nfs-utils
mkdir /var/nfsshare
chmod -R 755 /var/nfsshare
chown nfsnobody:nfsnobody /var/nfsshare
mkdir /var/backupNFS
chmod -R 777 /var/backupNFS
#net neobhod
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
#nano /etc/exports
touch /etc/exports
echo "/var/nfsshare    192.168.56.102(rw,sync,no_root_squash,no_all_squash)" >>/etc/exports
echo "/home            192.168.56.102(rw,sync,no_root_squash,no_all_squash)">> /etc/exports
echo "/var/backupNFS    192.168.56.102(rw,sync,no_root_squash,no_all_squash)" >>/etc/exports
systemctl restart nfs-server
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
EOF
ssh $client <<EOF
yum -y install nfs-utils
mkdir -p /mnt/nfs/home
mkdir -p /mnt/nfs/var/nfsshare
mkdir -p /backup
mount -t nfs 192.168.56.103:/var/backupNFS /backup
mount -t nfs 192.168.56.103:/home /mnt/nfs/home/
mount -t nfs 192.168.56.103:/var/nfsshare /mnt/nfs/var/nfsshare/
df -kh
touch /mnt/nfs/var/nfsshare/test_nfs
#nano /etc/fstab
echo "192.168.56.103:/home    /mnt/nfs/home   nfs defaults 0 0" >>/etc/fstab
echo "192.168.56.103:/var/nfsshare    /mnt/nfs/var/nfsshare   nfs defaults 0 0" >>/etc/fstab 
echo "192.168.56.103:/var/backupNFS    /backup/   nfs defaults 0 0" >>/etc/fstab
EOF
