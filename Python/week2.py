def parse_calculation(s):
    v = s.strip("()").split()
    return eval(v[1] + v[0] + v[2])

# ----------------------------------------------------------------

def parse_calculation_ext(s):
    start = s.rfind("(")
    stop = start + s[start:].find(")") + 1

    if start == -1:
        return eval(s)

    substring = s[start:stop]
    evaluated_string = s.replace(substring, str(parse_calculation(substring)))
    return parse_calculation_ext(evaluated_string)


def parse_calculation(s):
    v = s.strip("()").split()
    return eval(v[1] + v[0] + v[2])
