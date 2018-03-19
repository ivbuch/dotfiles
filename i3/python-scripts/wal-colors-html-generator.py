import yaml

def main():
    out_filename = "/tmp/wal-colors.html"
    f = open("/home/igor/.cache/wal/colors.yml")
    props = yaml.load(f)
    out = open(out_filename, 'w')

    for prop in props['special']:
        add_to_file(out, prop, props['special'][prop])

    for prop in props['colors']:
        add_to_file(out, prop, props['colors'][prop])

    out.close()
    print("Scheme saved in " + out_filename)

def add_to_file(out, name, value):
    out.write("<div style='height: 30px; width: 100%; margin: 30px; background:{}'>".format(value))
    out.write(name + '=' + value)
    out.write("</div>\n")

if __name__ == "__main__":
    main()
