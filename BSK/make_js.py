import argparse

parser = argparse.ArgumentParser(
                    prog='make_js',
                    epilog='Text at the bottom of help')

parser.add_argument("--script", dest="sc_file")

args = parser.parse_args()

with open(args.sc_file) as f:
    li = f.readlines()
    bal = 0
    res = ""
    for it in li:
        bal += it.count("{")
        bal -= it.count("}")
        res += it.replace("\n", "")
        if bal == 0:
            res+=";"
    print("<script>" + res + "</script>")
