DEVICE=/dev/sdd
OPERATION=write
NUMR_CHUNK=60
SIZE_CHUNK=512# MB
SIZE_IO=512# KB
NAME=$(OPERATION)_$(NUMR_CHUNK)_$(SIZE_CHUNK)_$(SIZE_IO)

all:
	sudo zbc_reset_write_ptr $(DEVICE) -1
	sudo hdparm -a0 -A0 -W0 -Q1 $(DEVICE) 
	./mktrace.py $(NAME) $(DEVICE) $(OPERATION) $(NUMR_CHUNK) $(SIZE_CHUNK) $(SIZE_IO)
	sudo fio write.fio --read_iolog=$(NAME).trace --write_bw_log=$(NAME) --write_lat_log=$(NAME) --write_iops_log=$(NAME);
	
move:
	rm -f $(NAME)_slat.1.log $(NAME)_clat.1.log
	mkdir $(NAME)
	mv *.log *.trace $(NAME)/

plot:	
	gnuplot fig.gp
	
reset:
	sudo zbc_reset_write_ptr $(DEVICE) -1

clean:
	rm -rf *.pyc *.trace *.log *.eps
