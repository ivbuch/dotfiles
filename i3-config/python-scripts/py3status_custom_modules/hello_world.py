# -*- coding: utf-8 -*-
"""
Example module that says 'Hello World!'

This demonstrates how to produce a simple custom module.
"""


class Py3status:

    def hello_world(self):
        return {
            'full_text': 'Hello World!',
            'cached_until': self.py3.CACHE_FOREVER
        }
