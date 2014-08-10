set print pretty on
set print object on
set print vtbl on
set follow-fork-mode child

python
import sys
import os
sys.path.insert(0, os.environ['HOME']+'/.myenv/vendor/Boost-Pretty-Printer')
from boost.printers import register_printer_gen
register_printer_gen(None)

sys.path.insert(0, os.environ['HOME']+'/.myenv/vendor/STL-Pretty-Printer')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end
