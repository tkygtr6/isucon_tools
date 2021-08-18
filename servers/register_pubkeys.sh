PUBKEY_FILE=~/.ssh/isucon_members.pub

for server in isucon-server1 isucon-server2 isucon-server3 isucon-bench; do
    cat ~/.ssh/id_rsa.pub | ssh isucon@$server "mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys"
done

