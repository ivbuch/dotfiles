#!/usr/local/bin/python3
import os
import subprocess

SESSION_NAME="perfomance"

def call_tmux_command(args):
    process = subprocess.run(["tmux"] + args, stdout=subprocess.PIPE)

def tmux_attach():    
    call_tmux_command(["select-window", "-t", SESSION_NAME + ":top"])
    call_tmux_command(["attach", "-t", SESSION_NAME])

def tmux_open_windows():    
    call_tmux_command(["send-keys", "-t", SESSION_NAME + ":top", "top", "Enter"])

    call_tmux_command(["new-window", "-t", SESSION_NAME, "-n","iotop"])
    call_tmux_command(["send-keys", "-t", SESSION_NAME + ":iotop", "sudo iotop -k -o", "Enter"])

def tmux_open_session():    
    call_tmux_command(["new", "-s", SESSION_NAME, "-d", "-n","top"])

def main():
    tmux_open_session()
    tmux_open_windows()
    rename_i3_workspace()
    tmux_attach()

def rename_i3_workspace():
    import i3ipc
    i3 = i3ipc.Connection()
    workspaces = i3.get_workspaces()
    current_workspace = next(filter(lambda w: w.focused, workspaces))
    i3.command('rename workspace "{}" to {}'.format(current_workspace.name, "perfomance"))

if __name__ == "__main__":
    main()
