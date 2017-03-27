function! ParseRailwayLog()
    /<request>/ !python -c "import sys; import urllib.parse; text = sys.stdin.read(); print(urllib.parse.unquote_plus(text))"
    /<password>/ delete
endfunction	

function! FormatJson()
  %! python -c'import fileinput, json; print(json.dumps(json.loads("".join(fileinput.input())), sort_keys=True, indent=4, ensure_ascii=False))' 
endfunction
