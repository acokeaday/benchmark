# Virtual Machine benchmark


Unattended benchmarking making use of 3 benchmarking tools consisting of the following: 

Geekbench5 - https://www.geekbench.com/
fio - https://fio.readthedocs.io/
ioping - https://github.com/koct9i/ioping

These benchmarking tools are not written by me. This is taken from https://upcloud.com/community/tutorials/how-to-benchmark-cloud-servers/

I got tired of running everything each time when doing benchmarking.

This script simply allows the 3 tools to run with a single command storing the results in a single file. 

Feel free to reach out if there are any suggestions.

How to use:

	sudo apt install git
	git clone https://github.com/acokeaday/server-benchmark
	cd server-benchmark
	chmod +x benchmark.sh
	./benchmark