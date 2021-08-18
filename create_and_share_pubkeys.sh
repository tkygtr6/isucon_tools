PUBKEY_FILE=~/.ssh/isucon_servers.pub

echo "" > $PUBKEY_FILE
for server in isucon-server1 isucon-server2 isucon-server3 isucon-bench; do
    ssh isucon@$server "ssh-keygen -t rsa -b 4096"
    ssh isucon@$server "cat ~/.ssh/id_rsa.pub" >> $PUBKEY_FILE
done

for server in isucon-server1 isucon-server2 isucon-server3 isucon-bench; do
    cat $PUBKEY_FILE | ssh isucon@$server "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"
done
