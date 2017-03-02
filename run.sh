#!/bin/sh
# Start nginx
nginx -c /etc/nginx/nginx.conf &

# Start the Oriole Editor
ROOT=/usr/workdir/ PORT=8008 bash -c '/usr/local/bin/oriole-linux' &

# Start the Atlas Editor
ROOT=/usr/workdir/ PORT=8009 bash -c '/usr/local/bin/atlas-linux' &

  
# Start watching for changes to ipynb files
ls *.ipynb | entr jupyter nbconvert \
  --NotebookApp.TemplateExporter.template_path=['./setup', '/opt/conda/lib/python3.5/site-packages/nbconvert/templates/html/'] \
  --to html \
  --template ./setup/parse-html.tpl \
  main.ipynb \
  & 
  # Start the notebook
  jupyter notebook --NotebookApp.allow_origin='*' --no-browser --port 8888 --ip=*

