from metakernel import Magic
from ib_pseudocode_python.cli import Transpiler
import click
import io

from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import TerminalFormatter


class TranspileMagic(Magic):

    def cell_transpile(self):
        """

        """
        transpiler = Transpiler()
        pseudocode, code = transpiler.transpile(io.StringIO(self.code))
        lexer = get_lexer_by_name("python3", stripall=True)
        formatter = TerminalFormatter()
        result = highlight(code, lexer, formatter)

        self.kernel.Print(result)
        self.evaluate = True


def register_magics(kernel):
    kernel.register_magics(TranspileMagic)
