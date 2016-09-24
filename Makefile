NAME=write_120_256_512
DEVICE=/dev/sdd
OPERATION=write
NUMR_CHUNK=120
SIZE_CHUNK=256 # MB
SIZE_IO=512   # KB

all:
	sudo ./reset_write_ptr_all.sh $(DEVICE)
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE) 
	./mktrace.py $(NAME) $(DEVICE) $(OPERATION) $(NUMR_CHUNK) $(SIZE_CHUNK) $(SIZE_IO)
	sudo fio write.fio
#	sudo ./reset_write_ptr_all.sh $(DEVICE)
clean:
	rm -rf *.pyc *.trace
