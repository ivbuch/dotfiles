# -*- coding: utf-8 -*-
import subprocess
import re


class Py3status:
    def get_keyboard_layout_internal(self):
        f = open("/home/igor/.i3/py3status/layout.txt")
        data = f.read().replace('\n', '')
        f.close()
        return data

    def get_keyboard_layout(self):
        return {
            'full_text': self.get_keyboard_layout_internal()
        }
