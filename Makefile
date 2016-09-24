NAME=write
DEVICE=/dev/sdd
OPERATION=write
NUMR_CHUNK=20
SIZE_CHUNK=128 # MB
SIZE_IO=512   # KB

all:
	sudo ./reset_write_ptr_all.sh $(DEVICE)
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE) 
	./mktrace.py $(NAME) $(DEVICE) $(OPERATION) $(NUMR_CHUNK) $(SIZE_CHUNK) $(SIZE_IO)
	sudo fio write.fio
	gnuplot fig.gp
#	sudo ./reset_write_ptr_all.sh $(DEVICE)
clean:
	rm -rf *.pyc *.trace *.log
