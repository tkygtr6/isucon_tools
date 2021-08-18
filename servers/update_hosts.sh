cat /etc/hosts | grep -v \# | grep isucon > /tmp/hosts_isucon

for server in isucon-server1 isucon-server2 isucon-server3 isucon-bench; do
	scp /tmp/hosts_isucon $server:/tmp/
	ssh $server "sudo cat /etc/hosts | grep -v isucon | sudo tee /tmp/hosts.bak"
	ssh $server "sudo cat /tmp/hosts.bak /tmp/hosts_isucon | sudo tee /etc/hosts"
done

