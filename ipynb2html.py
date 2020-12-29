# !/usr/bin/python3

import re
import os
import os.path

import nbformat 
from nbconvert import HTMLExporter
from pprint import pformat

html_exporter = HTMLExporter()

Done = False

for parent, dirs, files in os.walk(".", topdown=True):
    for name in files:
        inpath = os.path.join(parent,name)
        if not '/.' in inpath and inpath.endswith('.ipynb'):
            outpath = inpath.replace('.ipynb','.html')
            in_mtime = os.path.getmtime(inpath)
            try:
                out_mtime = os.path.getmtime(outpath)
            except:
                out_mtime = 0
            if in_mtime > out_mtime:
                try:
                    with open(inpath) as infile, open(outpath,'w') as outfile:
                        text = infile.read()
                        nb = nbformat.reads(text, as_version = 4)
                        body, resources = html_exporter.from_notebook_node(nb)
                        outfile.write(body)
                    print('Successfully rendered %s' % inpath)
                except:
                    pass
