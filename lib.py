header = """fio version 2 iolog
%s add
%s open
"""
trailer = """
%s close"""

def gen_trace(name, device, operation, size_chunk, size_io, chunks, offsets):
    f = open('%s.trace' % (name,), 'w')
    f.write(
        header % (device, device) + \
	'\n'.join(["%s %s %d %d" % (device, operation, m * size_chunk*1024*1024 + n, size_io*1024) for m in chunks for n in offsets]) + \
 	trailer % (device,))
    f.close()


