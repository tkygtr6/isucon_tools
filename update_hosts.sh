cat /etc/hosts | grep -v \# | grep isucon > /tmp/hosts_isucon

for server in isucon-server1 isucon-server2 isucon-server3 isucon-bench; do
	scp /tmp/hosts_isucon $server:/home/isucon/
	ssh $server "sudo cat /etc/hosts | grep -v isucon | sudo tee /etc/hosts.bak"
	ssh $server "sudo cat /etc/hosts.bak /home/isucon/hosts_isucon | sudo tee -a /etc/hosts"
done

