#!/home/igor/.virtualenvs/main_env/bin/python

import i3ipc
import subprocess
import datetime
import time
import sys


def collect_all_nodes(current_node, nodes):
    nodes.append(current_node)
    for sel_node in current_node.nodes:
        collect_all_nodes(sel_node, nodes)


def open_new_logging_window(apath):
    nodes = []
    collect_all_nodes(i3.get_tree(), nodes)
    i3.command("workspace 9")
    selected_term = [x for x in nodes if x.name is not None and apath in x.name]
    if len(selected_term) > 0:
        selected_term[0].command("move workspace 9")
        sys.exit(0)


i3 = i3ipc.Connection()
subprocess.call("/home/igor/.bin/logging_vip.sh", shell=True)

today = datetime.date.today()
path = today.strftime("%Y/%m/%d")

open_new_logging_window(path)

i3.command("exec gnome-terminal --working-directory='/var/log/midoffice/vip/{}'".format(path))

for i in range(10):
    time.sleep(0.5)
    open_new_logging_window(path)
