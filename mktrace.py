#!/usr/bin/python

import argparse
import random
import sys

sys.path.append('..')

from lib import gen_trace

parser = argparse.ArgumentParser()
parser.add_argument("name")
parser.add_argument("device")
parser.add_argument("operation")
parser.add_argument("numr_chunk",type=int)
parser.add_argument("size_chunk",type=int)
parser.add_argument("size_io",type=int)
args = parser.parse_args()

chunks = range(5000)
random.shuffle(chunks)
chunks = chunks[:args.numr_chunk]

offset = 64*256*1024*1024
offsets = range(offset, offset + args.size_chunk*1024*1024, args.size_io*1024)

gen_trace(args.name, args.device, args.operation, args.size_chunk, args.size_io, chunks, offsets)
