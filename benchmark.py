from __future__ import print_function
from timeit import timeit

print(timeit("haversine((39.132213, -86.12439), (38.55213, -86.94910))",
             setup="from haversine import haversine",
             number=300000))
