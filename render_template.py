#!/usr/bin/python

import sys

if len(sys.argv) != 2:
    sys.stderr.write("Usage: %s <version>", sys.argv[0])
    exit(1)

bahmni_version = sys.argv[1]

with open('packer/template.json') as template:
    with open ('packer/template_rendered.json', 'w') as rendered_template:
        for line in template:
            rendered_template.write(line.replace('<? version ?>', bahmni_version))
